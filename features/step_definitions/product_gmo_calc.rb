# Llena el campo de entrada con el valor para el producto especificado.
And(/^I enter "(.*)" in the input field "(.*)"$/) do |value, product_name|
  within(:xpath, '/html/body/form/table/tbody/tr[2]/td/div/center/table') do
    row = find('tr', text: product_name)
    row.find('input[type="text"]').set(value)
  end
end

# Hace clic en el botón "Place an order".
When(/^I click on the "Place an order" Button$/) do
  click_button('bSubmit')
end

# Verifica que el precio total por cada artículo sea correcto.
Then(/^I verify the total price for "(.*)" as "(.*)"$/) do |product_name, expected_price|
within(:xpath, "/html/body/form/table/tbody/tr[1]/td/div/center/table") do
  row = find('tr', text: product_name)
  total_price_value = row.find('td:nth-child(5)').text.strip.gsub(/[^\d\.]/, '').to_f
  expect(total_price_value).to eq(expected_price.to_f)
end
end
#
# Método para llenar las cantidades de los productos en la tabla
And(/^I fill in the product quantities in the table$/) do |tabla|
  datos = tabla.rows_hash
  datos.each_pair do |producto, cantidad|
    case producto
    when "3 Person Dome Tent"
      fill_in 'QTY_TENTS', :with => cantidad
    when "External Frame Backpack"
      fill_in 'QTY_BACKPACKS', :with => cantidad
    when "Glacier Sun Glasses"
      fill_in 'QTY_GLASSES', :with => cantidad
    when "Padded Socks"
      fill_in 'QTY_SOCKS', :with => cantidad
    when "Hiking Boots"
      fill_in 'QTY_BOOTS', :with => cantidad
    when "Back Country Shorts"
      fill_in 'QTY_SHORTS', :with => cantidad
    end
  end
end

# Función para convertir un texto a float limpiando caracteres no numéricos
def parse_to_float(text)
  text.strip.gsub(/[^\d\.]/, '').to_f
end

# Función para calcular el total de productos de una tabla
def calculate_product_total(rows)
  total = 0.0
  rows.each_with_index do |row, index|
    next if index == 0 # Saltamos la primera fila (encabezado)
    cells = row.all('td')
    next unless cells.count == 5 # Validamos que la fila tenga 5 celdas
    total_price = parse_to_float(cells[4].text)
    total += total_price
  end
  total
end

# Método para calcular el precio total de los productos
Then(/^I should see the Product Total "([^"]*)"$/) do |expected_total|
  within(:xpath, "/html/body/form/table/tbody/tr[1]/td/div/center/table") do
    rows = all("tr")
    total_products = calculate_product_total(rows)
    product_total_in_table = parse_to_float(rows[rows.count - 4].all('td')[2].text)
    expect(product_total_in_table).to eq(expected_total.to_f)
  end
end

# Método para calcular el impuesto sobre ventas esperado
And(/^I should see the correct Sales Tax "([^"]*)"$/) do |expected_tax|
  within(:xpath, "/html/body/form/table/tbody/tr[1]/td/div/center/table") do
    rows = all("tr")
    total_products = calculate_product_total(rows)

    product_total_in_table = parse_to_float(rows[rows.count - 4].all('td')[2].text)
    sales_tax_in_table = parse_to_float(rows[rows.count - 3].all('td')[1].text)

    expected_sales_tax = (total_products.round(2) * 0.05).round(2)
    expect(sales_tax_in_table).to eq(expected_tax.to_f)
  end
end

# Método para calcular el Shipping & Handling
And(/^I should see the Shipping & Handling "(.*)"$/) do |expected_shipping|
  within(:xpath, "/html/body/form/table/tbody/tr[1]/td/div/center/table") do
    rows = all("tr")
    shipping_handling_in_table = parse_to_float(rows[rows.count - 2].all('td')[1].text)
    expect(shipping_handling_in_table).to eq(expected_shipping.to_f.round(2))
  end
end

# Método para calcular el total general esperado
And(/^I should see the Grand Total "([^"]*)"$/) do |expected_grand_total|
  within(:xpath, "/html/body/form/table/tbody/tr[1]/td/div/center/table") do
    rows = all("tr")
    total_products = calculate_product_total(rows)

    product_total_in_table = parse_to_float(rows[rows.count - 4].all('td')[2].text)
    sales_tax_in_table = parse_to_float(rows[rows.count - 3].all('td')[1].text)
    grand_total_in_table = parse_to_float(rows[rows.count - 1].all('td')[1].text)

    fixed_charge = 5.0
    calculated_grand_total = (sales_tax_in_table + product_total_in_table + fixed_charge).round(2)
    expect(grand_total_in_table).to eq(calculated_grand_total.to_f)
  end
end

#
# Para verificar la notificación y aceptar el mensaje emergente
Then(/^A popup appears displaying "(.*)"$/) do |expected_message|
  alert_box = page.driver.browser.switch_to.alert
  actual_message = alert_box.text
  expect(actual_message).to eq(expected_message)
  alert_box.accept
end
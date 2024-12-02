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
Then(/^I verify the total price for each item$/) do
    within(:xpath, "/html/body/form/table/tbody/tr[1]/td/div/center/table") do
      rows = all("tr")
      rows.each_with_index do |row, idx|
        next if idx == 0
        columns = row.all('td')
        if columns.count == 5
          quantity_value = columns[0].text.strip.to_f
          price_per_unit = columns[3].text.strip.gsub(/[^\d\.]/, '').to_f
          total_price_value = columns[4].text.strip.gsub(/[^\d\.]/, '').to_f
  
          expected_total = (price_per_unit * quantity_value).round(2)
          expect(total_price_value).to eq(expected_total)
        end
      end
    end
end

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

# Método para calcular el precio total de los productos
def calcular_precio_total(rows)
    total_producto_esperado = 0.0
    rows.each_with_index do |fila, index|
      next if index == 0
      celdas = fila.all('td')
      if celdas.count == 5
        precio_total = celdas[4].text.strip.gsub(/[^\d\.]/, '').to_f
        total_producto_esperado += precio_total
      end
    end
    total_producto_esperado
end
  
Then(/^I should see the Product Total$/) do
    within(:xpath, "/html/body/form/table/tbody/tr[1]/td/div/center/table") do
      filas = all("tr")
      total_producto_esperado = calcular_precio_total(filas)
      celdas = filas[filas.count - 4].all('td')
      total_producto = celdas[2].text.strip.gsub(/[^\d\.]/, '').to_f
      expect(total_producto).to eq(total_producto_esperado.round(2))
    end
end
  
# Método para calcular el impuesto sobre ventas esperado
def calcular_impuesto_ventas(total_producto_esperado)
    (total_producto_esperado.round(2) * 0.05).round(2)
end
  
And(/^I should see the correct Sales Tax$/) do
    within(:xpath, "/html/body/form/table/tbody/tr[1]/td/div/center/table") do
      filas = all("tr")
      total_producto_esperado = calcular_precio_total(filas)
      celdas = filas[filas.count - 4].all('td')
      total_producto = celdas[2].text.strip.gsub(/[^\d\.]/, '').to_f
      celdas = filas[filas.count - 3].all('td')
      impuesto_ventas = celdas[1].text.strip.gsub(/[^\d\.]/, '').to_f
      impuesto_ventas_esperado = calcular_impuesto_ventas(total_producto_esperado)
      expect(impuesto_ventas).to eq(impuesto_ventas_esperado)
    end
  end
  
# Método para calcular el Shipping & Handling
And(/^I should see the Shipping & Handling$/) do
    within(:xpath, "/html/body/form/table/tbody/tr[1]/td/div/center/table") do
      filas = all("tr")
      total_producto_esperado = calcular_precio_total(filas)
      celdas = filas[filas.count - 2].all('td')  # Asumiendo que Shipping & Handling está en la penúltima fila
      shipping_handling = celdas[1].text.strip.gsub(/[^\d\.]/, '').to_f
      shipping_handling_esperado = 5.0
      expect(shipping_handling).to eq(shipping_handling_esperado)
    end
  end

# Método para calcular el total general esperado
def calcular_total_general(impuesto_ventas, total_producto)
    (impuesto_ventas + total_producto + 5.0).round(2)
end

And(/^I should see the Grand Total$/) do
    within(:xpath, "/html/body/form/table/tbody/tr[1]/td/div/center/table") do
      filas = all("tr")
      total_producto_esperado = calcular_precio_total(filas)
      celdas = filas[filas.count - 4].all('td')
      total_producto = celdas[2].text.strip.gsub(/[^\d\.]/, '').to_f
      celdas = filas[filas.count - 3].all('td')
      impuesto_ventas = celdas[1].text.strip.gsub(/[^\d\.]/, '').to_f
      celdas = filas[filas.count - 1].all('td')
      total_grande = celdas[1].text.strip.gsub(/[^\d\.]/, '').to_f
      total_grande_esperado = calcular_total_general(impuesto_ventas, total_producto)
      expect(total_grande).to eq(total_grande_esperado)
    end
end
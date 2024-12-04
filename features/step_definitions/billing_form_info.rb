require 'selenium-webdriver'

# Navega a la página del catálogo de GMO
Given('I navigate to the GMO Online catalog page') do
  visit 'https://demo.borland.com/gmopost/online-catalog.htm'
end

Given('I ensure I am ready to place an order') do
  expect(page).to have_content('OnLine Catalog')
end

 # Encuentra el campo de cantidad asociado al producto y escribe la cantidad
When('I input {string} in the quantity field for {string}') do |quantity, product|
  case product
  when '3 Person Dome Tent'
    fill_in 'QTY_TENTS', with: quantity
  else
    raise "Product '#{product}' is not recognized"
  end
end

# Encuentra y da clic en el botón especificado
When('I proceed by clicking the {string} button') do |button_name|
  click_button(button_name)
end

# Verifica que la página especificada esté visible
Then('the {string} page should appear') do |page_name|
  expect(page).to have_content(page_name)
end

# Encuentra y da clic en el botón especificado
Then('I click the {string} button on the page') do |button_name|
  click_button(button_name)
end

# Verifica que la página especificada esté visible
Then('the {string} page should be displayed') do |page_name|
  expect(page).to have_content(page_name)
end

 # Llena el formulario de facturación con los datos proporcionados
Then('I complete the billing form with the following details:') do |table|
 
  data = table.rows_hash
  fill_in 'billName', with: data['Name']
  fill_in 'billAddress', with: data['Address']
  fill_in 'billCity', with: data['City']
  fill_in 'billState', with: data['State']
  fill_in 'billZipCode', with: data['Zip']
  fill_in 'billPhone', with: data['Phone']
  fill_in 'billEmail', with: data['E-mail']
  select data['Card Type'], from: 'CardType'
  fill_in 'CardNumber', with: data['Card Number']
  fill_in 'CardDate', with: data['Expiration']
end

# Localiza el checkbox usando el XPath proporcionado
Then('I check the box {string}') do |checkbox_label|
  checkbox = find(:xpath, '/html/body/form/table/tbody/tr[2]/td[3]/table/tbody/tr[1]//input[@type="checkbox"]', visible: true)

  # Marca el checkbox si no está marcado
  unless checkbox.checked?
    checkbox.check
  end
end

# Encuentra y hace clic en el botón especificado por el nombre
When('I finalize the purchase by clicking {string} button') do |button_name|
  click_button(button_name)
end

# Llena las cantidades para múltiples productos
When('I provide the following quantities:') do |table|
  table.hashes.each do |row|
    product = row['Product']
    quantity = row['Quantity']
    step %Q(I input "#{quantity}" in the quantity field for "#{product}")
  end
end

# Extrae los datos esperados de la tabla
Then('I should see the receipt page with the following details:') do |table|
  
  expected_details = table.rows_hash

  # Verifica la presencia del encabezado de agradecimiento
  expect(page).to have_content('Thank you for shopping with Green Mountain Outpost')

  # Divide y verifica cada parte del texto de "Bill to"
  expected_bill_to = expected_details['Bill to'].split(', ')
  expected_bill_to.each do |line|
    expect(page).to have_content(line)
  end

  # Divide y verifica cada parte del texto de "Ship to"
  expected_ship_to = expected_details['Ship to'].split(', ')
  expected_ship_to.each do |line|
    expect(page).to have_content(line)
  end

  # Verifica los detalles del producto
  expect(page).to have_content(expected_details['Product'])
  expect(page).to have_content(expected_details['Qty'])
  expect(page).to have_content(expected_details['Unit Price'])
  expect(page).to have_content(expected_details['Total Price'])

  # Verifica el total general
  expect(page).to have_content(expected_details['Grand Total'])
end

# Verifica la presencia del encabezado de alerta
Then('I should see an alert with the text {string}') do |expected_text|
  alert = page.driver.browser.switch_to.alert
  expect(alert.text).to eq(expected_text)
  alert.accept
end
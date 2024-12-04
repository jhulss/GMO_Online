require 'selenium-webdriver'

Given('I navigate to the GMO Online catalog page') do
  # Navega a la página del catálogo de GMO
  visit 'https://demo.borland.com/gmopost/online-catalog.htm'
end

Given('I ensure I am ready to place an order') do
  # Opcionalmente, puedes añadir validaciones aquí
  expect(page).to have_content('OnLine Catalog')
end

When('I input {string} in the quantity field for {string}') do |quantity, product|
  # Encuentra el campo de cantidad asociado al producto y escribe la cantidad
  case product
  when '3 Person Dome Tent'
    fill_in 'QTY_TENTS', with: quantity
  else
    raise "Product '#{product}' is not recognized"
  end
end

When('I proceed by clicking the {string} button') do |button_name|
  # Encuentra y da clic en el botón especificado
  click_button(button_name)
end

Then('the {string} page should appear') do |page_name|
  # Verifica que la página especificada esté visible
  expect(page).to have_content(page_name)
end

Then('I click the {string} button on the page') do |button_name|
  # Encuentra y da clic en el botón especificado
  click_button(button_name)
end

Then('the {string} page should be displayed') do |page_name|
  # Verifica que la página especificada esté visible
  expect(page).to have_content(page_name)
end

Then('I complete the billing form with the following details:') do |table|
  # Llena el formulario de facturación con los datos proporcionados
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

Then('I check the box {string}') do |checkbox_label|
  # Localiza el checkbox usando el XPath proporcionado
  checkbox = find(:xpath, '/html/body/form/table/tbody/tr[2]/td[3]/table/tbody/tr[1]//input[@type="checkbox"]', visible: true)

  # Marca el checkbox si no está marcado
  unless checkbox.checked?
    checkbox.check
  end
end

When('I finalize the purchase by clicking {string} button') do |button_name|
  # Encuentra y hace clic en el botón especificado por el nombre
  click_button(button_name)
end


When('I provide the following quantities:') do |table|
  # Llena las cantidades para múltiples productos
  table.hashes.each do |row|
    product = row['Product']
    quantity = row['Quantity']
    step %Q(I input "#{quantity}" in the quantity field for "#{product}")
  end
end

Then('I should see the receipt page with the following details:') do |table|
  # Extrae los datos esperados de la tabla
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

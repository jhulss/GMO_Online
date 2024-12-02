# Este paso maximiza la ventana del navegador y navega a la página de productos
Given('the user has navigated to the product page') do
    page.driver.browser.manage.window.maximize
    visit 'https://demo.borland.com/gmopost/products.htm#backpacks'
  end
  
# Este paso verifica que el título del producto coincida con el texto esperado
Then('they should see the product title as {string}') do |expected_title|
    product_name = page.find(:xpath, '/html/body/h2[2]').text.strip
    expect(product_name).to eq(expected_title)
end

# Este paso verifica que el subtítulo del producto coincida con el texto esperado
Then('the subtitle displayed as {string}') do |expected_subtitle|
    tagline = page.find(:xpath, '/html/body/p[8]/font/em').text.strip
    expect(tagline).to eq(expected_subtitle)
end

# Este paso verifica que el precio del producto coincida con el texto esperado
Then('the price listed as {string}') do |expected_price|
    displayed_price = page.find(:xpath, '/html/body/div[2]/table/tbody/tr[1]/td[3]').text.strip
    expect(displayed_price).to eq(expected_price)
end

# Este paso verifica que la cantidad de stock disponible coincida con el texto esperado
Then('the available stock should indicate {string}') do |expected_units|
    available_units = page.find(:xpath, '/html/body/div[2]/table/tbody/tr[2]/td[2]').text.strip
    expect(available_units).to eq(expected_units)
end

# Este paso verifica que el número de ítem coincida con el texto esperado
Then('the item number should be {string}') do |expected_identifier|
    product_id = page.find(:xpath, '/html/body/div[2]/table/tbody/tr[3]/td[2]').text.strip
    expect(product_id).to eq(expected_identifier)
end

# Este paso verifica que la descripción del producto coincida con el texto esperado
Then('the product description should be:') do |expected_description|
    description = page.find(:xpath, '/html/body/p[9]').text.strip
    expect(description).to eq(expected_description.strip)
end
  
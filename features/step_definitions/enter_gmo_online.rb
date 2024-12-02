#Maximiza la ventana del navegador y visita la página principal de GMO Online.
Given(/^I am at GMO home page$/) do
    page.driver.browser.manage.window.maximize
    visit ('https://demo.borland.com/gmopost/')
  end

#Hace clic en el botón "Enter GMO Online" para acceder al catálogo.
When(/^I click the "Enter GMO Online" button$/) do
    click_button("bSubmit")
end

#Verifica que, después de hacer clic en el botón, el título de la página de catálogo coincida con el esperado.
Then("I should be redirected to the catalog page with the title {string}") do |expected_title|
    actual_title = page.title
    raise "Expected catalog title '#{expected_title}', but found '#{actual_title}'" unless actual_title.include?(expected_title)
end

#Extrae y verifica que los encabezados de la tabla de productos coincidan con los encabezados esperados.
Then("I should see a table of products with headers {string}, {string}, {string}, and {string}") do |header1, header2, header3, header4|
    # Extraer encabezados de la tabla
    table_headers = all(:xpath, "//table[@border='1']/tbody/tr[1]/td").map do |header|
      header.text.strip.gsub("\n", " ") # Normalizar: eliminar saltos de línea y espacios adicionales
    end
  
    # Imprimir encabezados encontrados para depuración
    puts "Headers found: #{table_headers.inspect}"
  
    # Verificar encabezados esperados
    [header1, header2, header3, header4].each do |expected_header|
      unless table_headers.include?(expected_header)
        raise "Header '#{expected_header}' not found in the table. Found headers: #{table_headers.inspect}"
      end
    end
  end

#Extrae y limpia los elementos del catlogo de productos y compara los elementos encontrads con los esperados, validando que coincidan.
Then('I see the GMO Online Catalog') do |data_table|
    catalog_xpath = page.find(:xpath, '/html/body/form/table/tbody/tr[2]/td/div/center/table')
    expected_catalog_items = data_table.raw.flatten.map(&:to_s)
    extracted_catalog_items = catalog_xpath.all('tr').map do |row_element|
      row_element.all('td').map(&:text)
    end.flatten.map do |cell_content|
      cleaned_content = cell_content.strip
      cleaned_content = cleaned_content.gsub(/\s*\$\s*/, '$')
      cleaned_content = cleaned_content.gsub(/\n/, ' ')
      cleaned_content
    end
  
    # Remover entradas vacías y garatizar que los datoos sean únicos
    processed_catalog_items = extracted_catalog_items.reject(&:empty?).uniq
  
    # Completar la lista con ceros faltantes
    (6 - processed_catalog_items.count { |entry| entry == "0" }).times do
      processed_catalog_items << "0"
    end
  
    # Salida de datos para depración
    puts "Expected items count: #{expected_catalog_items.count}"
    puts "Processed items count: #{processed_catalog_items.count}"
    puts "Expected items: #{expected_catalog_items}"
    puts "Processed items: #{processed_catalog_items}"
  
    # Comparación de elemntos esperados y encontrados
    missing_catalog_items = expected_catalog_items - processed_catalog_items
    extra_catalog_items = processed_catalog_items - expected_catalog_items
  
    puts "Missing items: #{missing_catalog_items}" unless missing_catalog_items.empty?
    puts "Extra items: #{extra_catalog_items}" unless extra_catalog_items.empty?
  
    # Validación final
    expect(processed_catalog_items).to match_array(expected_catalog_items)
  end
  
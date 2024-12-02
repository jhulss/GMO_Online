# Abre la página de inicio de la aplicación.
Given("I access the Google homepage") do
  visit "/"
end

# Verifica que el título de la página contenga un texto específico.
Then("I should see the text {string}") do |expected_title|
  actual_title = page.title
  raise "Expected title '#{expected_title}', but found '#{actual_title}'" unless actual_title.include?(expected_title)
end

# Verifica que el encabezado de la página (elemento <h1>) tenga un texto específico.
Then("the main header must show {string}") do |expected_header|
  header_element = find("h1", text: expected_header, match: :prefer_exact)
  raise "Header text does not match. Found '#{header_element.text}'" unless header_element.text == expected_header
end

# Verifica que dos botones específicos estén presentes en la página.
Then("the buttons labeled {string} and {string} should appear") do |button1, button2|
  [button1, button2].each do |button|
    unless has_button?(button)
      raise "Button '#{button}' is not present on the page."
    end
  end
end

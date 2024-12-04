Given(/^I am on the Green Mountain Outpost page$/) do
  visit('https://demo.borland.com/gmopost/browser-test.htm')
end

When(/^I click on the "Left or Right" button$/) do
  find(:xpath, "/html/body/form[2]/p/input").click
end

Then(/^I should see an alert displaying the text "This button AND the GMO image should be on the right edge of the page!"$/) do
  expect(page.driver.browser.switch_to.alert.text).to eq("This button AND the GMO image should be on the right edge of the page!")
  page.driver.browser.switch_to.alert.accept
end

Then(/^the page should display the header "([^"]*)"$/) do |header_text|
  header = find(:xpath, "//h1")
  expect(header.text).to eq(header_text)
end

Then(/^the technologies listed for Internet Explorer 3.0 should include:$/) do |table|
  # Encuentra el <td> que contiene los tres <ul> bajo el título "Blinking Text"
  td_tech_list = find(:xpath, "/html/body/div/center/table/tbody/tr/td[2]/table/tbody/tr[2]/td[1]")
  
  # Encuentra todas las listas <ul> dentro de este <td>
  ul_list = td_tech_list.all(:xpath, ".//ul")
  
  # Extrae el texto del <font> dentro de cada <li> de cada <ul>
  tech_items = ul_list.flat_map do |ul|
    ul.all(:xpath, ".//li/p/font").map(&:text)
  end

  # Verifica que cada tecnología de la tabla esté presente en la lista extraída
  table.raw.each do |row|
    expect(tech_items).to include(row[0])
  end
end

Then(/^the footer should contain the text "([^"]*)"$/) do |footer_text|
  footer = find(:xpath, "/html/body/p[2]/font/strong")
  expect(footer.text).to include(footer_text)
end

Then(/^the page should display the title "([^"]*)" inside the body$/) do |body_title|
  # Verificar que el título dentro del body coincide con el texto dado
  body_title_element = find(:xpath, "/html/body/h1/font")
  expect(body_title_element.text).to eq(body_title)
end

Then(/^the page title should be "([^"]*)"$/) do |page_title|
  expect(page.title).to eq(page_title)
end

Then(/^I should see the text "([^"]*)" moving from right to left$/) do |moving_text|
  moving_text_element = find(:xpath, "/html/body/p[1]/font/em/strong/marquee")
  expect(moving_text_element.text).to eq(moving_text)
end

# Hooks
Before do
  page.driver.browser.manage.window.maximize
end

Given(/^I am on the Green Mountain Outpost browser test page$/) do
  visit('https://demo.borland.com/gmopost/browser-test.htm')
end

When(/^I click on the "Left or Right" button$/) do
  find(:xpath, "/html/body/form[2]/p/input").click
end

When(/^I verify the page layout$/) do
  expect(page).to have_selector(:xpath, "//h1", text: "All Browsers Are Not Created Equal")
end

When(/^I scroll to the technologies section$/) do
  page.execute_script("window.scrollTo(0, document.body.scrollHeight / 2);")
end

When(/^I scroll to the footer section$/) do
  page.execute_script("window.scrollTo(0, document.body.scrollHeight);")
end

When(/^I check the body title$/) do
  expect(page).to have_selector(:xpath, "/html/body/h1/font")
end

When(/^I observe the moving text$/) do
  # Simplemente indica que observamos el texto en movimiento
  expect(page).to have_selector(:xpath, "/html/body/p[1]/font/em/strong/marquee")
end

Then(/^I should see an alert displaying the text "([^"]*)"$/) do |alert_text|
  expect(page.driver.browser.switch_to.alert.text).to eq(alert_text)
  page.driver.browser.switch_to.alert.accept
end

Then(/^the page should display the header "([^"]*)"$/) do |header_text|
  header = find(:xpath, "//h1")
  expect(header.text).to eq(header_text)
end

Then(/^the technologies listed for Internet Explorer 3.0 should include:$/) do |table|
  td_tech_list = find(:xpath, "/html/body/div/center/table/tbody/tr/td[2]/table/tbody/tr[2]/td[1]")
  ul_list = td_tech_list.all(:xpath, ".//ul")
  tech_items = ul_list.flat_map { |ul| ul.all(:xpath, ".//li/p/font").map(&:text) }
  table.raw.each { |row| expect(tech_items).to include(row[0]) }
end

Then(/^the page should display the title "([^"]*)" inside the body$/) do |body_title|
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

Then(/^the footer should contain the text "([^"]*)"$/) do |footer_text|
  footer = find(:xpath, "/html/body/p[2]/font/strong")

  footer_text_actual = footer.text

  puts "Footer Text Actual: #{footer_text_actual}"

  footer_text_actual = footer_text_actual.gsub("\n", "\\n")

  expect(footer_text_actual).to include(footer_text)
end

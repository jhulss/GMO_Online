#Maximiza la ventana del navegador y navega a la página de inicio
When(/^I click on the "About The GMO Site" link$/) do
    page.driver.browser.manage.window.maximize
    visit('https://demo.borland.com/gmopost/')
    find(:xpath, '/html/body/form/div[1]/center/table/tbody/tr/td[2]/input').click
  end
  
Then(/^I should be redirected to the About page$/) do
    expect(page).to have_current_path('https://demo.borland.com/gmopost/about.htm', url: true)
  end
  
Then(/^I should see information about the GMO site$/) do
    expect(page).to have_xpath('/html/body/table/tbody/tr/td[1]/h1')
  end
  
Given(/^the user has navigated to the "About This Site" page$/) do
    page.driver.browser.manage.window.maximize
    visit('https://demo.borland.com/gmopost/about.htm')
  end

When(/^the user verifies they are on the correct page$/) do
  expect(page).to have_current_path('https://demo.borland.com/gmopost/about.htm', url: true)
end  

Then(/^the title of the page should be "About This Site"$/) do
    expect(page).to have_title('About This Site')
  end
  
Then(/^the subtitle should state:$/) do |subtitle|
    expect(page).to have_xpath('/html/body/h4[1]/font', text: subtitle.strip)
    
  end
  
Then(/^the security warning should display:$/) do |warning|
    element_text = find(:xpath, '/html/body/h4[2]/font').text.strip.gsub("\n", " ")
    expect(element_text).to eq(warning.strip.gsub("\n", " "))
  end
  
Then(/^the page should list the incorporated technologies:$/) do |table|
    tech_list = find(:xpath, '/html/body/div/center/table/tbody/tr[2]/td[1]/blockquote/ul')
    
    tech_items = tech_list.all('li').map { |li| li.find('font').text.strip }
  
    table.raw.each do |row|
      expect(tech_items).to include(row[0])
    end
  end
  
Then(/^the page should list possible future technologies:$/) do |table|
    table.raw.each do |row|
      expect(page).to have_xpath('/html/body/div/center/table/tbody/tr[2]/td[2]/blockquote/ul', text: row[0])
    end
  end
  
Then(/^the footer should contain a disclaimer stating:$/) do |disclaimer|
    expect(page).to have_xpath('/html/body/p[1]/font/strong', text: disclaimer.strip)
  end
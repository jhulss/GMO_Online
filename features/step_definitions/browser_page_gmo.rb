Given(/^I am on the Green Mountain Outpost page$/) do
    visit('https://demo.borland.com/gmopost/browser-test.htm')
  end
  
  When(/^I click on the "Left or Right" button$/) do
    # Interactuar con el botón utilizando un selector por su texto
    find(:xpath, "/html/body/form[2]/p/input").click
  end
  
  Then(/^I should see an alert with the text "Please let us know how you like our site"$/) do
    # Verificar que la alerta aparece con el texto correcto
    expect(page.driver.browser.switch_to.alert.text).to eq("This button AND the GMO image should be on the right edge of the page!")
    # Aceptar la alerta
    page.driver.browser.switch_to.alert.accept
  end
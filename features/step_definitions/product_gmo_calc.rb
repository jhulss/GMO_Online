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
  
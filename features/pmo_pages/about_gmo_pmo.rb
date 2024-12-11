# features/pages/gmo_page.rb

class GmoPage
    include Capybara::DSL
  
    # Método para abrir la página de inicio
    def open
      page.driver.browser.manage.window.maximize
      visit('https://demo.borland.com/gmopost/')
    end
  
    # Método para hacer clic en el enlace "About The GMO Site"
    def click_about_link
      find(:xpath, '/html/body/form/div[1]/center/table/tbody/tr/td[2]/input').click
    end
  
    # Método para verificar el layout de la página "About Gmo"
    def has_about_page_layout?
      page.has_selector?(:xpath, "//h1", text: "About This Site")
    end
  
    # Método para verificar si estamos en la página "About"
    def be_on_about_page?
      page.has_current_path?('https://demo.borland.com/gmopost/about.htm', url: true)
    end
  
    # Método para verificar la información sobre el GMO
    def has_gmo_site_info?
      page.has_xpath?('/html/body/table/tbody/tr/td[1]/h1')
    end
  
    # Método para navegar directamente a la página "About This Site"
    def open_about_page
      visit('https://demo.borland.com/gmopost/about.htm')
    end
  
    # Método para verificar el título de la página
    def has_page_title?(title)
      page.has_title?(title)
    end
  
    # Método para verificar el subtítulo
    def has_subtitle?(subtitle)
      page.has_xpath?('/html/body/h4[1]/font', text: subtitle.strip)
    end
  
    # Método para verificar la advertencia de seguridad
    def has_security_warning?(warning)
      element_text = find(:xpath, '/html/body/h4[2]/font').text.strip.gsub("\n", " ")
      element_text == warning.strip.gsub("\n", " ")
    end
  
    # Método para listar las tecnologías incorporadas
    def list_incorporated_technologies(table)
      tech_list = find(:xpath, '/html/body/div/center/table/tbody/tr[2]/td[1]/blockquote/ul')
      tech_items = tech_list.all('li').map { |li| li.find('font').text.strip }
      table.raw.each do |row|
        tech_items.include?(row[0])
      end
    end
  
    # Método para listar las tecnologías futuras
    def list_possible_future_technologies(table)
      table.raw.each do |row|
        page.has_xpath?('/html/body/div/center/table/tbody/tr[2]/td[2]/blockquote/ul', text: row[0])
      end
    end
  
    # Método para verificar el disclaimer del pie de página
    def has_footer_disclaimer?(disclaimer)
      page.has_xpath?('/html/body/p[1]/font/strong', text: disclaimer.strip)
    end
  end
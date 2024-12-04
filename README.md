# GMO OnLine
Green Mountain Outpost's OnLine Catalog

## Descripción
Green Mountain Outpost es una aplicación web de demostración que simula un catálogo en línea de productos para actividades al aire libre, como tiendas de campaña, mochilas y gafas de sol. 
Es utilizado con fines educativos y para pruebas de herramientas de automatización. 
Green Mountain Outpost permite a los usuarios explorar su diseño y funcionalidad, ofreciendo un entorno ideal para realizar pruebas en interfaces de usuario, flujos de datos y experiencias de navegación en aplicaciones web.

## Requerimientos

- [Ruby](https://rubyinstaller.org/downloads/)
- [WebDriver for Chrome](https://chromedriver.chromium.org/downloads)

## Ruby Gems

```bash
> gem install cucumber
> gem install capybara
> gem install selenium-webdriver
> gem install selenium
> gem install rspec
> gem install capybara-screenshot
```

## Comando para correr un feature en específico
```bash
> cucumber features\[feature_file_name.feature]
```

## Comando para correr todos los features implementados
```bash
> cucumber features
```

## Comando para exportar un reporte tipo HTML de las features, luego se guarda en la carpeta reports
```bash
> cucumber features -f html -o reports/reportGMOPost.html
```


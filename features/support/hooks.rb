#encoding: utf-8

# o default do watir é o chrome, caso você queira iniciar com outro tipo de browser é so passar após o .new :firefox
browser = Watir::Browser.new
browser.driver.manage.window.maximize

Before do 
    #estamos setando o referencia do browser para uma variavel global chamada @browser
    @browser = browser
  end

#Print a cada step
AfterStep do |step|
  #vai entrar no IF quando houver alguma imagem capturada
  embed("data:image/png;base64,#{$img_gerada}",'image/png') if !$img_gerada.nil? 
end
  

After do |scenario|
  if scenario.failed?
    browser.screenshot.save 'screenshot.png'
    embed 'screenshot.png', 'image/png'
  end
end
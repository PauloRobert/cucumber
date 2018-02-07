Dado("que estou na tela de login") do
   
    @browser.goto "https://br.linkedin.com/"
    captura_imagem
    end
  
  Quando("tento fazer um login com um usuário válido") do
    
    @browser.text_field(class:"login-email").set "email"
    @browser.text_field(class:"login-password").click
    @browser.text_field(class:"login-password").set "senha"
    @browser.button(id:"login-submit").click
    captura_imagem
  end
  
  Então("devo me logar") do
    #espera
    text = @browser.div(class:"feed-identity-module profile-rail-card container ember-view").text    

    # expect vai validar se o text exist , caso não tenha ele retorna false e o teste ira quebrar e no terminal você vai poder ver
    expect(text.include?("Paulo Roberto")).to be true
    
    sleep 1
    captura_imagem
  end

  Então("Navego para a pagina de pesquisa") do
    @browser.goto "https://www.linkedin.com/mynetwork/"
    captura_imagem
    sleep 1
  end
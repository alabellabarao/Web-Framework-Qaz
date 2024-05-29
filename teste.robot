** Settings **
Library  SeleniumLibrary
Library  BuiltIn

** Variables **
${SITE_URL}  https://automationpratice.com.br/
${SITE_URL_Google}  https://google.com/
${USUARIO_EMAIL}  novo@gmail.com
${USUARIO_SENHA}  123456
${CAMINHO_LOGIN}  xpath://a[@href='/login']
${LOGIN_REALIZADO}  Login realizado

** keywords **
Abrir Site da qazando
    open Browser  ${SITE_URL}  chrome
    Maximize Browser Window

Abrir esse site
    [Arguments]   ${url} 
    open Browser  ${url}  chrome
    Maximize Browser Window

Abrir Site Google
    open Browser  ${SITE_URL_Google}  chrome
    Maximize Browser Window

Aguardar site carregar
    sleep  5s

Clicar sobre o botao Login
    Click Element  ${CAMINHO_LOGIN}

Verificar texto login realizado
# get text  pega o texto do id
    ${texto_atual}  Get Text  id:swal2-title

# comando para comparar que as duas strings são iguais (as duas passadas por parâmetro), 
#  ${texto_atual}  ${LOGIN_REALIZADO}
    Should Be Equal As Strings  ${texto_atual}  ${LOGIN_REALIZADO}

# comando para comparar que as duas strings são iguais, comparando uma variável ${texto_atual}
#  com a string (propriamente dita)
    Should Be Equal As Strings  ${texto_atual}  Login realizado

Digitar e-mail
    Input Text  id:user  ${USUARIO_EMAIL}

Digitar senha
    Input Text  id:password  ${USUARIO_SENHA}

Clicar no botao Login
    Click Element  id:btnLogin
    

** Test Cases **

Cenário 1: Acessando o site do Robot
    [Tags]  Acessaqazando
    Abrir Site da qazando
    Aguardar site carregar
    Clicar sobre o botao Login
    Aguardar site carregar
    Digitar e-mail
    Digitar senha
    Aguardar site carregar
    Clicar no botao Login
    Aguardar site carregar
    Verificar texto login realizado
    
 Cenário 2: Testando o site do Google
    [Tags]  Acessagoogle
    Abrir Site Google
    Aguardar site carregar
   
Cenário 3: Testando valor no teste
    [Tags]  Acessaqazandoargumento
    Abrir esse site  https://automationpratice.com.br/
    Aguardar site carregar
    Clicar sobre o botao Login
    Aguardar site carregar
    Digitar e-mail
    Digitar senha
    Aguardar site carregar
    Clicar no botao Login
    Aguardar site carregar
    Verificar texto login realizado
    
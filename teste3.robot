** Settings **
Library  SeleniumLibrary
Library  BuiltIn

** Variables **
${SITE_URL}  https://automationpratice.com.br/
${USUARIO_EMAIL}  novo@gmail.com
${USUARIO_SENHA}  123456
${CAMINHO_LOGIN}  xpath://a[@href='/login']
${LOGIN_REALIZADO}  Login realizado

** keywords **
Abrir Site da qazando
    open Browser  ${SITE_URL}  chrome
    Maximize Browser Window
    Esperar elemento    5

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
    
Tirar print 
    Capture Page Screenshot

Esperar elemento
    [Arguments]     ${tempo}
    Set Selenium Implicit Wait     ${tempo}s

** Test Cases **

Cenário 1: Acessando o site do Robot
    [Tags]  Acessaqazando
    Abrir Site da qazando
    Clicar sobre o botao Login
    Digitar e-mail
    Digitar senha
    Clicar no botao Login
    Verificar texto login realizado

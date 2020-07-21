***Settings***
Documentation       Neste arquivo será armazenado todas as keywords da implementação da automação de testes


***Keywords***
Dado que eu acesso a página principal
    Go To           ${base_url}


Quando submeto meu email "${email}"
    Wait Until Element Is Visible           ${CAMPO_EMAIL}
    Input Text                              ${CAMPO_EMAIL}     ${email}
    Click Button                            ${BTN_ENTRAR}

Então devo ser logado com sucesso
    Wait Until Element Is Visible             ${DIV_DASH}


Então devo ver a mensagem "${message_alert}"
    Wait Until Element Contains             ${ALERT_TEXT}          ${message_alert}


Dado que "${produto}" é um novo prato
    Set Test Variable       ${produto}


Quando faço o cadastro desse prato
    Wait Until Element Is Visible       ${BTN_ADD_PRATO}   5
    Click Button                        ${BTN_ADD_PRATO}
    
    Choose File                         ${CAMPO_FOTO}         ${EXECDIR}\\resources\\images\\${produto['img']}

    Input Text                          ${CAMPO_NOME}         ${produto['nome']}
    Input Text                          ${CAMPO_TIPO}        ${produto['tipo']}
    Input Text                          ${CAMPO_PRECO}        ${produto['preco']}
    Click Button                        ${BTN_CADASTRAR}



Então devo vizualizar este prato no meu dashboard
    Wait Until Element Contains         ${DIV_LIST}         ${produto['nome']} 
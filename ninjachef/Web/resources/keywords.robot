***Settings***
Documentation       Neste arquivo será armazenado todas as keywords da implementação da automação de testes


***Keywords***

# REALIZANDO LOGIN
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

# FIM DAS KEYWORDS DO LOGIN


# CADASTRANDO NOVO PRATO
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

# FIM DO CADASTRO DE NOVO PRATO


# KEYWORDDS DO CENARIO DE RECEBER NOVO PEDIDO, COM INTEGRAÇÃO COM A API.
Dado que "${email_cozinheiro}" é minha conta de cozinheiro
    Set Test Variable       ${email_cozinheiro}

    ${token_cozinhero}=             Get Api Login                   ${email_cozinheiro}
    Set Test Variable               ${token_cozinhero}

E "${email_cliente}" é meu email do meu cliente
    Set Test Variable       ${email_cliente}

    ${token_cliente}=               Get Api Login            ${email_cliente}
    Set Test Variable               ${token_cliente}

E que "${produto}" está cadastrado no meu dashboard
    Set Test Variable       ${produto}

    &{payload}=         Create Dictionary       name=${produto}   plate=Tipo     price=21.00

    ${files_image}      Get Binary File         ${EXECDIR}\\resources\\images\\hamburge.jpg
    &{file}=            Create Dictionary       thumbnail=${files_image}

    &{headers}=         Create Dictionary       user_id=${token_cozinhero}

    Create Session      ninja           ${api_url}
    ${resp}=            Post Request    ninja        /products        data=${payload}       headers=${headers}    files=${file}
    Status Should Be    200            ${resp}

    ${token_produto}              Convert To String           ${resp.json()['_id']}
    Set Test Variable             ${token_produto}

    Go To                                   ${base_url} 
    
    Input Text	                            ${CAMPO_EMAIL}       ${email_cozinheiro}
    Click Button                            ${BTN_ENTRAR} 
    Wait Until Page Contains Element        ${DIV_DASH}

Quando o cliente solicita o preparo de um dos meus pratos

    &{payload}=         Create Dictionary       payment=Cartão
    &{headers}=         Create Dictionary       Content-Type=application/json        user_id=${token_cliente}

    Create Session      ninja           ${api_url}
    ${resp}=            Post Request    ninja        /products/${token_produto}/orders        data=${payload}       headers=${headers}
    Status Should Be    200             ${resp}

Então devo receber uma notificação do pedido
    ${mensagem_pedido}              Convert To String          ${email_cliente} está solicitando o preparo do seguinte prato: ${produto}.
    Wait Until Page Contains        ${mensagem_pedido}         6

E posso aceitar ou rejeitar esse pedido
    Wait Until Page Contains        ACEITAR     5
    Wait Until Page Contains        REJEITAR    5
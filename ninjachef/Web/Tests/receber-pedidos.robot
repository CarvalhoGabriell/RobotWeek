***Settings***
Documentation       Suite dos testes de pedidos recebidos sendo eu um cozinheiro
...                 Assim que o usuário enviar sua solicitação de preparo de um prato
...                 E dessa forma eu possa aceitar e enviar seu pedido.

Library             Collections
Library             RequestsLibrary
Library             OperatingSystem
Resource            ../resources/base.robot

Test Setup          Open Session
Test Teardown       Close Session

***Test Cases***
Receber novos Pedidos
    Dado que "tomper@eu.com" é minha conta de cozinheiro
    E "qagabiru@rio.com" é meu email do meu cliente
    E que "Sanduiche de pernil com pimentões e especiarias" está cadastrado no meu dashboard
    Quando o cliente solicita o preparo de um dos meus pratos
    Então devo receber uma notificação de pedido
    E posso aceitar ou rejeitar esse pedido


***Keywords***
Dado que "${email_cozinheiro}" é minha conta de cozinheiro
    Set Test Variable       ${email_cozinheiro}

    &{payload}=         Create Dictionary       email=${email_cozinheiro}
    &{headers}=         Create Dictionary       Content-Type=application/json

    Create Session      ninja           http://ninjachef-api-qaninja-io.umbler.net
    ${resp}=            Post Request    ninja        /sessions        data=${payload}       headers=${headers}
    Status Should Be    200             ${resp}

    ${token_cozinhero}              Convert To String           ${resp.json()['_id']}
    Set Test Variable               ${token_cozinhero}

E "${email_cliente}" é meu email do meu cliente
    Set Test Variable       ${email_cliente}

    &{payload}=         Create Dictionary       email=${email_cliente}
    &{headers}=         Create Dictionary       Content-Type=application/json

    Create Session      ninja           http://ninjachef-api-qaninja-io.umbler.net
    ${resp}=            Post Request    ninja        /sessions        data=${payload}       headers=${headers}
    Status Should Be    200             ${resp}

    ${token_cliente}              Convert To String           ${resp.json()['_id']}
    Set Test Variable             ${token_cliente}

E que "${produto}" está cadastrado no meu dashboard
    Set Test Variable       ${produto}

    &{payload}=         Create Dictionary       name=${produto}   plate=Tipo     price=21.00

    ${files_image}      Get Binary File         ${EXECDIR}\\resources\\images\\hamburge.jpg
    &{file}=            Create Dictionary       thumbnail=${files_image}

    &{headers}=         Create Dictionary       user_id=${token_cozinhero}

    Create Session      ninja           http://ninjachef-api-qaninja-io.umbler.net
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

    Create Session      ninja           http://ninjachef-api-qaninja-io.umbler.net
    ${resp}=            Post Request    ninja        /products/${token_produto}/orders        data=${payload}       headers=${headers}
    Status Should Be    200             ${resp}

    Sleep               6
    # ${token_cliente}              Convert To String           ${resp.json()['_id']}
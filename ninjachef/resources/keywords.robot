***Settings***
Documentation     Neste arquivo vão ficar todas as keywords da implementação da automação!

***Keywords***
Dado que eu acesso a página principal
    Go To        http://ninjachef-qaninja-io.umbler.net/ 


Quando submeto meu email "${email}"
    Input Text	       id:email        ${email}
    Click Button       css:button[type=submit]                   ##xpath://button[@class='btn btn-primary']

Então devo ser logado com sucesso
    Wait Until Page Contains Element        class:dashboard

Então devo ver a mensagem "${mensagem_alerta}"
    Wait Until Element Contains     class:alert        ${mensagem_alerta}



## CADASTRO DE PRATOS
Dado que "${produto}" é um novo prato
    Set Test Variable       ${produto}

Quando faço o cadastro desse prato
    Wait Until Element Is Visible       class:btn-add      10
    Click Element       class:btn-add

    Choose File         css:input[id=thumbnail]         ${EXECDIR}/resources/images/${produto['img']}
    Input Text          id:name         ${produto['nome']}
    Input Text          id:plate        ${produto['tipo']}
    Input Text          id:price        ${produto['preco']}
    Sleep               5
    Click Button        id:novoPrato

Então devo vizualizar este prato no meu dashboard
    Wait Until Element Contains     class:product-list      ${produto}
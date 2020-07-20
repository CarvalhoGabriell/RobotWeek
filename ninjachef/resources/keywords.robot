***Settings***
Documentation       Neste arquivo será armazenado todas as keywords da implementação da automação de testes


***Keywords***
Dado que eu acesso a página principal
    Go To           ${base_url}


Quando submeto meu email "${email}"
    Wait Until Element Is Visible           id:email
    Input Text                              id:email    ${email}
    Click Button                            class:btn-primary

Então devo ser logado com sucesso
    Wait Until Page Contains Element             class:dashboard


Então devo ver a mensagem "${message_alert}"
    Wait Until Element Contains             class:alert         ${message_alert}


Dado que "${produto}" é um novo prato
    Set Test Variable       ${produto}



Quando faço o cadastro desse prato
    Wait Until Element Is Visible       class:btn-add   5
    Click Button                        class:btn-add
    
    Choose File                         css:input[id=thumbnail]         ${EXECDIR}\\resources\\images\\${produto['img']}

    Input Text                          id:name         ${produto['nome']}
    Input Text                          id:plate        ${produto['tipo']}
    Input Text                          id:price        ${produto['preco']}
    Click Button                        id:novoPrato



Então devo vizualizar este prato no meu dashboard
    Wait Until Element Contains         class:product-list          ${produto['nome']} 
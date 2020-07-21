***Settings***
Documentation           Arquivo contendo todas as keywords da implementação automação Mobile



***Keywords***
Dado que desejo comer "${prato}"
    Set Test Variable   ${prato}


Quando submeto meu email "${email}"
    Wait Until Page Contains        Buscar Prato    10
    Input Text                      accessibility_id=emailInput     ${email}
    Input Text                      accessibility_id=plateInput     ${prato}
    Capture Page Screenshot
    Click Text                      Buscar Prato

Então devo ver a lista de pratos por tipos
    Wait Until Page Contains        Fome de ${prato}


Dado que escolho meu prato "${prato}"
    Set Test Variable                   ${prato}
    Wait Until Page Contains            Fome de ${prato}      5 
    Click Text                          Quero

Quando eu seleciono a opção de pagamento em "${payments}"

    Wait Until Element Is Visible           accessibility_id=paymentInput       5
    Input Text                              accessibility_id=paymentInput       ${payments}
    Click Text                              Confirmar pedido
    
Então devo vizualizar a mensagem "${mensage_expect}"
    Wait Until Page Contains            ${mensage_expect}

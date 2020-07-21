***Settings***
Documentation           Testes de Login da aplicação mobile do NinjaChef

Resource                ../resources/base.robot
Test Setup              Open Session
Test Teardown           Close Session

***Test Cases***
Buscar pratos
    Dado que desejo comer "Sushi"
    Quando submeto meu email "gabiru@qa.com"
    Então devo ver a lista de pratos por tipos


***Keywords***
Dado que desejo comer "${prato}"
    Set Test Variable   ${prato}


Quando submeto meu email "${email}"
    Wait Until Page Contains        Buscar Prato    10
    Input Text                      accessibility_id=emailInput     ${email}
    Input Text                      accessibility_id=plateInput     ${prato}

    Click Text                      Buscar Prato

Então devo ver a lista de pratos por tipos
    Wait Until Page Contains        Fome de ${prato}


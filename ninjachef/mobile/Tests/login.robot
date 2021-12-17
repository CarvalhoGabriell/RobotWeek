***Settings***
Documentation           Suite de Testes Login da aplicação mobile do NinjaChef

Resource                ../resources/base.robot
Test Setup              Open Session
Test Teardown           Close Session

***Test Cases***
Buscar pratos
    Dado que desejo comer "Sushi"
    Quando submeto meu email "gabiru@qa.com"
    Então devo ver a lista de pratos por tipos



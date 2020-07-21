***Settings***
Documentation           Testes de Login da aplicação mobile do NinjaChef

Resource                ../resources/base.robot
Test Setup              Open Session
Test Teardown           Close Session

***Test Cases***
Realizar Login
    Dado que desejo comer "Sushi"
    Quando submeto meu email "gabiru@qa.com"
    Então devo ver a lista de pratos por tipos

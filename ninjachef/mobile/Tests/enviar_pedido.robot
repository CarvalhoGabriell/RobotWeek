***Settings***
Documentation          Suite de Teste para enviar prato escolhido

Resource                ../resources/base.robot
Test Setup              base.Login Session      gabiru@qa.com       Churrasco
Test Teardown           Close Session


***Test Cases***
Efetuando Pedido
    Dado que escolho meu prato "Churrasco"
    Quando eu seleciono a opção de pagamento em "dinheiro"
    Então devo vizualizar a mensagem "Pedido enviado para o Ninja Chef!"


***Settings***
Documentation       Suite dos testes de pedidos recebidos sendo eu um cozinheiro
...                 Assim que o usuário enviar sua solicitação de preparo de um prato
...                 E dessa forma eu possa aceitar e enviar seu pedido.

Resource            ../resources/base.robot

Test Setup          Open Session
Test Teardown       Close Session

***Test Cases***
Receber novos Pedidos
    Dado que "tomper@eu.com" é minha conta de cozinheiro
    E "qagabiru@rio.com" é meu email do meu cliente
    E que "Sanduiche de pernil com pimentões e especiarias" está cadastrado no meu dashboard
    Quando o cliente solicita o preparo de um dos meus pratos
    Então devo receber uma notificação do pedido
    E posso aceitar ou rejeitar esse pedido

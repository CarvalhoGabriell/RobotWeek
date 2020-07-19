***Settings***
Documentation       Suite de teste para cadastrar produtos/pratos
...                 Sendo um cozinheiro amador
...                 Quero cadastrar meus melhores pratos
...                 Para que eu possa cozinha-los para outras pessoas

Resource            ../resources/base.robot

Test Setup          Login Session       gabiru@gmail.com
Test Teardown       Close Session


***Variables***
&{strogonoff}       nome=Strogonoff com patata palha        tipo=Carnes e molhos     preco=25.00


***Test Cases***
Novos pratos
    Dado que "${strogonoff}" é um novo prato
    Quando faço o cadastro desse prato
    Então devo vizualizar este prato no meu dashboard
***Settings***
Documentation       Suite dos testes de cadastro de usuários da aplicação NinjaChef
Resource            ../resources/base.robot

Test Setup          Open Session
Test Teardown       Close Session

***Test Cases***
Cadastro Simples
    Dado que eu acesso a página principal
    Quando submeto meu email "gabiru@gmail.com"
    Então devo ser logado com sucesso

Digitar Email incorreto
    Dado que eu acesso a página principal
    Quando submeto meu email "gabriel123$hot.com"
    Então devo ver a mensagem "Oops. Informe um email válido!"

Campo Email não informado
    Dado que eu acesso a página principal
    Quando submeto meu email "${EMPTY}"
    Então devo ver a mensagem "Oops. Informe um email válido!"



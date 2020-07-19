***Settings***
Documentation       Suite dos testes de cadastro de usuários
Library             SeleniumLibrary

***Test Cases***
Cadastro Simples
    Dado que eu acesso a página principal
    Quando submeto meu email "gabiru@gmail.com"
    Então devo ser logado com sucesso


***Keywords***
Dado que eu acesso a página principal
    Open Browser       http://ninjachef-qaninja-io.umbler.net/      firefox

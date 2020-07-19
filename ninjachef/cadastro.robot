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


Quando submeto meu email "${email}"
    # Click Element	   id:email
    Input Text	       id:email        ${email}
    Click Button       css:button[type=submit]                   ##xpath://button[@class='btn btn-primary']

Então devo ser logado com sucesso
    Wait Until Page Contains Element        class:dashboard
    Close Browser
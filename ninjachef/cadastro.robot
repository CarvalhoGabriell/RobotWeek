***Settings***
Documentation       Suite dos testes de cadastro de usuários
Library             SeleniumLibrary

Test Setup          Open Session
Test Teardown       Close Session

***Test Cases***
Cadastro Simples
    Dado que eu acesso a página principal
    Quando submeto meu email "gabiru@gmail.com"
    Então devo ser logado com sucesso


***Keywords***
Dado que eu acesso a página principal
    Go To        http://ninjachef-qaninja-io.umbler.net/ 


Quando submeto meu email "${email}"
    # Click Element	   id:email
    Input Text	       id:email        ${email}
    Click Button       css:button[type=submit]                   ##xpath://button[@class='btn btn-primary']

Então devo ser logado com sucesso
    Wait Until Page Contains Element        class:dashboard
    


## HOOKS
Open Session
    Open Browser    about:blank       firefox

Close Session
    Close Browser
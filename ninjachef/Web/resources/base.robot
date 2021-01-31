***Settings***
Documentation       Todas as Libraries de auxilio para o projeto de automação ficaram aqui!!!

Resource            elements.robot
Resource            keywords.robot
Resource            helpers.robot

Library             SeleniumLibrary
Library             Collections
Library             RequestsLibrary
Library             OperatingSystem


***Variables***
${base_url}         http://ninjachef-qaninja-io.umbler.net/
${api_url}          http://ninjachef-api-qaninja-io.umbler.net

***Keywords***

## HOOKS
Open Session
    Open Browser    about:blank       firefox

Close Session
    Capture Page Screenshot
    Close Browser
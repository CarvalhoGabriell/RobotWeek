***Settings***
Documentation       Todas as Libraries de auxilio para o projeto de automação ficaram aqui!!!

Resource            keywords.robot
Resource            helpers.robot
Library             SeleniumLibrary



***Variables***
${base_url}         http://ninjachef-qaninja-io.umbler.net/


***Keywords***

## HOOKS
Open Session
    Open Browser    about:blank       firefox

Close Session
    Close Browser
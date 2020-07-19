***Settings***
Documentation     Neste arquivo vão ficar todas as keywords da implementação da automação!

***Keywords***
Dado que eu acesso a página principal
    Go To        http://ninjachef-qaninja-io.umbler.net/ 


Quando submeto meu email "${email}"
    # Click Element	   id:email
    Input Text	       id:email        ${email}
    Click Button       css:button[type=submit]                   ##xpath://button[@class='btn btn-primary']

Então devo ser logado com sucesso
    Wait Until Page Contains Element        class:dashboard
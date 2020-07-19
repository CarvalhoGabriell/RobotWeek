***Settings***
Documentation       Esse arquivo terá todas as keywords de apoio.


***Keywords***
Login Session
    [Arguments]                             ${email}

    base.Open Session
    Go To                                   http://ninjachef-qaninja-io.umbler.net/
    
    Input Text	                            id:email        ${email}
    Click Button                            css:button[type=submit] 
    Wait Until Page Contains Element        class:dashboard
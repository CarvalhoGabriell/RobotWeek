***Settings***
Documentation       Esse arquivo terá todas as keywords de apoio.


***Keywords***
Login Session
    [Arguments]                             ${email}

    base.Open Session
    Go To                                   ${base_url} 
    
    Input Text	                            ${CAMPO_EMAIL}       ${email}
    Click Button                            ${BTN_ENTRAR} 
    Wait Until Page Contains Element        ${DIV_DASH}
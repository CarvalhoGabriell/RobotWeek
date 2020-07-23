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

Get Api Login
    [Arguments]                             ${email_params}
    
    &{payload}=         Create Dictionary       email=${email_params}
    &{headers}=         Create Dictionary       Content-Type=application/json

    Create Session      ninja           ${api_url}
    ${resp}=            Post Request    ninja        /sessions        data=${payload}       headers=${headers}
    Status Should Be    200             ${resp}

    ${token}              Convert To String           ${resp.json()['_id']}
    [Return]              ${token}
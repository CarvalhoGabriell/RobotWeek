***Settings***
Documentation       Arquivo base, contendo os codigos base para abrir o Appium Server

Resource            keywords.robot

Library             AppiumLibrary


***Keywords***

# hooks
Open Session
    Open Application        http://localhost:4723/wd/hub
    ...                     automationName=UiAutomator2
    ...                     platformName=Android
    ...                     deviceName=Celular1
    ...                     app=${EXECDIR}\\app\\ninjachef.apk
    ...                     udid=emulator-5554  

Close Session   
    Capture Page Screenshot
    Close Application

Login Session
    [Arguments]         ${email}        ${prato}

    base.Open Session
    Wait Until Page Contains        Buscar Prato    10
    Input Text                      accessibility_id=emailInput     ${email}
    Input Text                      accessibility_id=plateInput     ${prato}
    Capture Page Screenshot
    Click Text                      Buscar Prato
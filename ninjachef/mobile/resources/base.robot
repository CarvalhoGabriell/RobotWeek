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
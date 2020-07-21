***Settings***
Documentation       Arquivo base, contendo os codigos base para abrir o Appium Server

Library             AppiumLibrary


***Keywords***

# hooks
Opne Session
    Open Application        http://localhost:4723/wd/hub
    ...                     automationName=UiAutomator2
    ...                     platformName=Android
    ...                     deviceName=Celular1
    ...                     app=${EXECDIR}\\app\\ninjachef.apk
    ...                     udid=emulator-5554  

Close Session   
    Close Application
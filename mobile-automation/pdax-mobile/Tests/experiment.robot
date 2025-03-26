*** Settings ***
Library         AppiumLibrary

*** Test Cases ***

Open_Application_Android
    Open Application    http://127.0.0.1:4723/wd/hub     platformName=Android        deviceName=emulator-5554        appPackage=org.wikipedia         appActivity=org.wikipedia.main.MainActivity         automationName=UIAutomator2

Open_Application_IOS
    Open Application    http://127.0.0.1:4723/wd/hub     platformName=iOS       platformVersion=18.1
                  ...      deviceName=iPhone 16 Pro        udid=EEF3BE29-4861-46C9-904C-6017591A58A9
                  ...     appPackage=org.wikimedia.wikipedia         app=/Users/lemuel.buitre/maestro-tests/samples/Wikipedia.app          automationName=XCUITest
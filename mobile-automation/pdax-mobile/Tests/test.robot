*** Settings ***
Library    AppiumLibrary

*** Variables ***
${PLATFORM_NAME}      Android
${PLATFORM_VERSION}   15
${DEVICE_NAME}        emulator-5554
${APP_PATH}           /Users/lemuel.buitre/Downloads/app-dev-release (1).apk
${REMOTE_URL}         http://127.0.0.1:4723/wd/hub
${AUTOMATION_NAME_FLUTTER}      FlutterDriver


*** Keywords ***
Start Appium Session
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    app=${APP_PATH}   automationName=${AUTOMATION_NAME_FLUTTER}

Click Flutter Button
    Wait Until Element Is Visible    com.android.permissioncontroller:id/permission_icon
    Click Element    com.android.permissioncontroller:id/permission_allow_button
    Click Element    xpath=//android.widget.Button[@content-desc="Login"]

Close Appium Session
    Close Application

*** Test Cases ***
Open Flutter App And Click Button
    [Setup]    Start Appium Session
    Click Flutter Button
    [Teardown]    Close Appium Session


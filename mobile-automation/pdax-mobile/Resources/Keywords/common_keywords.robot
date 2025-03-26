*** Settings ***
Library     AppiumLibrary
Resource    ../../Resources/constants.robot
Resource    open_application_keywords.robot
Resource    login_keywords.robot
*** Variables ***
${remoteUrl}   http://127.0.0.1:4723/wd/hub
#Android
${PLATFORM_NAME_ANDROID}     Android
${PLATFORM_VERSION_ANDROID}      15
${DEVICE_NAME_ANDROID}      emulator-5554
${APP_PATH_ANDROID}      /Users/lemuel.buitre/Downloads/app-dev-release (1).apk
${PDAX_APP_PACKAGE_ANDROID}       ph.pdax.mobile.dev
${PDAX_APP_ACTIVITY}     ph.pdax.mobile.MainActivity
${AUTOMATION_NAME_ANDROID}      UIAutomator2
#IOS
${PLATFORM_NAME_IOS}     iOS
${PLATFORM_VERSION_IOS}      18.3
${DEVICE_NAME_IOS}      iPhone 16 Pro
${UDID_IOS}        17373528-DFD4-4CA5-9C5B-4FD16C739631
${APP_PATH_IOS}     /Users/lemuel.buitre/Downloads/Runner 3.app
${PDAX_APP_PACKAGE_IOS}       ph.pdax.mobile.dev
${AUTOMATION_NAME_IOS}      XCUITest

*** Keywords ***

Open Application in ${platForm}
    [Arguments]    ${noResetVariable}   ${buttonLabel}

    IF    ${platForm} == 'Android'
            Open Application    ${remoteUrl}        platformName=${PLATFORM_NAME_ANDROID}        platformVersion=${PLATFORM_VERSION_ANDROID}
                    ...         deviceName=${DEVICE_NAME_ANDROID}      appActivity=${PDAX_APP_ACTIVITY}      appPackage=${PDAX_APP_PACKAGE_ANDROID}
                    ...        automationName=${AUTOMATION_NAME_ANDROID}        noReset=${noResetVariable}

            ${isTrue}=      Run Keyword And Ignore Error    Element Should Be Visible   ${PROMPT_ANDROID}

            IF    '${isTrue[0]}' == 'PASS'
                Click Allow Notification in ${Android}
                Sleep    10
                Click ${buttonLabel} Button in ${Android}
                Sleep    5
            END

    ELSE IF     ${platForm} == 'iOS'
             Open Application    ${REMOTE_URL}     platformName=iOS       platformVersion=${PLATFORM_VERSION_IOS}
               ...      deviceName=${DEVICE_NAME_IOS}        udid=${UDID_IOS}     appPackage=${PDAX_APP_PACKAGE_IOS}
               ...         app=${APP_PATH_IOS}          automationName=${AUTOMATION_NAME_IOS}        noReset=${noResetVariable}

             ${isTrue}=     Run Keyword And Ignore Error    Element Should Be Visible    ${PROMPT_IOS}

             IF    '${isTrue[0]}' == 'PASS'
                Click Allow Notification in ${iOS}
                Sleep   10
                Click Allow Notification in ${iOS}
                Sleep   10
                Click ${buttonLabel} Button in ${iOS}
                Sleep    5
            END
    END


Open the Application in ${platForm}
    [Arguments]     ${noResetVariable}
    IF    ${platForm} == 'Android'
            Open Application    ${remoteUrl}        platformName=${PLATFORM_NAME_ANDROID}        platformVersion=${PLATFORM_VERSION_ANDROID}
                    ...         deviceName=${DEVICE_NAME_ANDROID}      appActivity=${PDAX_APP_ACTIVITY}      appPackage=${PDAX_APP_PACKAGE_ANDROID}
                    ...        automationName=${AUTOMATION_NAME_ANDROID}        noReset=${noResetVariable}
    ELSE IF     ${platForm} == 'iOS'
             Open Application    ${REMOTE_URL}     platformName=iOS       platformVersion=${PLATFORM_VERSION_IOS}
               ...      deviceName=${DEVICE_NAME_IOS}        udid=${UDID_IOS}     appPackage=${PDAX_APP_PACKAGE_IOS}
               ...         app=${APP_PATH_IOS}          automationName=${AUTOMATION_NAME_IOS}        noReset=${noResetVariable}
    END


Check Text If Exists in Android
    [Arguments]     ${locator}      ${expectedText}
    ${actualText}=   Get Text    ${locator}
    Should Be Equal As Strings    ${expectedText}       ${actualText}

Click An Element in the Page
    [Arguments]     ${elementToClick}
    Click Element    ${elementToClick}

Click ${buttonLabel} Button in ${PLATFORM}
    IF    ${PLATFORM} == 'Android'
#          Click Element    xpath=//android.widget.Button[@content-desc=${buttonLabel}]
           Click Element    accessibility_id=${buttonLabel}
     ELSE IF    ${PLATFORM} == 'iOS'
#           Click Element    xpath=//XCUIElementTypeButton[@name=${buttonLabel}]
            Click Element    accessibility_id=${buttonLabel}
     END

Press Enter Key
    Press Keycode    66


Hide Keyboard From the Screen
    Hide Keyboard

Wait For the Element To Appear
    [Arguments]     ${elementToWait}
    Wait Until Element Is Visible    ${elementToWait}

Input ${alphanumericInput} In The Textbox ${textBoxLocator} in ${platForm}
    IF    ${platForm} == 'Android'
        Click Element    ${textBoxLocator}
        Sleep    3
        Input Text Into Current Element   ${alphanumericInput}
    ELSE
        Click Element    ${textBoxLocator}
        Input Text    ${textBoxLocator}    ${alphanumericInput}
    END

Click ${tabLabel} Tab In ${platForm}
    IF    ${platForm} == 'Android'
         Click Element      xpath=//android.view.View[contains(@content-desc, ${tabLabel})]
    ELSE
       ${elementExist}      Run Keyword And Ignore Error  Element Should Be Visible    xpath=//XCUIElementTypeOther[contains(@name, ${tabLabel})]
       
       IF    '${elementExist[0]}' == 'PASS'
           Click Element    xpath=//XCUIElementTypeOther[contains(@name, ${tabLabel})]
       ELSE
            Click Element   xpath=//XCUIElementTypeStaticText[contains(@name, ${tabLabel})]

       END

    END

Close the Application
    Close Application
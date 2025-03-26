*** Settings ***
Library     AppiumLibrary
Resource    ../../Resources/Locators/open_application_locators.robot

*** Keywords ***


#Android
Click Allow Notification in ${platForm}
    IF    ${platForm} == 'Android'
        Wait Until Element Is Visible    com.android.permissioncontroller:id/permission_icon
        Click Element    com.android.permissioncontroller:id/permission_allow_button
    ELSE IF     ${platForm} == 'iOS'
             Click Alert Button    Allow
    END


Get Notification Pop-up Message
    ${notificationText}=        Get Text    ${PROMPT_ANDROID}
    [RETURN]  ${notificationText}

#iOS

Check Text If Exists
    [Arguments]     ${locator}      ${expectedText}
    ${actualText}=   Get Text    ${locator}
    Should Be Equal As Strings    ${expectedText}       ${actualText}

Tap The Tab
    [Arguments]     ${tabElement}
    Click Element    xpath=${tabElement}

Get Element Type
    ${elementLocation}=      Get Element Attribute    xpath=//XCUIElementTypeStaticText[contains(@name, "Invest in bonds")]     type
    ${elementLocation2}=     Get Element Attribute    xpath=//XCUIElementTypeOther[contains(@name, "Trade crypto")]       type
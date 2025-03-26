*** Settings ***
Library    AppiumLibrary
Resource    ../../Resources/constants.robot
Resource    ../../Resources/Locators/login_locators.robot


*** Keywords ***

Check If Strings Are Both Equal
    [Arguments]         ${expString}        ${actualString}
    Should Be Equal    ${expString}     ${actualString}
    
Check If Text Box Exists
    [Arguments]     ${textBoxElement}
    Element Should Be Visible    ${textBoxElement}

Check ${buttonLabel} Button If Exists in ${platForm}
    IF    ${platForm}== 'Android'
        Element Should Be Visible    xpath=//android.widget.Button[@content-desc=${Buttonlabel}]
    ELSE
        Element Should Be Visible    xpath=//XCUIElementTypeButton[@name=${buttonLabel}]
    END

Check ${linkLabel} Link If Exists in ${platForm}
    IF    ${platForm}== 'Android'
        Element Should Be Visible    xpath=//android.widget.Button[@content-desc=${linklabel}]
    ELSE
        Element Should Be Visible    xpath=//XCUIElementTypeLink[@name=${linkLabel}]
    END

Check If Text Element Exist in ${platForm}
    [Arguments]     ${textPart}
    IF    ${platForm}== 'Android'
        Element Should Be Visible    xpath=//android.view.View[@content-desc=${textPart}]
    ELSE
        Element Should Be Visible    xpath=//XCUIElementTypeStaticText[@name=${textPart}]
    END

Check If Text ${textPart} Exist in ${platForm}
    IF    ${platForm}== 'Android'
        Element Should Be Visible    xpath=//android.view.View[@content-desc=${textPart}]
    ELSE
        Element Should Be Visible    xpath=//XCUIElementTypeStaticText[@name=${textPart}]
    END

Check If ${textBoxLabel} In Login Page Exists in ${platForm}
    IF    ${platForm}== 'Android'
        Check Text Box Login Page in Android   ${textBoxLabel}
    ELSE
         Check Text Box Login Page in IOS     ${textBoxLabel}
    END

Check If ${imageLabel} Image In The Page Exists in ${platForm}
    IF    ${platForm} == 'Android'
        Element Should Be Visible    xpath=//android.widget.ImageView[@content-desc=${imageLabel}]
    ELSE
        Element Should Be Visible    xpath=//XCUIElementTypeImage[@name=${imageLabel}]
    END

#Android

Check ${tabLabel} Tab If Exists in Android
    Element Should Be Visible    xpath=//android.view.View[contains(@content-desc, ${tabLabel})]

Check ${tabLabel} Tab If It is Selected in Android
    ${tabIsSelected}=        Get Element Attribute    xpath=//android.view.View[contains(@content-desc, ${tabLabel})]    selected
    Should Be Equal    true   ${tabIsSelected}

Check ${tabLabel} Tab If It is not Selected in Android
    ${tabIsSelected}=        Get Element Attribute    xpath=//android.view.View[contains(@content-desc, ${tabLabel})]    selected
    Should Be Equal    false   ${tabIsSelected}


Check Text Box Login Page in Android
    [Arguments]     ${androidTextBoxLabel}
    IF    ${androidTextBoxLabel} == 'Email'
        Element Should Be Visible    ${ELEMENT_LOGIN_EMAIL_ANDROID}
    ELSE
       Element Should Be Visible   ${ELEMENT_LOGIN_PASSWORD_ANDROID}
    END


#iOS

# Xpath for selected vs not selected is different in iOS. So putting an argument what would be the expected
# attribute of the tab to pick-up the right xpath.
# ${True} or ${False} is the variable here for the boolean.
Check ${tabLabel} Tab If Exists in iOS
    [Arguments]     ${attributeSelected}
    IF    ${attributeSelected} == ${True}
        Element Should Be Visible    xpath=//XCUIElementTypeOther[contains(@name, ${tabLabel})]
    ELSE
         Element Should Be Visible    xpath=//XCUIElementTypeStaticText[contains(@name, ${tabLabel})]
    END

# Xpath for selected vs not selected is different in iOS. So putting an argument what would be the expected
# attribute of the tab to pick-up the right xpath.
# ${True} or ${False} is the variable here for the boolean.
# true or false is the value for expected tab attribute
Check ${tabLabel} Tab If It is Selected in iOS
        ${tabIsSelected}=       Get Element Attribute    xpath=//XCUIElementTypeOther[contains(@name, ${tabLabel})]       selected
        Should Be Equal    true    ${tabIsSelected}


Check ${tabLabel} Tab If It is not Selected in iOS
         ${tabIsNotSelected}=      Get Element Attribute    xpath=//XCUIElementTypeStaticText[contains(@name, ${tabLabel})]  selected
         Should Be Equal    false   ${tabIsNotSelected}

Check Text Box Login Page in IOS
    [Arguments]     ${iOSTextBoxLabel}

    IF    ${iOSTextBoxLabel} == 'Email'
        Element Should Be Visible    ${ELEMENT_LOGIN_EMAIL_IOS}
    ELSE
       Element Should Be Visible   ${ELEMENT_LOGIN_PASSWORD_IOS}
    END
    
Check If Button ${buttonLabel} Is Enabled in ${platForm}

    IF  ${platForm} == 'Android'
        ${actualAttribute}=     Get Element Attribute    xpath=//android.widget.Button[@content-desc=${buttonLabel}]    enabled
        Should Be Equal    true    ${actualAttribute}
    ELSE
        ${actualAttribute}=     Get Element Attribute    xpath=//XCUIElementTypeButton[@name=${buttonLabel}]    enabled
        Should Be Equal     true    ${actualAttribute}
    END

Check If Button ${buttonLabel} Is Not Enabled in ${platForm}

    IF  ${platForm} == 'Android'
        ${actualAttribute}=     Get Element Attribute    xpath=//android.widget.Button[@content-desc=${buttonLabel}]    enabled
        Should Be Equal    false    ${actualAttribute}
    ELSE
        ${actualAttribute}=     Get Element Attribute    xpath=//XCUIElementTypeButton[@name=${buttonLabel}]    enabled
        Should Be Equal     false    ${actualAttribute}
    END
    
Check If Checkbox ${elementLocator} Is Checked in ${platForm}
    IF    ${platForm} == 'Android'
        ${actualAttribute}=     Get Element Attribute    ${elementLocator}    checked
        Should Be Equal    true    ${actualAttribute}
    ELSE
         ${actualAttribute}=    Get Element Attribute    ${elementLocator}    value
         Should Be Equal    1    ${actualAttribute}
    END

Check If Checkbox ${elementLocator} Is Not Checked in ${platForm}
    IF    ${platForm} == 'Android'
        ${actualAttribute}=     Get Element Attribute    ${elementLocator}    checked
        Should Be Equal    false    ${actualAttribute}
    ELSE
         ${actualAttribute}=    Get Element Attribute    ${elementLocator}    value
         Should Be Equal    0    ${actualAttribute}
    END


    
Check If Checkbox ${elementLocator} Exists
    Element Should Be Visible    ${elementLocator}




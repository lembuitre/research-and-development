*** Settings ***
Library     AppiumLibrary
Resource    ../../Resources/Locators/login_locators.robot

*** Variables ***
${USER_EMAIL}=      qa6.stage+21@pdax.ph
${USER_PASSWORD}=   Pdax123!!!

*** Keywords ***
Click Login Button in ${PLATFORM}
     IF    ${PLATFORM} == 'Android'
          Click Element    ${ELEMENT_LOGIN_BUTTON_ANDROID}
     ELSE IF    ${PLATFORM} == 'iOS'
           Click Element    ${ELEMENT_LOGIN_BUTTON_IOS}
     END
    
Click The Link in Login Page
    [Arguments]     ${elementLink}
    Click Element    ${elementLink}


Write Email Address and Password in the Login Text Boxes in ${platForm}
    [Arguments]     ${textBoxEmail}     ${textBoxPassword}
    IF    ${platForm} == 'Android'
        Click Element    ${textBoxEmail}
        Input Text Into Current Element    ${USER_EMAIL}
        Click Element    ${textBoxPassword}
        Input Text Into Current Element   ${USER_PASSWORD}
    ELSE
        Input Text    ${textBoxEmail}    ${USER_EMAIL}
        Click Element    ${ELEMENT_LOG IN_LABEL_IOS}
        Input Text    ${textBoxPassword}    ${USER_PASSWORD}
    END
    
Click ${iconLabel} Icon in ${platForm}
    IF    ${platForm} == 'Android'
        Click Element    xpath=//android.widget.ImageView[@content-desc=${iconLabel}]
    ELSE
        Click Element    xpath=//XCUIElementTypeImage[@name=${iconLabel}]
    END

Click Back Button in CashIn Page in ${platForm}
    IF    ${platForm} == 'Android'
        Click Element    ${BACK_BUTTON_CASHIN_ANDROID}
    ELSE
         Click Element    ${BACK_BUTTON_CASHIN_IOS}
    END

Click Back Button in Bonds Page in ${platForm}
    IF    ${platForm} == 'Android'
        Click Element    ${BACK_BUTTON_BONDS_ANDROID}
    ELSE
         Click Element    ${BACK_BUTTON_BONDS_IOS}
    END

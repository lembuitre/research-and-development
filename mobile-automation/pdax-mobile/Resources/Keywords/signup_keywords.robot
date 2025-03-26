*** Settings ***
Library     AppiumLibrary
Resource    ../../Resources/Locators/signup_locators.robot


*** Keywords ***

Click The Checkbox
    [Arguments]     ${checkboxElement}
    Click Element    ${checkBoxElement}
    
Click The Back Button in ${platForm}
    IF    ${platForm} == 'Android'
        Click Element    ${BACK_BUTTON_ANDROID}
    ELSE
         Click Element    ${BACK_BUTTON_IOS}
    END

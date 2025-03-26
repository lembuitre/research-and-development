*** Settings ***
Library     AppiumLibrary
Resource    ../Resources/constants.robot
Resource    ../Resources/Keywords/asserts_keywords.robot
Resource    ../Resources/Keywords/signup_keywords.robot
Resource    ../Resources/Keywords/common_keywords.robot
Resource    ../Resources/Keywords/open_application_keywords.robot
Resource    ../Resources/Locators/signup_locators.robot

Suite Setup     Open Application in ${iOS}      ${NO_RESET_FALSE}   ${SIGNUP_BUTTON_LABEL}
Suite Teardown   Close the Application

*** Test Cases ***

QETH-160 Complete Registration Fields Page One IOS
    [Tags]  IOS     QETH-160
    Check If Text "Let’s get started!" Exist in ${iOS}
    Check If Text "Welcome to PDAX! We will need your basic information to help get you started. But first, kindly read and accept our rules and policy." Exist in ${iOS}
    Check If Text "I acknowledge that I have completely read, understood, and agree to all the presented " Exist in ${iOS}
    Check "terms, conditions, rules, and policies" Link If Exists in ${iOS}
    Check If Text " of PDAX." Exist in ${iOS}
    Check If Text "I agree to receiving PDAX promotions and updates." Exist in ${iOS}
    Check If Button "Agree" Is Not Enabled in ${iOS}
    Check If Checkbox ${CHECKBOX1_PAGE_ONE_IOS} Exists
    Check If Checkbox ${CHECKBOX2_PAGE_ONE_IOS} Exists
    Check If Checkbox ${CHECKBOX1_PAGE_ONE_IOS} Is Not Checked in ${iOS}
    Check If Checkbox ${CHECKBOX2_PAGE_ONE_IOS} Is Not Checked in ${iOS}

QETH-160 Complete Registration Fields Page Two IOS
    [Tags]      IOS       QETH-160
    Sleep    10
    Click The Checkbox    ${CHECKBOX1_PAGE_ONE_IOS}
    Sleep    10
    Click The Checkbox    ${SOLO_CHECKBOX_NOT_SELECTED_IOS}
    Sleep    5
    Click "Agree" Button in ${iOS}
    Sleep   10
    Input First Name In The Textbox ${FIRST_NAME_TEXTBOX_IOS} in ${iOS}
    Input Last Name In The Textbox ${SURNAME_TEXTBOX_IOS} in ${iOS}
    Sleep    5
    Click "Continue" Button in ${iOS}
    Sleep    5
    Click An Element in the Page   ${CALENDAR_REGISTRATION_IOS}
    Sleep    5
    Click "Save" Button in ${iOS}
    Sleep    10
    Click The Back Button in ${iOS}
    Sleep   10

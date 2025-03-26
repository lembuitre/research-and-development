*** Settings ***
Library     AppiumLibrary
Resource    ../Resources/constants.robot
Resource    ../Resources/Keywords/asserts_keywords.robot
Resource    ../Resources/Keywords/signup_keywords.robot
Resource    ../Resources/Keywords/common_keywords.robot
Resource    ../Resources/Keywords/open_application_keywords.robot
Resource    ../Resources/Locators/signup_locators.robot

Suite Setup     Open Application in ${Android}      ${NO_RESET_FALSE}   ${SIGNUP_BUTTON_LABEL}
Suite Teardown   Close the Application

*** Test Cases ***

QETH-160 Complete Registration Fields Page One Android
    [Tags]  Android     QETH-160
    Check If Text "Let’s get started!" Exist in ${Android}
    Check If Text "Welcome to PDAX! We will need your basic information to help get you started. But first, kindly read and accept our rules and policy." Exist in ${Android}
    Check If Text "I acknowledge that I have completely read, understood, and agree to all the presented " Exist in ${Android}
    Check "terms, conditions, rules, and policies" Link If Exists in ${Android}
    Check If Text " of PDAX." Exist in ${Android}
    Check If Text "I agree to receiving PDAX promotions and updates." Exist in ${Android}
    Check If Button "Agree" Is Not Enabled in ${Android}
    Check If Checkbox ${CHECKBOX1_PAGE_ONE_ANDROID} Exists
    Check If Checkbox ${CHECKBOX2_PAGE_ONE_ANDROID} Exists
    Check If Checkbox ${CHECKBOX1_PAGE_ONE_ANDROID} Is Not Checked in ${iOS}
    Check If Checkbox ${CHECKBOX2_PAGE_ONE_ANDROID} Is Not Checked in ${iOS}

QETH-160 Complete Registration Fields Page Two Android
    [Tags]      Android        QETH-160
    Sleep    10
    Click The Checkbox    ${CHECKBOX1_PAGE_ONE_ANDROID}
    Click The Checkbox    ${CHECKBOX2_PAGE_ONE_ANDROID}
    Click "Agree" Button in ${Android}
    Sleep   10
    Input First Name In The Textbox ${FIRST_NAME_TEXTBOX_ANDROID} in ${Android}
    Input Last Name In The Textbox ${SURNAME_TEXTBOX_ANDROID} in ${Android}
    Sleep    5
    Click "Continue" Button in ${Android}
    Click An Element in the Page    ${PAGE_2_EMPTY_SPACE_ANDROID}
    Sleep    5
    Click An Element in the Page   ${CALENDAR_REGISTRATION_ANDROID}
    Click "Save" Button in ${Android}
    Sleep    10
    Click The Back Button in ${Android}
    Sleep   10

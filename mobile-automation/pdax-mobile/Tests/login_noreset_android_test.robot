*** Settings ***
Library     AppiumLibrary
Resource    ../Resources/constants.robot
Resource    ../Resources/Keywords/asserts_keywords.robot
Resource    ../Resources/Keywords/login_keywords.robot
Resource    ../Resources/Keywords/common_keywords.robot
Resource    ../Resources/Keywords/open_application_keywords.robot
Resource    ../Resources/constants.robot

Suite Setup     Open Application in ${Android}      ${NO_RESET_FALSE}   ${LOGIN_BUTTON_LABEL}
Suite Teardown   Close the Application

*** Test Cases ***

QETH-159 Check The Login Page Elements With Suite Setup Android
    [Tags]  Android     QETH-159    Testing
    Check If ${Email} In Login Page Exists in ${Android}
    Check If ${Password} In Login Page Exists in ${Android}
    Check If Text "Need help logging in? Click here to " Exist in ${Android}
    Check "Unlock your account" Link If Exists in ${ANDROID}
    Check "Reset Password." Link If Exists in ${ANDROID}
    Check If Text " or " Exist in ${Android}
    Check If Text "Not registered yet? " Exist in ${Android}
    Check "Create an account" Link If Exists in ${ANDROID}
    Check "Log In" Button If Exists in ${Android}
    Check "Need more help?" Link If Exists in ${ANDROID}

QETH-66 User is Able to Login In With Suite Setup Android
    [Tags]  Android     QETH-66     Testing
    Write Email Address and Password in the Login Text Boxes in ${Android}   ${ELEMENT_LOGIN_EMAIL_ANDROID}      ${ELEMENT_LOGIN_PASSWORD_ANDROID}
    Sleep    5
    Press Enter Key
    Sleep   10
    Click "Setup now" Button in ${Android}
    Click An Element in the Page    ${ELEMENT_BACK_BUTTON_ANDROID}
    Click "Losers" Tab in ${Android}
    Check If "Cash In" Image In The Page Exists in ${Android}
    Check If "Crypto" Image In The Page Exists in ${Android}
    Check If "Bonds" Image In The Page Exists in ${Android}
    Check If "Collectibles" Image In The Page Exists in ${Android}
    Sleep    3
    Click "Cash In" Icon in ${Android}
    Sleep   5
    Click Back Button in CashIn Page in ${Android}
    Click An Element in the Page    ${ELEMENT_PROFILE_ICON_ANDROID}
    Click "Logout" Button in ${Android}
    Click "Yes" Button in ${Android}
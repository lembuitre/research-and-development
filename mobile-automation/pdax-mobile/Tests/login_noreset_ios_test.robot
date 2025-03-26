*** Settings ***
Library     AppiumLibrary
Resource    ../Resources/constants.robot
Resource    ../Resources/Keywords/asserts_keywords.robot
Resource    ../Resources/Keywords/login_keywords.robot
Resource    ../Resources/Keywords/common_keywords.robot
Resource    ../Resources/Keywords/open_application_keywords.robot
Resource    ../Resources/constants.robot

Suite Setup     Open Application in ${iOS}      ${NO_RESET_FALSE}   ${LOGIN_BUTTON_LABEL}
Suite Teardown   Close the Application

*** Test Cases ***

QETH-159 Check The Login Page Elements With Suite Setup iOS
    [Tags]  IOS     QETH-159    Testing
    Click An Element in the Page   ${ELEMENT_LOG IN_LABEL_IOS}
    Check If ${Email} In Login Page Exists in ${iOS}
    Check If ${Password} In Login Page Exists in ${iOS}
    Check If Text "Need help logging in? Click here to " Exist in ${iOS}
    Check "Unlock your account" Link If Exists in ${iOS}
    Check If Text " or " Exist in ${iOS}
    Check "Reset Password." Link If Exists in ${iOS}
    Check if Text "Not registered yet? " Exist in ${iOS}
    Check "Create an account" Link If Exists in ${iOS}
    Check "Log In" Button If Exists in ${iOS}
    Check "Need more help?" Button If Exists in ${iOS}

QETH-66 User is Able to Login In With Suite Setup IOS
    [Tags]  IOS     QETH-66     Testing
    Click An Element in the Page    ${ELEMENT_LOG IN_LABEL_IOS}
    Write Email Address and Password in the Login Text Boxes in ${iOS}    ${ELEMENT_LOGIN_EMAIL_IOS}    ${ELEMENT_LOGIN_PASSWORD_IOS}
    Hide Keyboard From the Screen
    Sleep    10
    Click "Setup now" Button in ${iOS}
    Click An Element in the Page    ${ELEMENT_BACK_BUTTON_IOS}
    Sleep    5
    Check If "Cash In" Image In The Page Exists in ${iOS}
    Check If "Crypto" Image In The Page Exists in ${iOS}
    Check If "Bonds" Image In The Page Exists in ${iOS}
    Check If "Collectibles" Image In The Page Exists in ${iOS}
    Click "Losers" Tab in ${iOS}
    Click "Cash In" Icon in ${iOS}
    Sleep    5
    Click Back Button in CashIn Page in ${iOS}
    Sleep    5
    Click An Element in the Page    ${ELEMENT_PROFILE_ICON_IOS}
    Click "Logout" Button in ${iOS}
    Click "Yes" Button in ${iOS}
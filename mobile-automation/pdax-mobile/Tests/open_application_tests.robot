*** Settings ***
Library     AppiumLibrary
Library     Collections
Resource    ../Resources/constants.robot
Resource    ../Resources/Keywords/open_application_keywords.robot
Resource    ../Resources/Keywords/asserts_keywords.robot
Resource    ../Resources/Locators/open_application_locators.robot
Resource    ../Resources/Keywords/common_keywords.robot

*** Test Cases ***

QETH-159 Open_Application_Flutter_Android
    [Tags]  Android
    Open the Application in ${Android}  ${NO_RESET_FALSE}
    ${notifText}=      Get Notification Pop-up Message
    Check If Strings Are Both Equal     ${ALLOW_NOTIF_ANDROID}      ${notifText}
    Click Allow Notification in ${Android}
    Sleep    10
    Check "Trade crypto" Tab If Exists in Android
    Check "Trade crypto" Tab If It is Selected in Android
    Check "Invest in bonds" Tab If Exists in Android
    Check "Invest" Tab If It is not Selected in Android
    Check "Login" Button If Exists in ${Android}
    Check "Sign up" Button If Exists in ${Android}
    Close the Application


QETH-159 Open_Application_Flutter_IOS
    [Tags]  iOS
    Open the Application in ${iOS}  ${NO_RESET_FALSE}
    Click Allow Notification in ${iOS}
    Sleep    10
    Click Allow Notification in ${iOS}
    Sleep    10
    Check "Trade crypto" Tab If Exists in iOS     ${True}
    Check "Trade crypto" Tab If It is Selected in iOS
    Check "Invest in bonds" Tab If Exists in iOS      ${False}
    Check "Invest in bonds" Tab If It is not Selected in iOS
    Check "Login" Button If Exists in ${iOS}
    Check "Sign up" Button If Exists in ${iOS}
    Close the Application
    
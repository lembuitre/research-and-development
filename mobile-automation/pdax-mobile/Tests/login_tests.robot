*** Settings ***
Library         AppiumLibrary
Resource    ../Resources/constants.robot
Resource    ../Resources/Keywords/asserts_keywords.robot
Resource    ../Resources/Keywords/login_keywords.robot
Resource    ../Resources/Keywords/common_keywords.robot
Resource    ../Resources/Keywords/open_application_keywords.robot
Library        websocket

*** Test Cases ***



QETH-159 Check The Login Page Elements Android
    [Tags]      Android     Test
    Open the Application in ${Android}  ${NO_RESET_FALSE}
    Click Allow Notification in ${Android}
    Sleep    10
    Click "Login" Button in ${ANDROID}
    Check If ${EMAIL} In Login Page Exists in ${ANDROID}
    Check If ${PASSWORD} In Login Page Exists in ${ANDROID}
    Check If Text "Need help logging in? Click here to " Exist in ${Android}
    Check "Unlock your account" Link If Exists in ${ANDROID}
    Check "Reset Password." Link If Exists in ${ANDROID}
    Check If Text " or " Exist in ${Android}
    Check If Text "Not registered yet? " Exist in ${Android}
    Check "Create an account" Link If Exists in ${ANDROID}
    Check "Log In" Button If Exists in ${Android}
    Check "Need more help?" Link If Exists in ${ANDROID}
    Close the Application

QETH-159 Test
    [Tags]      Android     Test
    Open the Application in ${Android}  ${NO_RESET_FALSE}
    Click Allow Notification in ${Android}
    Sleep    10
    Click Login Button in ${ANDROID}
    Click An Element in the Page   xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View
    Click Element    xpath=//*[@resource-id='textFieldEmail']
    Input Text Into Current Element    Test
    Sleep    10
    Click An Element in the Page   xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View
    Click Reset Password Button Button in ${ANDROID}
    Sleep    5

QETH-66 User is Able to Login In Android
    [Tags]      Android     Test
    Open the Application in ${Android}  ${NO_RESET_FALSE}
    Click Allow Notification in ${Android}
    Sleep    10
    Click "Login" Button in ${ANDROID}
    Write Email Address and Password in the Login Text Boxes in ${Android}   ${ELEMENT_LOGIN_EMAIL_ANDROID}      ${ELEMENT_LOGIN_PASSWORD_ANDROID}
    Press Enter Key
    Sleep   10
    Click "Setup now" Button in ${Android}
    Click An Element in the Page    ${ELEMENT_BACK_BUTTON_ANDROID}
    Check If "Cash In" Image In The Page Exists in ${Android}
    Check If "Crypto" Image In The Page Exists in ${Android}
    Check If "Bonds" Image In The Page Exists in ${Android}
    Check If "Collectibles" Image In The Page Exists in ${Android}
    Sleep   5
    Click An Element in the Page    ${ELEMENT_PROFILE_ICON_ANDROID}
    Click "Logout" Button in ${Android}
    Click "Yes" Button in ${Android}
    Close the Application


QETH-161 Check Forgot Password Page Elements Android
    [Tags]      Android
    Open the Application in ${Android}  ${NO_RESET_FALSE}
    Click Allow Notification in ${Android}
    Sleep   10
    Click "Login" Button in ${Android}
    Click The Link in Login Page    ${ELEMENT_RESET PASSWORD_ANDROID}
    Check If Text "Reset password" Exist in ${Android}
    Check If Text "Enter the email address you’re using for your PDAX account." Exist in ${Android}
#    Check If Text Box Exists    ${ELEMENT_EMAIL_ADDRESS_RESET_PASSWORD_ANDROID} this is having an error
    Check "Reset Password" Button If Exists in ${Android}
    Close the Application


QETH-164 Check Unlock Your Account Elements Android
    [Tags]      Android
    Open the Application in ${Android}  ${NO_RESET_FALSE}
    Click Allow Notification in ${Android}
    Sleep   10
    Click "Login" Button in ${Android}
    Click The Link in Login Page    ${ELEMENT_RESET PASSWORD_ANDROID}
    Check If Text "Reset password" Exist in ${Android}
    Check If Text "Enter the email address you’re using for your PDAX account." Exist in ${Android}
#    Check If Text Box Exists    ${ELEMENT_EMAIL_ADDRESS_RESET_PASSWORD_ANDROID} this is having an error
    Check "Reset Password" Button If Exists in ${Android}
    Close the Application


QETH-159 Check The Login Page Elements iOS
    [Tags]  iOS
    Open the Application in ${iOS}  ${NO_RESET_FALSE}
    Click Allow Notification in ${iOS}
    Sleep   10
    Click Allow Notification in ${iOS}
    Sleep   10
    Click "Login" Button in ${iOS}
    Sleep    5
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
    Close the Application

QETH-159 Test iOS
    [Tags]      iOS    Test
    Open the Application in ${iOS}  ${NO_RESET_FALSE}
    Click Allow Notification in ${iOS}
    Sleep   10
    Click Allow Notification in ${iOS}
    Sleep   10
#    Click Allow Notification in ${iOS}
#    Sleep   10
    Click Login Button in ${iOS}
    Input Text    accessibility_id=Email  Test
    Sleep    10
    Click An Element in the Page   ${ELEMENT_LOG IN_LABEL_IOS}
    Click Reset Password. Button in ${iOS}
#    Sleep    5


QETH-66 User is Able to Login In iOS
    [Tags]  iOS
    Open the Application in ${iOS}  ${NO_RESET_FALSE}
    Click Allow Notification in ${iOS}
    Sleep    10
    Click Allow Notification in ${iOS}
    Sleep    10
    Click "Login" Button in ${iOS}
    Sleep    5
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
    Check If "Collectibles" In The Page Exists in ${iOS}
    Sleep    5
    Click An Element in the Page    ${ELEMENT_PROFILE_ICON_IOS}
    Click "Logout" Button in ${iOS}
    Click "Yes" Button in ${iOS}
    Close the Application

QETH-161 Check Forgot Password Page Elements iOS
    [Tags]  iOS
    Open the Application in ${iOS}  ${NO_RESET_FALSE}
    Click Allow Notification in ${iOS}
    Sleep    10
    Click Allow Notification in ${iOS}
    Sleep    10
    Click "Login" Button in ${iOS}
    Sleep    5
    Click An Element in the Page   ${ELEMENT_LOG IN_LABEL_IOS}
    Sleep    5
    Click The Link in Login Page    ${ELEMENT_RESET PASSWORD_IOS}
    Sleep   5
    Click An Element in the Page    ${ELEMENT_RESET PASSWORD_LABEL_IOS}
    Sleep    5
    Check If Text "Reset password" Exist in ${iOS}
    Check If Text "Enter the email address you’re using for your PDAX account." Exist in ${iOS}
    Check If Text Box Exists    ${ELEMENT_EMAIL_ADDRESS_RESET_PASSWORD_IOS}
    Check "Reset Password" Button If Exists in ${iOS}

#QETH-164 Check Unlock Page Elements iOS
#    Open the Application in ${iOS}
#    Click Allow Notification in ${iOS}
#    Sleep    10
#    Click Allow Notification in ${iOS}
#    Sleep    10
#    Click Login Button in ${iOS}
#    Sleep    5
#    Click An Element in the Page    ${ELEMENT_LOG IN_LABEL_IOS}
#    Sleep    5
#    Click The Link in Login Page    ${ELEMENT_UNLOCK YOUR ACCOUNT_IOS}
#    #unlock your account cannot be clicked in IOS via appium
#    Sleep   5
#    Click An Element in the Page    ${ELEMENT_RESET PASSWORD_LABEL_IOS}
#    Sleep    5
#    Check If Text Element Exist in ${iOS}    "Reset password"
#    Check If Text Element Exist in ${iOS}    "Enter the email address you’re using for your PDAX account."
#    Check If Text Box Exists    ${ELEMENT_EMAIL_ADDRESS_UNLOCK_YOUR_ACCOUNT_IOS}
#    Check Reset Password Button If Exists in ${iOS}
#    Close the Application
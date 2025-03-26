*** Settings ***
Library     AppiumLibrary

*** Variables ***
${ALLOW_NOTIF_ANDROID}=     Allow PDAX-DEV to send you notifications?
${LOGIN_BUTTON_LABEL}=      "Login"
${SIGNUP_BUTTON_LABEL}=     "Sign up"
${CLICK_UNSELECTED_INVEST_IN_BONDS}=    //XCUIElementTypeStaticText[contains(@name, "Invest in bonds")]
${ANDROID}=     'Android'
${iOS}=     'iOS'
${EMAIL}=   'Email'
${PASSWORD}=    'Password'
${NO_RESET_TRUE}    true
${NO_RESET_FALSE}   false

*** Variables ***
#${ELEMENT_LOGIN_EMAIL_ANDROID}=       xpath=//android.widget.ImageView[@content-desc="Log in"]/android.widget.EditText[1]
${ELEMENT_LOGIN_EMAIL_ANDROID}=     textFieldEmail
#${ELEMENT_LOGIN_PASSWORD_ANDROID}=        xpath=//android.widget.ImageView[@content-desc="Log in"]/android.widget.EditText[2]
${ELEMENT_LOGIN_PASSWORD_ANDROID}=        textFieldPassword
${ELEMENT_LOGIN_EMAIL_IOS}=       accessibility_id=Email
${ELEMENT_LOGIN_PASSWORD_IOS}=        accessibility_id=Password
${ELEMENT_LOGIN_BUTTON_ANDROID}=    accessibility_id=Login
${ELEMENT_LOGIN_BUTTON_IOS}=    accessibility_id=buttonLogin
${ELEMENT_LOG IN_LABEL_IOS}=    xpath=//XCUIElementTypeImage[@name="Log in"]
${ELEMENT_RESET PASSWORD_ANDROID}=  xpath=//android.widget.Button[@content-desc="Reset Password."]
${ELEMENT_UNLOCK YOUR ACCOUNT_ANDROID}=  xpath=//android.widget.Button[@content-desc="Unlock your account"]
${ELEMENT_EMAIL_ADDRESS_RESET_PASSWORD_ANDROID}=    xpath=//android.widget.EditText
${ELEMENT_EMAIL_ADDRESS_UNLOCK_YOUR_ACCOUNT_ANDROID}=    xpath=//android.widget.EditText
${ELEMENT_RESET PASSWORD_IOS}=     xpath=//XCUIElementTypeLink[@name="Reset Password."]
${ELEMENT_UNLOCK YOUR ACCOUNT_IOS}=     accessibility_id=Unlock your account
${ELEMENT_CREATE AN ACCOUNT_IOS}=     xpath=//XCUIElementTypeLink[@name="Create an account"]
${ELEMENT_EMAIL_ADDRESS_UNLOCK_YOUR_ACCOUNT_IOS}=   xpath=//XCUIElementTypeTextField[contains(@name, "Email address")]
${ELEMENT_EMAIL_ADDRESS_RESET_PASSWORD_IOS}=   xpath=//XCUIElementTypeTextField[contains(@name, "Email address")]
${ELEMENT_RESET PASSWORD_LABEL_IOS}=    xpath=//XCUIElementTypeStaticText[@name="Reset password"]
${ELEMENT_BACK_BUTTON_ANDROID}=     xpath=//android.widget.Button
${ELEMENT_BACK_BUTTON_IOS}=     xpath=//XCUIElementTypeButton
${ELEMENT_PROFILE_ICON_ANDROID}=    android=new UiSelector().className("android.widget.Button").instance(0)
${ELEMENT_PROFILE_ICON_IOS}=    xpath=//XCUIElementTypeApplication[@name="PDAX-DEV"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeButton[1]
${BACK_BUTTON_CASHIN_ANDROID}=     xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.Button[1]
${BACK_BUTTON_CASHIN_IOS}=     xpath=//XCUIElementTypeApplication[@name="PDAX-DEV"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeButton[1]
${BACK_BUTTON_BONDS_ANDROID}=       xpath=//android.widget.Button[@content-desc="Back"]
${BACK_BUTTON_BONDS_IOS}=       xpath=//XCUIElementTypeButton[@name="Back"]
*** Settings ***
Library     RequestsLibrary
Library     Collections
Library    ../venv/lib/python3.12/site-packages/robot/libraries/OperatingSystem.py
Library    ../venv/lib/python3.12/site-packages/robot/libraries/String.py

*** Variables ***
${base_url}=    https://api.sandbox.pdax.ph/auth

*** Test Cases ***
#Positive Scenario for UM Admin login on backend.
Post_Login_Pos
    Create Session    mySession    ${base_url}
    ${body}=    Create Dictionary   username=qa32.stage+hynie003@pdax.ph    password=Pdax123!!!
    ${header}=      Create Dictionary   Content-Type=application/json
    ${response}=        Post Request     mySession   /login     data=${body}    headers=${header}
    
#    Log To Console    ${response.status_code}
#    Log To Console    ${response.content}
#    Log To Console    ${response.header}

    #Validations
    ${status_code}=     Convert To String    ${response.status_code}
    Should Contain    ${status_code}    200

Post_Login_Get_IdToken
    Create Session    mySession    ${base_url}
    ${body}=    Create Dictionary       username=qa32.stage+hynie003@pdax.ph    password=Pdax123!!!     is_backend=true
    ${header}=      Create Dictionary   Content-Type=application/json
    ${response}=        Post Request    mySession    /login     data=${body}    headers=${header}

    ${json_object}=     To Json    ${response.content}
    ${idToken}=     Get From Dictionary    ${json_object}    id_token
    Log To Console    ${idToken}

Post_Login_Neg
    Create Session    mySession    ${base_url}
    ${body}=    Create Dictionary    username=qa32.stage+hynie003@pdax.ph    password=Pdax123!!
    ${header}=      Create Dictionary   Content-Type=application/json
    ${response}=        Post Request    mySession    /login     data=${body}    headers=${header}

#    Log To Console    ${response.status_code}
#    Log To Console    ${response.content}
#    Log to Console    ${response.header}

    #Validations
    ${body_response}=   Convert To String    ${response.content}
    Should Contain    ${body_response}    "message": "Incorrect username or password."
*** Settings ***
Library     RequestsLibrary
Library    ../venv/lib/python3.12/site-packages/robot/libraries/Collections.py

*** Keywords ***
#This test case is for Proof of concept
User_Login_To_Get_idToken
    Create Session   loginSession    https://api.sandbox.pdax.ph/auth
    ${body}=    Create Dictionary       username=qa32.stage+hynie003@pdax.ph    password=Pdax123!!!     is_backend=true
    ${header}=      Create Dictionary   Content-Type=application/json
    ${response}=        Post Request    loginSession    /login      data=${body}    headers=${header}
    ${json_object}=     To Json    ${response.content}
    ${extract}=     Get From Dictionary    ${json_object}      id_token
    Set Global Variable     ${id_token}    ${extract}
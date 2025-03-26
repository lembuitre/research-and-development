*** Settings ***
Library     RequestsLibrary
Library    ../venv/lib/python3.12/site-packages/robot/libraries/Collections.py

*** Variables ***
${alertRuleEndPoint}=       /api/clfg/alert_rules
${contentType}=     application/json

*** Keywords ***
User_Login_To_Get_idToken
    Create Session    loginSession    https://api.sandbox.pdax.ph/auth
    ${body}=    Create Dictionary       username=admin+kyc@pdax.ph   password=KYCpd@xU4T!     is_backend=true
    ${header}=      Create Dictionary   Content-Type=${contentType}
    ${response}=        Post Request    loginSession    /login      data=${body}    headers=${header}
    ${json_object}=     To Json    ${response.content}
    ${extract}=     Get From Dictionary     ${json_object}      id_token
    Set Global Variable    ${id_token}      ${extract}
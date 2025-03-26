*** Settings ***
Library     RequestsLibrary
Library    ../venv/lib/python3.12/site-packages/robot/libraries/Collections.py
Resource    ../Resources/common.robot

*** Variables ***
${base_url}     https://accounts.api.sandbox.pdax.ph/accounts
${id_neg}       %2B639123456789
${id_pos}       +639144440011
${id_notFound}      +639144440012

*** Test Cases ***
Get_accountsSettings_NegativeScenario
    Create Session    mySession    ${base_url}
    ${response}=    Get Request    mySession    users/${id_neg}/settings?searchBy=contact_number
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}

    #VALIDATIONS
    ${status_code}=     convert to string       ${response.status_code}
    Should Be Equal    ${status_code}    401

    ${body}=    convert to string   ${response.content}
    Should Contain    ${body}    "Message":"Unauthorized"

Get_accountsSettings_PositiveScenario
    User_Login_To_Get_idToken
    Create Session      mySession   ${base_url}
    ${headers}      Create Dictionary   Authorization=${id_token}
    ${response}=    Get Request    mySession   users/${id_pos}/settings?searchBy=contact_number     ${headers}
#    Log To Console    ${response.status_code}
#    Log To Console    ${response.content}
#    Log To Console    ${response.headers}

    #Validations
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}    "user_id": "a735b963-86f6-4df0-b104-82a5caee8ec0"

Get_accountsSettings_NotFound
    User_Login_To_Get_idToken
    Create Session    mySession    ${base_url}
    ${headers}      Create Dictionary   Authorization=${id_token}
    ${response}=    Get Request    mySession    users/${id_notFound}/settings?searchBy=contact_number         ${headers}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}

    #Validations
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    404

    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}   "message": "Account settings for +639144440012 not found"
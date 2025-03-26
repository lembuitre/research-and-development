*** Settings ***
Library     RequestsLibrary
Library     Collections
Resource    ../Resources/common.robot



*** Test Cases ***
Get_List_of_Roles_Positive_Scenario
    User Login With 2FA
    Create Session    mySession    ${base_url}
    ${headers}      Create Dictionary       Authorization=${token}
    ${response}     Get Request    mySession    ${rolesEndpoint}    ${headers}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}

    #Validations
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}    "id": 67, "code": "MAP_FEB_DEMO", "name": "MAP Feb Demo Role"
    
Get_List_of_Roles_Negative_Scenario
    Create Session    mySession    ${base_url}
    ${response}     Get Request    mySession    ${rolesEndpoint}
    
    #Validations
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    401
    
    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}    "message":"Unauthorized"
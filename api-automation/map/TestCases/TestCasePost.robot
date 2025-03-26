*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OTP
Resource    ../Resources/common.robot

*** Variables ***
${base_url}     https://stage-api-map.sandbox.pdax.ph/v1

*** Test Cases ***
Post_Login_Negative_Scenario_InvalidCredentials
    Create Session    mySession    ${base_url}
    ${body}=    Create Dictionary   username=bat_dev@pdax.ph    password=P4ssw0rd2022
    ${header}=      Create Dictionary   Content-Type=${contentType}
    ${response}=        Post Request    mySession    ${authEndpoint}        data=${body}        headers=${header}
    
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}

    #Validations
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    400

    ${body_response}    Convert To String    ${response.content}
    Should Contain    ${body_response}    "code": "INVALID_CREDENTIALS"

Post_Login_Positive_Scenario_Success
    #This part gets the session for the 2FA Login
    Create Session    mySession    ${base_url}
    ${body}=    Create Dictionary   username=${MapAdmin}    password=${MapAdminPass}
    ${header}=      Create Dictionary   Content-Type=${contentType}
    ${response}=    Post Request    mySession    ${authEndpoint}    data=${body}    headers=${header}
    ${json_object}=     To Json    ${response.content}
    ${session}=     Get From Dictionary    ${json_object}    session

    #The login proper with the OTP
    Create Session    2faSession    ${base_url}
    ${otp}=     Get Otp    ${secretKey}
    ${body2}=   Create Dictionary   username=${MapAdmin}    session=${session}      otp=${otp}
    ${header2}=     Create Dictionary   Content-Type=${contentType}
    ${response2}=       Post Request    2faSession    ${2faEndpoint}        data=${body2}       headers=${header2}

    #Validation
    ${status_code}=     Convert To String    ${response2.status_code}
    Should Be Equal    ${status_code}    200

Post_Create_Role
       User Login With 2FA
       #User Create Role
       Create Session    mySession    ${base_url}
       ${body}=     Create Dictionary   code=MAP_DELETED_ROLE_981   name=MAP Deleted Role 981
       ${header}=   Create Dictionary   Content-Type=${contentType}     Authorization=${token}
       ${response}=     Post Request    mySession    ${rolesEndpoint}       data=${body}        headers=${header}
       ${json_object}   To Json    ${response.content}
       ${getData}=    Get From Dictionary    ${json_object}    data
       ${getRoleId}=    Get From Dictionary    ${getData}    id

       #Validation
       ${status_code}=      Convert To String    ${response.status_code}
       Should Be Equal    ${status_code}    200
       ${body}=     Convert To String    ${response.content}
       Should Contain    ${body}    "message": "Role successfully created."

       #Cannot execute the permanent delete which has an endpoint /roles/id?permanent=true
       #Need to have access on the permanent deletion or clean-up the database from time to time
       Create Session    deleteSession    ${base_url}
       ${headers2}=      Create Dictionary       Content-Type=${contentType}     Authorization=${token}
       ${response2}=    Delete Request      deleteSession       /roles/${getRoleId}   headers=${headers2}
       Log To Console    ${response2.content}

       ${status_code}=     Convert To String    ${response2.status_code}
       Should Be Equal    ${status_code}    200

Trial Delete API
       User Login With 2FA
       Create Session    deleteSession    ${base_url}
       ${headers2}=      Create Dictionary       Content-Type=${contentType}     Authorization=${token}
       ${response2}=    Delete Request      deleteSession       /roles/741?permanent=true   headers=${headers2}
       Log To Console    ${response2.content}

       ${status_code}=     Convert To String    ${response2.status_code}
       Should Be Equal    ${status_code}    200



*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OTP

*** Variables ***
${authEndpoint}=       /auth/login
${rolesEndpoint}=   /roles
${contentType}=     application/json
${secretKey}=       3673B5NE4BRY3WL6VI75QTHBKTFNFG7JALNFUUI24RVSHLSIKV6Q
${2faEndpoint}=     /auth/verify-otp
${MapAdmin}=        carmela.contento+admin2@pdax.ph
${MapAdminPass}=    Mela@072801
${base_url}=     https://stage-api-map.sandbox.pdax.ph/v1

*** Keywords ***
User Login With 2FA
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
    ${json_object2}=    To Json    ${response2.content}
    ${getToken}=     Get From Dictionary    ${json_object2}   idToken
    Set Global Variable    ${token}      ${getToken}






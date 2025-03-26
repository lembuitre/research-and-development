*** Settings ***
Library     RequestsLibrary
Library    ../venv/lib/python3.12/site-packages/robot/libraries/Collections.py
Resource    ../Resources/common.robot

*** Variables ***
${base_url}     https://stage.services.sandbox.pdax.ph

*** Test Cases ***
Get_AlertRule_NegativeScenario
    Create Session      mySession       ${base_url}
    ${response}=    Get Request    mySession    ${alertRuleEndPoint}
#    Log To Console    ${response.status_code}
#    Log To Console    ${response.content}
#    Log To Console    ${response.headers}
    
    #Validations
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal     ${status_code}      403
    
    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}    "detail":"Not authenticated

Get_AlertRule_PositiveScenario
    User_Login_To_Get_idToken
    Create Session    mySession    ${base_url}
    ${headers}      Create Dictionary   Authorization=${id_token}
    ${response}=    Get Request    mySession    ${alertRuleEndPoint}      ${headers}
#    Log To Console    ${response.status_code}
#    Log To Console    ${response.content}
#    Log To Console    ${response.headers}
    
    #Validations
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}       200

    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}    "alert_rule":"single crypto-in transaction after 3 months of dormancy"


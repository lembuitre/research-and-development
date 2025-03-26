*** Settings ***
Library     RequestsLibrary
Library     Collections
Resource    ../Resources/common.robot

*** Variables ***
${base_url}     https://stage.services.sandbox.pdax.ph

*** Test Cases ***
Post_Create_AlertRule_NegativeScenario
    Create Session    mySession    ${base_url}
    ${body}=    Create Dictionary   domain=test     alert_rule=test     alert_family=test       threshold_unit=test     threshold_value=0   inequality=ate      period=test     tier=test       transaction_type=test       tier_subcategory=test       custom_conditions={}        should_alert_once=true
    ${header}=      Create Dictionary   Content-Type=${contentType}
    ${response}=        Post Request    mySession    ${alertRuleEndPoint}     data=${body}    headers=${header}
    
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}

    #Validations
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal     ${status_code}    403

    ${body_response}    Convert To String    ${response.content}
    Should Contain    ${body_response}    "detail":"Not authenticated"

Post_Create_AlertRule_AbleToLoginButCannotCreate_Scenario
    User_Login_To_Get_idToken
    Create Session    mySession    ${base_url}
    ${body}=    Create Dictionary   domain=test     alert_rule=test     alert_family=test       threshold_unit=test     threshold_value=0   inequality=ate      period=test     tier=test       transaction_type=test       tier_subcategory=test       custom_conditions={}        should_alert_once=true
    ${header}       Create Dictionary   Content-Type=${contentType}  Authorization=${id_token}
    ${response}=        Post Request    mySession    ${alertRuleEndPoint}     data=${body}    headers=${header}

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}

    #Validations
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    422
    
    ${body_response}    Convert To String    ${response.content}
    Should Contain    ${body_response}    "msg":"value is not a valid enumeration member; permitted: 'fiat', 'crypto', 'trade'"

Post_Create_AlertRule_AbleToLoginAndCreate_Scenario
    User_Login_To_Get_idToken
    Create Session    mySession    ${base_url}
    ${body}=    Create Dictionary   domain=fiat     alert_rule=sample alert rule two        alert_family=sample alert family two         threshold_unit=php_amount      threshold_value=20000        inequality=gt       period=per_transaction      tier=premium       transaction_type=cash-in
    ${header}       Create Dictionary   Content-Type=${contentType}     Authorization=${id_token}
    ${response}=        Post Request    mySession    ${alertRuleEndPoint}       data=${body}        headers=${header}

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}

    #Validations
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    201
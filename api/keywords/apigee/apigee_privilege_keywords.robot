*** Settings ***
Resource      apigee_keywords.robot
Resource    ../common/json_common.robot
Resource    ../common/file_common.robot

*** Variables ***
${true_money_payment_code_file_path}    /resources/testdata/apigee/true_money_payment_code.csv

*** Keywords ***
Get True You Privilege
    [Arguments]    ${terminal_id}    ${params_uri}=${EMPTY}    
    ${RESP}=    Get Request    ${APIGEE_SESSION}    /privilege/v1/terminals/${terminal_id}/true-you-card    params=${params_uri}    headers=&{api_headers}
    Set Test Variable    ${RESP}
    
Post Redeem By Campaign
    [Arguments]    ${terminal_id}    ${data}
    ${RESP}=    Post Request    ${APIGEE_SESSION}    /privilege/v1/terminals/${terminal_id}/redeem-campaign    data=${data}    headers=&{api_headers}
    Set Test Variable    ${RESP}
    
Post Redeem By Campaign With Wrong Url
    [Arguments]    ${terminal_id}    ${data}
    ${RESP}=    Post Request    ${APIGEE_SESSION}    /privilege/v1/terminals/${terminal_id}/invalidredeem-campaign    data=${data}    headers=&{api_headers}
    Set Test Variable    ${RESP}
    
Post Redeem By Code
    [Arguments]    ${terminal_id}    ${data}
    ${RESP}=    Post Request    ${APIGEE_SESSION}    /privilege/v1/terminals/${terminal_id}/redeem-code    data=${data}    headers=&{api_headers}
    Set Test Variable    ${RESP}
    
Post Earn Point
    [Arguments]    ${terminal_id}    ${data}
    ${RESP}=    Post Request    ${APIGEE_SESSION}    /privilege/v1/terminals/${terminal_id}/earn-point    data=${data}    headers=&{api_headers}
    Set Test Variable    ${RESP}
 
Post Create Payment
    [Arguments]    ${terminal_id}    ${data}
    ${RESP}=    Post Request    ${APIGEE_SESSION}    /payment/v1/terminals/${terminal_id}/payments    data=${data}    headers=&{api_headers}
    Set Test Variable    ${RESP}
    
Post Void Payment
    [Arguments]    ${terminal_id}    ${trace_id}    ${data}
    ${RESP}=    Post Request    ${APIGEE_SESSION}    /payment/v1/terminals/${terminal_id}/payments/${trace_id}/void    data=${data}    headers=&{api_headers}
    Set Test Variable    ${RESP}
    
Post Void Earn Point
    [Arguments]    ${terminal_id}    ${trace_id}    ${data}
    ${RESP}=    Post Request    ${APIGEE_SESSION}    /privilege/v1/terminals/${terminal_id}/earn-point/${trace_id}/void    data=${data}    headers=&{api_headers}
    Set Test Variable    ${RESP}
    
Post Void Redeem By Campaign
    [Arguments]    ${terminal_id}    ${trace_id}    ${data}
    ${RESP}=    Post Request    ${APIGEE_SESSION}    /privilege/v1/terminals/${terminal_id}/burn-point/${trace_id}/void    data=${data}    headers=&{api_headers}
    Set Test Variable    ${RESP}
    
# Template        
Get True You Privilege With Missing Or Empty Required Fields
    [Arguments]    ${terminal_id}    ${params_uri}    ${return_name}    ${return_message}
    Get True You Privilege    ${terminal_id}    ${params_uri} 
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .displayCode    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .fields..name    ${return_name}
    Response Should Contain Property With Value    .fields..message    ${return_message}
    
Get True You Privilege With Invalid Params
    [Arguments]    ${terminal_id}    ${params_uri}    ${display_code}    ${return_message}
    Get True You Privilege    ${terminal_id}    ${params_uri}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .code    API_3_PARTY
    Response Should Contain Property With Value    .displayCode    ${display_code}
    Response Should Contain Property With Value    .messsage    ${return_message}
    Response Should Contain Property With Empty Value    .fields
    
Redeem By Campaign With Missing Fields
    [Arguments]    ${terminal_id}    ${data}    ${return_name}    ${return_message}
    Post Redeem By Campaign    ${terminal_id}    ${data}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .displayCode    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .messsage    Bad Request
    Response Should Contain Property With Value    .fields..name    ${return_name}
    Response Should Contain Property With Value    .fields..message    ${return_message}

Get Trace Id
    ${TEST_VARIABLE_TRACE_ID}=    Get Property Value From Json By Index    .traceId    0
    Set Test Variable    ${TEST_VARIABLE_TRACE_ID}

Redeem By Campaign With Invalid Fields
    [Arguments]    ${terminal_id}    ${data}    ${return_code}    ${code}    ${display_code}    ${return_message}
    Post Redeem By Campaign    ${terminal_id}    ${data}
    Response Correct Code    ${return_code}
    Response Should Contain Property With Value    .code    ${code}
    Response Should Contain Property With Value    .displayCode    ${display_code}
    Response Should Contain Property With Value    .messsage    ${return_message}
    Response Should Contain Property With Empty Value    .fields

#Test data preparation
Generate Voided Trace Id
    Post Earn Point    ${TERMINAL_ID}    {"brandId":"${BRAND_ID}","branchId":"${BRANCH_ID}","amount":"100","account":{"type":"${ACCOUNT_TYPE}","value":"${ACCOUNT_VALUE}"}}
    Get Trace Id
    Post Void Earn Point    ${TERMINAL_ID}    ${TEST_VARIABLE_TRACE_ID}    { "brandId": "${BRAND_ID}", "branchId": "${BRANCH_ID}" }

Get Test Data True Money Payment Code
    ${random_line_number}=    Evaluate    random.randint(0,2999)    modules=random,sys
    ${TEST_DATA_TRUE_MONEY_PAYMENT_CODE}=    Get Line Content From File    ${true_money_payment_code_file_path}    ${random_line_number}
    Set Test Variable    ${TEST_DATA_TRUE_MONEY_PAYMENT_CODE}
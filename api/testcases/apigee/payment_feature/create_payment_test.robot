*** Settings ***
Documentation    Tests to verify that CREATE PAYMENT api works correctly

Resource    ../../../resources/init.robot   
Resource    ../../../keywords/apigee/apigee_privilege_keywords.robot
Test Setup        Generate Apigee Header
Test Teardown    Delete All Sessions

*** Variables ***
${amount}    100
${currency}    THB
${code}    00002102929615
${method}    WALLET
${description}    description

${invalid_code}    000021080
${non_exist_code}    08882102929615
${used_code}    00002108051364

*** Variables ***
${message_regex}    [Barcode ถูกใช้แล้ว\/ไม่ถูกต้องหรือหมดอายุ by TxRefId : ].+
*** Test Cases ***
TC_O2O_00392
    [Documentation]    [API] [Apigee] [Payment] Verify Create Payment with created code will return 400
    [Tags]    Regression    Medium    Sanity    Smoke
    Post Create Payment    ${TERMINAL_ID}    { "brandId": "${BRAND_ID}", "branchId": "${BRANCH_ID}", "payment": { "amount": "${amount}", "currency": "${currency}", "code": "${used_code}", "method": "${method}", "description": "${description}" } }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .code    API_3_PARTY
    Response Should Contain Property With Value    .displayCode    4104
    Response Should Contain Property Matches Regex    .messsage    ${message_regex}
    Response Should Contain Property With Empty Value    .fields
    
TC_O2O_00393
    [Documentation]    [API] [Apigee] [Payment] Verify Create Payment with invalid code will return 400
    [Tags]    Regression    Medium   
    Post Create Payment    ${TERMINAL_ID}    { "brandId": "${BRAND_ID}", "branchId": "${BRANCH_ID}", "payment": { "amount": "${amount}", "currency": "${currency}", "code": "${invalid_code}", "method": "${method}", "description": "${description}" } }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .code    API_3_PARTY
    Response Should Contain Property With Value    .displayCode    4104
    Response Should Contain Property Matches Regex    .messsage    ${message_regex}
    Response Should Contain Property With Empty Value    .fields
    
TC_O2O_00394
    [Documentation]    [API] [Apigee] [Payment] Verify Create Payment with not exist code will return 400
    [Tags]    Regression    Medium   
    Post Create Payment    ${TERMINAL_ID}    { "brandId": "${BRAND_ID}", "branchId": "${BRANCH_ID}", "payment": { "amount": "${amount}", "currency": "${currency}", "code": "00002102929615", "method": "${method}", "description": "${description}" } }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .code    API_3_PARTY
    Response Should Contain Property With Value    .displayCode    4104
    Response Should Contain Property Matches Regex    .messsage    ${message_regex}
    Response Should Contain Property With Empty Value    .fields
    
TC_O2O_00395
    [Documentation]    [API] [Apigee] [Payment] Verify Create Payment with missing 1 required field will return message about missing a field
    [Tags]    Regression    Medium   
    Post Create Payment    ${TERMINAL_ID}    { "branchId": "${BRANCH_ID}", "payment": { "amount": "${amount}", "currency": "${currency}", "code": "${non_exist_code}", "method": "${method}", "description": "${description}" } }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .displayCode    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .messsage    Bad Request
    Response Should Contain Property With Value    .fields..name    brandId
    Response Should Contain Property With Value    .fields..message    brand/merchant id is required
    
TC_O2O_00396
    [Documentation]    [API] [Apigee] [Payment] Verify Create Payment with missing some required fields will return message about missing some fields
    [Tags]    Regression    Medium   
    Post Create Payment    ${TERMINAL_ID}    { "brandId": "${BRAND_ID}", "branchId": "${BRANCH_ID}", "payment": { "code": "${code}", "method": "${method}", "description": "${description}" } }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .displayCode    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .messsage    Bad Request
    Response Should Contain Property With Value    .fields..name    amount
    Response Should Contain Property With Value    .fields..message    amount is required
    Response Should Contain Property With Value    .fields..name    currency
    Response Should Contain Property With Value    .fields..message    currency is required
    
TC_O2O_00397
    [Documentation]    [API] [Apigee] [Payment] Verify Create Payment without body will return Invalid JSON format message
    [Tags]    Regression    Medium   
    Post Create Payment    ${TERMINAL_ID}    ${EMPTY}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .displayCode    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .messsage    Invalid Request Format: Empty JSON string
    Response Should Contain Property With Empty Value    .fields
    
TC_O2O_00398
    [Documentation]    [API] [Apigee] [Payment] Verify Create Payment with empty body will return message about missing all fields
    [Tags]    Regression    Medium   
    Post Create Payment    ${TERMINAL_ID}    {}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .displayCode    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .messsage    Bad Request
    Response Should Contain Property With Value    .fields..name    brandId
    Response Should Contain Property With Value    .fields..message    brand/merchant id is required
    Response Should Contain Property With Value    .fields..name    branchId
    Response Should Contain Property With Value    .fields..message    branch id is required
    Response Should Contain Property With Value    .fields..name    amount
    Response Should Contain Property With Value    .fields..message    amount is required
    Response Should Contain Property With Value    .fields..name    currency
    Response Should Contain Property With Value    .fields..message    currency is required
    Response Should Contain Property With Value    .fields..name    payment.method
    Response Should Contain Property With Value    .fields..message    payment method is required
    Response Should Contain Property With Value    .fields..name    payment.code
    Response Should Contain Property With Value    .fields..message    payment code is required
    
TC_O2O_00399
    [Documentation]    [API] [Apigee] [Payment] Verify Create Payment with invalid json format will return Bad Request
    [Tags]    Regression    Medium   
    Post Create Payment    ${TERMINAL_ID}    { "brandId": "${BRAND_ID}" "branchId": "${BRANCH_ID}", "payment": { "amount": "${amount}" "currency": "${currency}", "code": "${code}", "method": "${method}", "description": "${description}" } }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .displayCode    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    .messsage    Invalid Request Format: Missing comma in object literal
    Response Should Contain Property With Empty Value    .fields
    
TC_O2O_00640
    [Documentation]    [API] [Apigee] [Payment] Unauthorized user returns Invalid Access Token
    [Tags]    Regression    Medium
    Set Invalid Access Token   
    Post Create Payment    ${TERMINAL_ID}    { "brandId": "${BRAND_ID}", "branchId": "${BRANCH_ID}", "payment": { "amount": "${amount}", "currency": "${currency}", "code": "${used_code}", "method": "${method}", "description": "${description}" } }
    Response Correct Code    ${UNAUTHORIZED}
    Response Should Contain Property With Value    .code    401
    Response Should Contain Property With Value    .displayCode    401
    Response Should Contain Property With Value    .messsage    Invalid Access Token
    Response Should Contain Property With Empty Value    .fields
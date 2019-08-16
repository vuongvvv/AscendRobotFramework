*** Settings ***
Documentation    Tests to verify that PaymentCancel api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/payment/payment_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    payment.payment.write
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${not_exist_transaction_reference}    20180420121212336201

*** Test Cases ***
TC_O2O_07806
    [Documentation]    [payment][Payment cancel] Request with not exist "txRefId" returns 400
    [Tags]    Regression    Medium    E2E    Sanity    Smoke
    Post Payment Cancel    { "merchantId": "${BRAND_ID}", "outletId": "${BRANCH_ID}", "terminalId": "${TERMINAL_ID}", "txRefId": "${not_exist_transaction_reference}" }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    code    data_not_found
    Response Should Contain Property With Value    message    txRefId, OutletId, TerminalId and MerchantId not found
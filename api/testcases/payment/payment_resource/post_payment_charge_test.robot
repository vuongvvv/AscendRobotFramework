*** Settings ***
Documentation    Tests to verify that PaymentCharge api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/payment/payment_resource_keywords.robot
Resource    ../../../keywords/payment/transaction_resource_keywords.robot
Test Setup    Run Keywords    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    payment.payment.write,payment.payment.read    AND    Get Existing Transaction Reference
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_04647
    [Documentation]    [Payment][PaymentCharge] Payment charges by txRefId data duplicate fill in data and All Parameter fill in data correct (Payment already)
    [Tags]    Regression    Medium    E2E    Sanity    Smoke
    Post Payment Charge    { "txRefId": "${EXISTING_TRANSACTION_REFERENCE}", "merchantId": "1100001", "outletId": "00460", "terminalId": "69000460", "amount": "100", "channel": "EDC", "currency": "thb", "description": "payment online", "mobile": "0851646625", "name": "test payment online", "tmnToken": "fec74ff881fb96645637123b246ea013", "paymentMethod": "WALLET" }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    code    duplicate_txRefId
    Response Should Contain Property With Value    message    txRefId have already used
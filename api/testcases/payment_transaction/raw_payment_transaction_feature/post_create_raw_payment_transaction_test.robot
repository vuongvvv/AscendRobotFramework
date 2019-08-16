*** Settings ***
Documentation    Tests to verify that createRawPaymentTransaction api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/payment_transaction/payment_transaction_resource_keywords.robot
Resource    ../../../keywords/payment_transaction/raw_payment_transaction_resource_keywords.robot
Test Setup    Run Keywords    Prepare Payment Transaction Test Data    AND    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    paymentRawTx.create
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_05628
    [Documentation]     [API][TrueMoneyQRPaymentTransaction] Request with user with "paymentRawTx.create" scope returns 200
    [Tags]      Regression     High    UnitTest    Smoke    E2E
    Post Create Raw Payment Transaction    { "tmnId": "tmn.10000000022", "transactionReference": "${TRANSACTION_REFERENCE}", "customerMobileNumber": "0953509888", "transactionDate": "${TRANSACTION_DATE}", "customerThaiIdHash": "7b443f8409f4914057eb44f962", "merchantMobileNumber": "0639202324", "paymentData": "ข้อความใน p2p", "eventType": "P2P", "moneyAmount": 3000, "kycVerifyStatus": true }
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Be Empty Body

TC_O2O_05632
    [Documentation]     [paymenttransaction][RawPaymentTransaction] Request with missing "transactionReference" field return 400
    [Tags]      Regression     Medium    UnitTest    Sanity    E2E
    Post Create Raw Payment Transaction    { "tmnId": "tmn.10000000022", "customerMobileNumber": "0953509888", "transactionDate": "${TRANSACTION_DATE}", "customerThaiIdHash": "7b443f8409f4914057eb44f962", "merchantMobileNumber": "0639202324", "paymentData": "ข้อความใน p2p", "eventType": "P2P", "moneyAmount": 3000, "kycVerifyStatus": true }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/constraint-violation
    Response Should Contain Property With Value    title    Method argument not valid
    Response Should Contain Property With Value    status    ${${BAD_REQUEST_CODE}}
    Response Should Contain Property With Value    path    /api/raw-transactions
    Response Should Contain Property With Value    message    error.validation
    Response Should Contain Property With Value    fieldErrors..objectName    rawPaymentTransaction
    Response Should Contain Property With Value    fieldErrors..field    transactionReference
    Response Should Contain Property With Value    fieldErrors..message    must not be blank

TC_O2O_05629
    [Documentation]     [API][TrueMoneyQRPaymentTransaction] Request with user without "paymentRawTx.create" scope returns 403
    [Tags]      Regression     High    UnitTest    Smoke
    [Setup]    Run Keywords    Prepare Payment Transaction Test Data    AND    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    paymentTx.create
    Post Create Raw Payment Transaction    { "tmnId": "tmn.10000000022", "transactionReference": "${TRANSACTION_REFERENCE}", "customerMobileNumber": "0953509888", "transactionDate": "${TRANSACTION_DATE}", "customerThaiIdHash": "7b443f8409f4914057eb44f962", "merchantMobileNumber": "0639202324", "paymentData": "ข้อความใน p2p", "eventType": "P2P", "moneyAmount": 3000, "kycVerifyStatus": true }
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Forbidden
    Response Should Contain Property With Value    status    ${${FORBIDDEN_CODE}}
    Response Should Contain Property With Value    detail    Access is denied
    Response Should Contain Property With Value    path    /api/raw-transactions
    Response Should Contain Property With Value    message    error.http.403

TC_O2O_05631
    [Documentation]     [API][TrueMoneyQRPaymentTransaction] Request with duplicated "transactionReference" field return 200
    [Tags]      Regression     Medium
    Post Create Raw Payment Transaction    { "tmnId": "tmn.10000000022", "transactionReference": "${TRANSACTION_REFERENCE}", "customerMobileNumber": "0953509888", "transactionDate": "${TRANSACTION_DATE}", "customerThaiIdHash": "7b443f8409f4914057eb44f962", "merchantMobileNumber": "0639202324", "paymentData": "ข้อความใน p2p", "eventType": "P2P", "moneyAmount": 3000, "kycVerifyStatus": true }
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Be Empty Body
    Post Create Raw Payment Transaction    { "tmnId": "tmn.10000000022", "transactionReference": "${TRANSACTION_REFERENCE}", "customerMobileNumber": "0953509888", "transactionDate": "${TRANSACTION_DATE}", "customerThaiIdHash": "7b443f8409f4914057eb44f962", "merchantMobileNumber": "0639202324", "paymentData": "ข้อความใน p2p", "eventType": "P2P", "moneyAmount": 3000, "kycVerifyStatus": true }
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Be Empty Body

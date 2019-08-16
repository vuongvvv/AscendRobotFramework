*** Settings ***
Documentation    Tests to verify that processFailedPaymentTransactionMerchant api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/point/recover_process_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_05911
    [Documentation]    [point][processFailedPaymentTransactionMerchant] API return 403 when request POST /api/process/failed-payment-transaction-merchant API without batch_processor scope
    [Tags]    Regression    Medium    E2E    Sanity    Smoke
    Post Process Failed Payment Transaction Merchant
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    error    insufficient_scope
    Response Should Contain Property With Value    error_description    Insufficient scope for this resource
    Response Should Contain Property With Value    scope    batch_processor
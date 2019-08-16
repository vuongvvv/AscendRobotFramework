*** Settings ***
Documentation    Tests to verify that processFailedPaymentTransactionCustomer api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/point/recover_process_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_03222
    [Documentation]    [point][processFailedPaymentTransactionCustomer] Verify that API can return 403  if user does not have 'batch_processor' permission
    [Tags]    Regression    Medium    E2E    Sanity    Smoke
    Post Process Failed Payment Transaction Customer
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    error    insufficient_scope
    Response Should Contain Property With Value    error_description    Insufficient scope for this resource
    Response Should Contain Property With Value    scope    batch_processor
*** Settings ***
Documentation    Tests to verify that sendMerchantTransactionToPointIssuer api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/point/process_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    batch_processor
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_05588
    [Documentation]    [Point][sendMerchantTransactionToPointIssuer] Request with batch_processor scope return 200
    [Tags]    Regression    Medium    E2E    Smoke
    Post Send Merchant Transaction To Point Issuer
    Response Correct Code    ${SUCCESS_CODE}

TC_O2O_05589
    [Documentation]    [Point][sendMerchantTransactionToPointIssuer] Request without batch_processor scope return 403
    [Tags]    Regression    Medium    E2E    Smoke    Sanity
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Post Send Merchant Transaction To Point Issuer
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    error    insufficient_scope
    Response Should Contain Property With Value    error_description    Insufficient scope for this resource
    Response Should Contain Property With Value    scope    batch_processor
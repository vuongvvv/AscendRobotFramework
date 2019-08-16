*** Settings ***
Documentation    Tests to verify that processRedeemQuota api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/process_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_01231
    [Documentation]     [notification][processRedeemQuota] Client without batch_processor" scope can NOT access
    [Tags]      Regression     Medium    Smoke    E2E    Sanity
    Put Process Redeem Quota
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    scope    batch_processor
    Response Should Contain Property With Value    error_description    Insufficient scope for this resource
    Response Should Contain Property With Value    error    insufficient_scope
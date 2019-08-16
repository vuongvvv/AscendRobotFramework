*** Settings ***
Documentation    Tests to verify that processSMSDelivery api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/process_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    batch_processor
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_01365
    [Documentation]     [notification][processSMSDelivery] Only client has "batch_processor" scope can access
    [Tags]      Regression     Medium    Smoke    E2E    UnitTest
    Put Process SMS Delivery
    Response Correct Code    ${SUCCESS_CODE}

TC_O2O_01366
    [Documentation]     [notification][processSMSDelivery] Client without batch_processor" scope can NOT access
    [Tags]      Regression     Medium    Smoke    E2E    Sanity
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Put Process SMS Delivery
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    scope    batch_processor
    Response Should Contain Property With Value    error_description    Insufficient scope for this resource
    Response Should Contain Property With Value    error    insufficient_scope
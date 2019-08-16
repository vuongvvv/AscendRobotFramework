*** Settings ***
Documentation    Tests to verify that getAllMessagesByMerchant api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/notification_type_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${type_id}    ${1}
${merchant_id}    5b4f06ec30a578000198df80
*** Test Cases ***
TC_O2O_00949
    [Documentation]     [notification][getAllMessagesByMerchant] Request by user does not bind to the merchant returns 403
    [Tags]      Regression     High    Sanity    E2E    UnitTest
    Get All Messages By Merchant    ${type_id}    ${merchant_id}
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    entityName    merchantId
    Response Should Contain Property With Value    errorKey    permissiondenied
    Response Should Contain Property With Value    status    ${${FORBIDDEN_CODE}}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Permission Denied
    Response Should Contain Property With Value    message    error.permissiondenied
    Response Should Contain Property With Value    params    merchantId
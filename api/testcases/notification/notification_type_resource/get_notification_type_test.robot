*** Settings ***
Documentation    Tests to verify that getNotificationType api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/notification_type_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.registration.approve
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${type_id}    ${1}

*** Test Cases ***
TC_O2O_01637
    [Documentation]     [notification][getNotificationType] User with "notification.registration.approve" permission can access getNotificationType API
    [Tags]      Regression     High    Smoke    E2E    Sanity    UnitTest
    Get Notification Type    ${type_id}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With Value    id    ${type_id}
    Response Should Contain Property With Number String    quotaLimit
    Response Should Contain Property With String Value    rule
    Response Should Contain Property With String Value    terms
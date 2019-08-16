*** Settings ***
Documentation    Tests to verify that createNotificationType api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/notification_type_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.registration.approve
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${exist_name}    SMS_Marketing

*** Test Cases ***
TC_O2O_01607
    [Documentation]     [notification][createNotificationType] User without "notification.registration.approve" permission can not access createNotificationType API
    [Tags]      Regression     High    Smoke    E2E    Sanity    UnitTest
    Post Create Notification Type    { "name": "${exist_name}", "quotaLimit": 1000, "terms": "SMS_STG1", "rule":"EGG_SMS" }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    entityName    name
    Response Should Contain Property With Value    errorKey    nameexisted
    Response Should Contain Property With Value    message    error.nameexisted
    Response Should Contain Property With Value    params    name
    Response Should Contain Property With Value    status    ${${BAD_REQUEST_CODE}}
    Response Should Contain Property With Value    title    TYPE_ALREADY_EXISTED
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
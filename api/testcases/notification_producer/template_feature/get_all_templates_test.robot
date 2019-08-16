*** Settings ***
Documentation    Tests to verify that getAllTemplates api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification_producer/notification_producer_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.template.read
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
@{status_list}    ACTIVE    INACTIVE

*** Test Cases ***
TC_O2O_06974
    [Documentation]    [NotificationProducer][getAllTemplates] Request with "notification.template.read" permission returns 200
    [Tags]    Regression    High    Smoke    UnitTest    Sanity
    Get All Templates
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Are Number    .id
    Response Should Contain All Property Values Are String    .action
    Response Should Contain All Property Values Are String    .type
    Response Should Contain All Property Values Are String    .template
    Response Should Contain All Property Values Include In List    .status    ${status_list}

TC_O2O_06975
    [Documentation]    [NotificationProducer][getAllTemplates] Request without "notification.template.read" permission returns 403
    [Tags]    Regression    High    Smoke    UnitTest
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Get All Templates
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Forbidden
    Response Should Contain Property With Value    status    ${${FORBIDDEN_CODE}}
    Response Should Contain Property With Value    detail    Access is denied
    Response Should Contain Property With Value    path    /api/templates
    Response Should Contain Property With Value    message    error.http.403
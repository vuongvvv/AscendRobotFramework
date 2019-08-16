*** Settings ***
Documentation    Tests to verify that getTemplate api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification_producer/notification_producer_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.template.read
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${template_id}    ${1}
${invalid_template_id}    ${99999999}
@{status_list}    ACTIVE    INACTIVE
*** Test Cases ***
TC_O2O_06991
    [Documentation]    [NotificationProducer][getTemplate] Request with "notification.template.read" permission returns 200
    [Tags]    Regression    High    Smoke    UnitTest    Sanity
    Get Template    ${template_id}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With Value    id    ${template_id}
    Response Should Contain Property With String Value    action
    Response Should Contain Property With String Value    .type
    Response Should Contain Property With String Value    .template
    Response Should Contain All Property Values Include In List    .status    ${status_list}

TC_O2O_06992
    [Documentation]    [NotificationProducer][getTemplate] Request with not exist "id" returns 404 with empty body
    [Tags]    Regression    High    Smoke    UnitTest
    Get Template    ${invalid_template_id}
    Response Correct Code    ${NOT_FOUND_CODE}
    Response Should Be Empty Body

TC_O2O_06993
    [Documentation]    [NotificationProducer][getTemplate] Request without "notification.template.read" permission returns 403
    [Tags]    Regression    High    Smoke    UnitTest
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Get Template    ${template_id}
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Forbidden
    Response Should Contain Property With Value    status    ${${FORBIDDEN_CODE}}
    Response Should Contain Property With Value    detail    Access is denied
    Response Should Contain Property With Value    path    /api/templates/${template_id}
    Response Should Contain Property With Value    message    error.http.403
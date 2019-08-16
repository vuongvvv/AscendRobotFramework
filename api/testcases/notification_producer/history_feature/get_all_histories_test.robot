*** Settings ***
Documentation    Tests to verify that getAllHistories api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification_producer/notification_producer_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.history.read
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_06944
    [Documentation]    [API][NotificationProducer][getAllHistories] Request with "notification.history.read" permission returns 200
    [Tags]    Regression    High    Smoke    UnitTest    Sanity
    Get All Histories
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Are String    .id
    Response Should Contain All Property Values Are List Of Numbers    .contact
    Response Should Contain All Property Values Are String    .transactionReference
    Response Should Contain All Property Values Are String    .remark
    Response Should Contain All Property Values Are String    .sourceType
    Response Should Contain All Property Values Are String    .sourceId
    Response Should Contain All Property Values Are String    .nestedTemplateHistory.action
    Response Should Contain All Property Values Are String    .nestedTemplateHistory.type
    Response Should Contain All Property Values Are String    .nestedTemplateHistory.template
    Response Should Contain All Property Values Are String    .nestedTemplateHistory.senderName

TC_O2O_06945
    [Documentation]    [API][NotificationProducer][getAllHistories] Request without "notification.history.read" permission returns 403
    [Tags]    Regression    High    Smoke    UnitTest
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Get All Histories
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Forbidden
    Response Should Contain Property With Value    status    ${${FORBIDDEN_CODE}}
    Response Should Contain Property With Value    detail    Access is denied
    Response Should Contain Property With Value    path    /api/histories
    Response Should Contain Property With Value    message    error.http.403
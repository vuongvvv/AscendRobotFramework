*** Settings ***
Documentation    Tests to verify that getHistory api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification_producer/notification_producer_keywords.robot
Test Setup    Run Keywords    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.history.read    AND    Get History Id
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions
*** Variables ***
${date_regex}    ^\\d{4}[-]\\d{2}[-]\\d{2}[T]\\d{2}[:]\\d{2}[:]\\d{2}[.]\\d{3}$
${eleven_numbers_regex}    \\d{11}
${invalid_history_id}    5cb972b70a99360001d369
*** Test Cases ***
TC_O2O_07195
    [Documentation]    [API][NotificationProducer][getHistory] Request with "notification.history.read" permission returns 200
    [Tags]    Regression    High    Smoke    UnitTest    Sanity
    Get History    ${HISTORY_ID}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With Value    id    ${HISTORY_ID}
    Response Should Contain Property With List Matches Regex    contact    ${eleven_numbers_regex}
    Response Should Contain Property With String Value    transactionReference
    Response Should Contain Property With String Value    remark
    Response Should Contain Property With String Value    sourceType
    Response Should Contain Property With String Value    sourceId
    Response Should Contain Property With String Value    nestedTemplateHistory.action
    Response Should Contain Property With Value    nestedTemplateHistory.type    SMS
    Response Should Contain Property With String Value    nestedTemplateHistory.template
    Response Should Contain Property With String Value    nestedTemplateHistory.senderName
    Response Should Contain Property With String Or Null    createdBy
    Response Should Contain Property Matches Regex    createdDate    ${date_regex}
    Response Should Contain Property With String Or Null    lastModifiedBy
    Response Should Contain Property Matches Regex    lastModifiedDate    ${date_regex}

TC_O2O_07196
    [Documentation]    [API][NotificationProducer][getHistory] Request without "notification.history.read" permission returns 403
    [Tags]    Regression    High    Smoke    UnitTest
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Get History    ${invalid_history_id}
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Forbidden
    Response Should Contain Property With Value    status    ${${FORBIDDEN_CODE}}
    Response Should Contain Property With Value    detail    Access is denied
    Response Should Contain Property With Value    path    /api/histories/${invalid_history_id}
    Response Should Contain Property With Value    message    error.http.403

TC_O2O_07197
    [Documentation]    [API][NotificationProducer][getHistory] Request with "id" does not exist on DB returns 404 without body
    [Tags]    Regression    High    UnitTest
    Get History    ${invalid_history_id}
    Response Correct Code    ${NOT_FOUND_CODE}
    Response Should Be Empty Body
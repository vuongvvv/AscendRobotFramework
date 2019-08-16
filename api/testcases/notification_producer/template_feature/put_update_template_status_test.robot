*** Settings ***
Documentation    Tests to verify that updateTemplateStatus api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification_producer/notification_producer_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.template.update
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${valid_merchant_template_id}    1
${invalid_merchant_template_id}    9999999
*** Test Cases ***
TC_O2O_06893
    [Documentation]    [API][NotificationProducer][updateTemplateStatus] Request with "notification.template.update" permission returns 200
    [Tags]    Regression    High    Smoke    UnitTest    Sanity
    Put Update Template Status    { "id": ${valid_merchant_template_id}, "status": "INACTIVE" }
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With Value    id    ${${valid_merchant_template_id}}
    Response Should Contain Property With String Value    action
    Response Should Contain Property With String Value    .type
    Response Should Contain Property With String Value    .template
    Response Should Contain Property With Value    status    INACTIVE

TC_O2O_06894
    [Documentation]    [API][NotificationProducer][updateTemplateStatus] Request without "notification.template.update" permission returns 403
    [Tags]    Regression    High    Smoke    UnitTest
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Put Update Template Status    { "id": 1, "status": "INACTIVE" }
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Forbidden
    Response Should Contain Property With Value    status    ${${FORBIDDEN_CODE}}
    Response Should Contain Property With Value    detail    Access is denied
    Response Should Contain Property With Value    path    /api/templates/status
    Response Should Contain Property With Value    message    error.http.403

TC_O2O_06895
    [Documentation]    [API][NotificationProducer][updateTemplateStatus] Request with not exist template id returns 400
    [Tags]    Regression    High    UnitTest
    Put Update Template Status    { "id": ${invalid_merchant_template_id}, "status": "INACTIVE" }
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    entityName    template
    Response Should Contain Property With Value    errorKey    TEMPLATE_NOT_FOUND
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Not found an existing template
    Response Should Contain Property With Value    status    ${${BAD_REQUEST_CODE}}
    Response Should Contain Property With Value    message    error.TEMPLATE_NOT_FOUND
    Response Should Contain Property With Value    params    template
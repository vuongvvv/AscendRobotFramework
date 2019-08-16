*** Settings ***
Documentation    Tests to verify that getAllEmailTemplates api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification_producer/email_template_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.template.read
Test Teardown    Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Test Cases ***
TC_O2O_09706
    [Documentation]    [API][GetAllTemplate] Verify API returns 200 OK when getting all Email templates
    [Tags]    Regression    High    Smoke    UnitTest    SanityExclude
    GET All Email Templates    page=0&size=10&sort=id%2Casc
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Are Integer    .id
    Response Should Contain All Property Values Are String    .action
    Response Should Contain All Property Values Are String    .title
    Response Should Contain All Property Values Are String    .status
    Response Should Contain All Property Values Are String    .template
    Response Should Contain All Property Values Are Boolean    .html
    Response Should Contain All Property Values Are String    .sender
    Response Should Contain All Property Values Are String Or Null    .cc
    Response Should Contain All Property Values Are String Or Null    .bcc
    Response Should Contain All Property Values Are String Or Null    .registerChannel

TC_O2O_09708
    [Documentation]    [API][GetAllTemplate] Verify API returns 403 when user lack of permission to access
    [Tags]    Regression    High    Smoke    UnitTest
    [Setup]    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    GET All Email Templates     page=0&size=10&sort=id%2Casc
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Forbidden
    Response Should Contain Property With Value    status    ${${FORBIDDEN_CODE}}
    Response Should Contain Property With Value    detail    Access is denied
    Response Should Contain Property With Value    path    /api/email-templates
    Response Should Contain Property With Value    message    error.http.403
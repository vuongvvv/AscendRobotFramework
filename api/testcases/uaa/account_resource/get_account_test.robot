*** Settings ***
Documentation    Tests to verify that getAccount api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/uaa/account_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${date_regex}    ^\\d{4}[-]\\d{2}[-]\\d{2}[T]\\d{2}[:]\\d{2}[:]\\d{2}[Z]$

*** Test Cases ***
TC_O2O_01166
    [Documentation]     [uaa][getAccount] /api/account api returns ROLE_USER account's information correctly
    [Tags]      Regression     High    Smoke    E2E    Sanity
    Get Account
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain Property With Number String    id
    Response Should Contain Property With String Value    login
    Response Should Contain Property With Number String    mobile
    Response Should Contain Property With String Or Null    firstName
    Response Should Contain Property With String Or Null    lastName
    Response Should Contain Property With String Or Null    email
    Response Should Contain Property With String Or Null    imageUrl
    Response Should Contain Property With Boolean Value    activated
    Response Should Contain Property With String Value    langKey
    Response Should Contain Property With String Value    createdBy
    Response Should Contain Property Matches Regex    createdDate    ${date_regex}
    Response Should Contain Property With String Value    lastModifiedBy
    Response Should Contain Property Matches Regex    lastModifiedDate    ${date_regex}
    Response Should Contain Property With String Value    authorities
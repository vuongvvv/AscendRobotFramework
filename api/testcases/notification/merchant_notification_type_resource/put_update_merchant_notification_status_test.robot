*** Settings ***
Documentation    Tests to verify that updateMerchantNotificationStatus api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/merchant_notification_type_resource_keywords.robot
Test Setup    Generate Gateway Header With Scope and Permission    ${ROLE_USER}    ${ROLE_USER_PASSWORD}    permission_name=notification.registration.approve
Test Teardown     Run Keywords    Delete Created Client And User Group    AND    Delete All Sessions

*** Variables ***
${type_id}    ${1}
${merchant_id}    5b4f06ec30a578000198df80

*** Test Cases ***
TC_O2O_01310
    [Documentation]    API Update Status - To verify that API will returns error when send API without body
    [Tags]    Regression    High    E2E    Sanity    UnitTest
    Put Update Merchant Notification Status    ${type_id}    ${merchant_id}    ${EMPTY}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    title    Bad Request
    Response Should Contain Property With Value    status    ${${BAD_REQUEST_CODE}}
    Response Should Contain Property With Value    path    /api/types/${type_id}/merchants/${merchant_id}/update-status
    Response Should Contain Property With Value    message    error.http.400
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
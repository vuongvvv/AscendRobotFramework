*** Settings ***
Documentation    Tests to verify that getAllMessages api works correctly

Resource    ../../../resources/init.robot
Resource    ../../../keywords/notification/sms_notification_keywords.robot
Test Setup    Prepare Test Date For Notification    ${ROLE_ADMIN}
Test Teardown    Run Keywords    Clean Notification Test Data    AND    Delete All Sessions

*** Variables ***
${status_regex}    ^(SENDING|CANCELED|REJECTED|REQUESTED|PENDING|COMPLETED)$
${last_modified_date_regex}    ^\\d{4}[-]\\d{2}[-]\\d{2}[T]\\d{2}[:]\\d{2}[:]\\d{2}[Z]$

*** Test Cases ***
TC_O2O_00756
    [Documentation]     [API] [SMS] [Get Merchant SMS Message List] Request with valid type and merchantId returns data match with "notification.message" table
    [Tags]      Regression     High    Smoke
    Get All Messages
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Are Number    .id
    Response Should Contain All Property Values Are String    .merchantId
    Response Should Contain All Property Values Are Number    .notificationTypeId
    Response Should Contain All Property Values Are Number    .merchantNotificationTypeId
    Response Should Contain All Property Values Are String    .title
    Response Should Contain All Property Values Are String    .messageBody
    Response Should Contain All Property Values Match Regex    .status    ${status_regex}
    Response Should Contain All Property Values Are String Or Null    .rejectReason
    Response Should Contain All Property Values Are Number    .creditsPerMessage
    Response Should Contain All Property Values Are Number    .numberOfAudiences
    Response Should Contain All Property Values Match Regex    .createdDate    ${last_modified_date_regex}

TC_O2O_00758
    [Documentation]     [API] [SMS] [Get Merchant SMS Message List] Request with sort status, numberOfAudiences, or title will return the sorted response
    [Tags]      Regression     High    UnitTest
    [Template]    Get All Messages With Sorting
    sort=createdDate,ASC    .createdDate    ASC
    sort=createdDate,DESC    .createdDate    DESC
    sort=status,ASC    .status    ASC
    sort=status,DESC    .status    DESC
    sort=numberOfAudiences,ASC    .numberOfAudiences    ASC
    sort=numberOfAudiences,DESC    .numberOfAudiences    DESC

TC_O2O_00759
    [Documentation]     [API] [SMS] [Get Merchant SMS Message List] Filter by merchantId, notificationTypeId,merchantNotificationTypeId, or status with EQUALS operation returns correct data match with "notification.message" table
    [Tags]      Regression     High    UnitTest
    [Template]    Get All Messages With Filter
    merchantId.equals=${EXIST_MERCHANT_ID}    .merchantId     ${EXIST_MERCHANT_ID}
    notificationTypeId.equals=${EXIST_TYPE_ID}    .notificationTypeId     ${EXIST_TYPE_ID}
    merchantNotificationTypeId.equals=${EXIST_MERCHANT_NOTIFICATION_TYPE_ID}    .merchantNotificationTypeId     ${EXIST_MERCHANT_NOTIFICATION_TYPE_ID}
    status.equals=${EXIST_STATUS}    .status     ${EXIST_STATUS}

TC_O2O_00760
    [Documentation]     [API] [SMS] [Get Merchant SMS Message List] Filter by merchantId, notificationTypeId,merchantNotificationTypeId, or status with IN operation returns correct data match with "notification.message" table
    [Tags]      Regression     High    UnitTest
    [Template]    Get All Messages With Filter
    merchantId.in=${EXIST_MERCHANT_ID}    .merchantId     ${EXIST_MERCHANT_ID}
    notificationTypeId.in=${EXIST_TYPE_ID}    .notificationTypeId     ${EXIST_TYPE_ID}
    merchantNotificationTypeId.in=${EXIST_MERCHANT_NOTIFICATION_TYPE_ID}    .merchantNotificationTypeId     ${EXIST_MERCHANT_NOTIFICATION_TYPE_ID}
    status.in=${EXIST_STATUS}    .status     ${EXIST_STATUS}

TC_O2O_00761
    [Documentation]     [API] [SMS] [Get Merchant SMS Message List] Filter by "rejectReason" with contains operation returns correct response
    [Tags]      Regression     High    UnitTest
    Get All Messages    rejectReason.contains=RE
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Property Values Contain    .rejectReason    RE    ${True}

TC_O2O_00847
    [Documentation]     [API] [SMS] [Get Merchant SMS Message List] Filter by "createdDate" with greaterOrEqualThan, or lessOrEqualThan operation returns correct response
    [Tags]      Regression     High    UnitTest
    Get All Messages    createdDate.greaterOrEqualThan=${EXIST_CREATED_DATE}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Date Values Later Than Or Equal    .createdDate    ${EXIST_CREATED_DATE}
    Get All Messages    createdDate.lessOrEqualThan=${EXIST_CREATED_DATE}
    Response Correct Code    ${SUCCESS_CODE}
    Response Should Contain All Date Values Earlier Than Or Equal    .createdDate    ${EXIST_CREATED_DATE}

TC_O2O_00763
    [Documentation]     [API] [SMS] [Get Merchant SMS Message List] Request with ROLE_USER already binds to a Merchant returns 403
    [Tags]      Regression     Medium
    [Setup]    Generate Gateway Header    ${ROLE_USER}    ${ROLE_USER_PASSWORD}
    Get All Messages            
    Response Correct Code    ${FORBIDDEN_CODE}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/problem-with-message
    Response Should Contain Property With Value    title    Forbidden
    Response Should Contain Property With Value    status    ${${FORBIDDEN_CODE}}
    Response Should Contain Property With Value    detail    Access is denied
    Response Should Contain Property With Value    path    /api/messages
    Response Should Contain Property With Value    message    error.http.403
    [Teardown]    ${None}
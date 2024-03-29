*** Settings ***
Resource            ../../../resources/init.robot
Resource            ../../../keywords/membership/membership_keywords.robot
Test Setup          Generate Gateway Header    ${MEMBERSHIP_SUBSCRIPTION_USERNAME}    ${MEMBERSHIP_SUBSCRIPTION_PASSWORD}
Test Teardown       Delete All Sessions

*** Variables ***
##TEST DATA
${member_id}    582
${type_id}      1

*** Test Cases ***
TC_O2O_01412
    [Documentation]    [API] [Create Member Subscription] API return error when send API with typeid is empty.
    [Tags]    Membership    Regression    Medium
    Create Membership Subscription    ${member_id}    ${EMPTY}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/constraint-violation
    Response Should Contain Property With Value    title   Method argument not valid
    Response Should Contain Property With Value    status    ${${BAD_REQUEST_CODE}}
    Response Should Contain Property With Value    message    error.validation
    Response Should Contain Property With Value    path    /api/subscriptions
    Response Should Contain All Property Values Equal To Value    objectName    memberSubscriptionDTO
    Response Should Contain All Property Values Equal To Value    field    typeId
    Response Should Contain All Property Values Equal To Value    fieldErrors..message    NotNull

TC_O2O_01413
    [Documentation]    [API] [Create Member Subscription] API return error when send API with memberid is empty.
    [Tags]    Membership    Regression    Medium
    Create Membership Subscription    ${EMPTY}    ${type_id}
    Response Correct Code    ${BAD_REQUEST_CODE}
    Response Should Contain Property With Value    type    https://www.jhipster.tech/problem/constraint-violation
    Response Should Contain Property With Value    title   Method argument not valid
    Response Should Contain Property With Value    status    ${${BAD_REQUEST_CODE}}
    Response Should Contain Property With Value    message    error.validation
    Response Should Contain Property With Value    path    /api/subscriptions
    Response Should Contain All Property Values Equal To Value    objectName    memberSubscriptionDTO
    Response Should Contain All Property Values Equal To Value    field    memberId
    Response Should Contain All Property Values Equal To Value    fieldErrors..message    NotNull
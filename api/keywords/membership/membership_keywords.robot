*** Settings ***
Resource    ../common/api_common.robot
Library    Collections

*** Variables ***
${api_membership}    /membership
${api_member_count}    /api/merchants/_merchantID/members/count
${api_member_subscriptions}    /api/subscriptions
${api_get_all_members}    /api/members

*** Keywords ***
##KEYWORDS FOR MEMBERSHIP COUNTS API
Create Membership Count Header
    &{headers}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${access_token}
    Set Suite Variable    &{member_count_header}    &{headers}

Get Membership Count By Merchant ID
    [Arguments]    ${merchant_id}
    Create Membership Count Header
    ${member_count_uri}=    Replace String    ${api_member_count}    _merchantID    ${merchant_id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    ${api_membership}${member_count_uri}    headers=${member_count_header}
    Set Test Variable    ${RESP}

Get Membership Count By Merchant ID And User ID
    [Arguments]    ${merchant_id}    ${user_id}
    Create Membership Count Header
    ${member_count_uri}=    Replace String    ${api_member_count}    _merchantID    ${merchant_id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    ${api_membership}${member_count_uri}?userId.in=${user_id}    headers=${member_count_header}
    Set Test Variable    ${RESP}

Get Membership Count By Merchant ID And Member Code
    [Arguments]    ${merchant_id}    ${member_code}
    Create Membership Count Header
    ${member_count_uri}=    Replace String    ${api_member_count}    _merchantID    ${merchant_id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    ${api_membership}${member_count_uri}?memberCode.in=${member_code}    headers=${member_count_header}
    Set Test Variable    ${RESP}

Get Membership Count By Merchant ID And Equal Join Date
    [Arguments]    ${merchant_id}    ${join_date}
    Create Membership Count Header
    ${member_count_uri}=    Replace String    ${api_member_count}    _merchantID    ${merchant_id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    ${api_membership}${member_count_uri}?joinDate.equals=${join_date}    headers=${member_count_header}
    Set Test Variable    ${RESP}

Get Membership Count By Merchant ID And Greater Or Equal Than Join Date
    [Arguments]    ${merchant_id}    ${join_date}
    Create Membership Count Header
    ${member_count_uri}=    Replace String    ${api_member_count}    _merchantID    ${merchant_id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    ${api_membership}${member_count_uri}?joinDate.greaterOrEqualThan=${join_date}    headers=${member_count_header}
    Set Test Variable    ${RESP}

Get Membership Count By Merchant ID And Less Or Equal Than Join Date
    [Arguments]    ${merchant_id}    ${join_date}
    Create Membership Count Header
    ${member_count_uri}=    Replace String    ${api_member_count}    _merchantID    ${merchant_id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    ${api_membership}${member_count_uri}?joinDate.lessOrEqualThan=${join_date}    headers=${member_count_header}
    Set Test Variable    ${RESP}

Get Membership Count By Merchant ID And Subscribed Status
    [Arguments]    ${merchant_id}    ${subscribed_status}
    Create Membership Count Header
    ${member_count_uri}=    Replace String    ${api_member_count}    _merchantID    ${merchant_id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    ${api_membership}${member_count_uri}?subscribed.equals=${subscribed_status}    headers=${member_count_header}
    Set Test Variable    ${RESP}

Get Membership Count By Merchant ID And Membership ID
    [Arguments]    ${merchant_id}    ${membership_id}
    Create Membership Count Header
    ${member_count_uri}=    Replace String    ${api_member_count}    _merchantID    ${merchant_id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    ${api_membership}${member_count_uri}?membershipId.in=${membership_id}    headers=${member_count_header}
    Set Test Variable    ${RESP}

Get All Members
    [Arguments]    ${params_uri}=${EMPTY}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    ${api_membership}${api_get_all_members}    params=${params_uri}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Member Counts Should Be Returned Correctly
    ${member_count}=    Get Value From Json    ${RESP.json()}    count
    ${member_count}=    Get From List    ${member_count}    0
    Should Be True    ${member_count} > 0

Member Counts Should Be Returned As Zero
    ${member_count}=    Get Value From Json    ${RESP.json()}    count
    ${member_count}=    Get From List    ${member_count}    0
    Should Be True    ${member_count} == 0

###KEYWORDS FOR MEMBERSHIP SUBSCRIPTION API
Create Membership Subscription
    [Arguments]    ${membership_id}    ${type_id}
    ${request_body}=   Set Variable    {"memberId":"${membership_id}","typeId":"${type_id}"}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    ${api_membership}${api_member_subscriptions}    data=${request_body}    headers=&{gateway_header}
    Set Test Variable    ${RESP}





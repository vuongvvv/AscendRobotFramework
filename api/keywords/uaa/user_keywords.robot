*** Settings ***
Resource      ../common/api_common.robot
Resource    ../common/json_common.robot

*** Keywords ***
Get User
    [Arguments]    ${user_login}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /uaa/api/users/${user_login}    headers=&{gateway_header}
    Set Test Variable   ${RESP}

Get All Users
    [Arguments]    ${params_uri}=${EMPTY}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /uaa/api/users    params=${params_uri}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Post Create User
    [Arguments]    ${data}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    /uaa/api/users    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Put Update User
    [Arguments]    ${data}
    ${RESP}=    Put Request    ${GATEWAY_SESSION}    /uaa/api/users    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Get Authorities
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    /uaa/api/users/authorities    headers=&{gateway_header}
    Set Test Variable    ${RESP}
#Data Preparation
Get User Resource Test Data
    [Arguments]    ${property}    ${filter}=${EMPTY}
    Get All Users    ${filter}
    ${USER_RESOURCE_TEST_DATA}=    Get Property Value From Json By Index    ${property}    0
    Set Test Variable    ${USER_RESOURCE_TEST_DATA}
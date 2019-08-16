*** Settings ***
Resource    ../common/api_common.robot
Resource    ../common/json_common.robot

*** Variables ***
${user_group_api}    /uaa/api/user-groups

*** Keywords ***
Delete User Group
    [Arguments]    ${user_group_id}
    ${RESP}=    Delete Request    ${GATEWAY_SESSION}    ${user_group_api}/${user_group_id}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Post Create User Group
    [Arguments]    ${data}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    ${user_group_api}    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Put Update User Group
    [Arguments]    ${data}
    ${RESP}=    Put Request    ${GATEWAY_SESSION}    ${user_group_api}    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Get All User Groups
    [Arguments]    ${params_uri}=${EMPTY}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    ${user_group_api}    params=${params_uri}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Get User Group
    [Arguments]    ${user_group_id}
    ${RESP}=    Get Request    ${GATEWAY_SESSION}    ${user_group_api}/${user_group_id}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Reset Production User Group
    Get All User Groups    name.equals=${PROD_TEST_USER_GROUP}
    ${user_group_id}=    Get Property Value From Json By Index    .id    0
    Put Update User Group    { "id": ${user_group_id}, "name": "${PROD_TEST_USER_GROUP}", "description": "${PROD_TEST_USER_GROUP}","permissionGroups":[],"permissions":[],"users":[] }

#Data preparation
Get User Group Id
    [Arguments]    ${filter}=${EMPTY}
    Get All User Groups    ${filter}
    ${USER_GROUP_ID}=    Get Property Value From Json By Index    .id    0
    Set Test Variable    ${USER_GROUP_ID}
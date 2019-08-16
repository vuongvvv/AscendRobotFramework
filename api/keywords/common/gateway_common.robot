*** Settings ***
Resource    ../../../web/keywords/common/web_common.robot
Resource    ../uaa/login_trueid_keywords.robot
Resource    ../uaa/oauth_client_details_keywords.robot
Resource    ../uaa/user_keywords.robot
Resource    ../uaa/permission_resource_keywords.robot
Resource    ../uaa/user_group_keywords.robot
Resource    ../uaa/permission_group_keywords.robot
Resource    ../uaa/util_keywords.robot
Resource    json_common.robot

*** Variables ***
${api_uaa}    /uaa
${trueid_login_url}         ${API_HOST}/uaa/api/social/signin/trueid
${trueid_login_verify}      /uaa/api/social/signin/trueid?code=_loginCode&state=_loginState
${trueid_session}    https://accounts.trueid-dev.net
${trueid_uri}    /signin?client_id=411&state=1111&redirect_uri=http://weomni-test.com

*** Keywords ***
Create Gateway Session
    Create Session    ${GATEWAY_SESSION}    ${API_HOST}    verify=true

Generate Access Token
    [Arguments]    ${username}    ${password}
    Create Gateway Session
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded    Authorization=${AUTHORIZATION_KEY}
    &{data}=    Create Dictionary    username=${username}    password=${password}    grant_type=password
    ${resp}=    Post Request    ${GATEWAY_SESSION}    ${api_uaa}/oauth/token    data=${data}    headers=${headers}
    &{resp_body}=    To Json    ${resp.text}
    Set Suite Variable    ${access_token}    ${resp_body.access_token}

Generate Gateway Header With Scope and Permission
    [Arguments]    ${user_name}    ${password}    ${scope}=DEFAULT    ${permission_group_name}=${EMPTY}    ${permission_name}=${EMPTY}    ${grant_type}=password
    Create Gateway Session
    Generate Gateway Header    ${ROLE_ADMIN}    ${ROLE_ADMIN_PASSWORD}
    Run Keyword If    '${ENV}' != 'production' and ('${permission_group_name}' != '${EMPTY}' or '${permission_name}' != '${EMPTY}')
    ...    Add Permission For User    ${user_name}    ${permission_group_name}    ${permission_name}
    Run Keyword If    '${ENV}' == 'production' and ('${permission_group_name}' != '${EMPTY}' or '${permission_name}' != '${EMPTY}')
    ...    Update Permission For User    ${user_name}    ${permission_group_name}    ${permission_name}
    Run Keyword If    '${ENV}' != 'production'
    ...    Create Client    ${scope}    password,refresh_token,client_credentials
    Run Keyword If    '${ENV}' == 'production'
    ...    Update Client    ${scope}    password,refresh_token,client_credentials
    Delete Reset All Cache
    #Work around to get the latest access token with the latest SCOPES and PERMISSIONS
    Delete All Sessions
    Create Gateway Session
    Generate Gateway Header    ${ROLE_ADMIN}    ${ROLE_ADMIN_PASSWORD}
    &{user_information}=    Create Dictionary    username=${user_name}    password=${password}    grant_type=${grant_type}
    ${authorization_key}=    Generate Authorization Key    ${CREATED_CLIENT_NAME}    ${CREATED_CLIENT_SECRET}
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded    Authorization=Basic ${authorization_key}
    ${resp}=    Post Request    ${GATEWAY_SESSION}    ${api_uaa}/oauth/token    data=${user_information}    headers=${headers}
    &{resp_body}=    To Json    ${resp.text}
    ${access_token}=    Set Variable    ${resp_body.access_token}
    &{gateway_header}=    Create Dictionary    authorization=Bearer ${access_token}    Content-Type=application/json
    Set Suite Variable    &{gateway_header}

Add Permission For User
    [Arguments]    ${user_login}    ${permission_group_name}    ${permission_name}
    Get User    ${user_login}
    ${user_id}=    Get Property Value From Json By Index    .id    ${0}
    Run Keyword If    '${permission_group_name}' != '${EMPTY}'    Get All Permission Groups    name.in=${permission_group_name}
    ${permission_group_json}=    Run Keyword If    '${permission_group_name}' != '${EMPTY}'    Generate Json From Json Property Value    .id    id
    ${permission_group_string}=    Run Keyword If    '${permission_group_name}' != '${EMPTY}'    Set Variable    , "permissionGroups": [ ${permission_group_json} ]
    ...    ELSE    Set Variable    ${EMPTY}
    Run Keyword If    '${permission_name}' != '${EMPTY}'    Get All Permissions    name.in=${permission_name}
    ${permission_json}=    Run Keyword If    '${permission_name}' != '${EMPTY}'    Generate Json From Json Property Value    .id    id
    ${permission_string}=    Run Keyword If    '${permission_name}' != '${EMPTY}'    Set Variable    , "permissions": [ ${permission_json} ]
    ...    ELSE    Set Variable    ${EMPTY}
    Post Create User Group    { "name": "${TEST_NAME}", "description": null${permission_group_string}${permission_string}, "users": [ { "id": ${user_id} } ] }
    ${SUITE_USER_GROUP_ID}=    Get Property Value From Json By Index    .id    0
    Set Suite Variable    ${SUITE_USER_GROUP_ID}

Update Permission For User
    [Arguments]    ${user_login}    ${permission_group_name}    ${permission_name}
    Get User    ${user_login}
    ${user_id}=    Get Property Value From Json By Index    .id    ${0}
    Run Keyword If    '${permission_group_name}' != '${EMPTY}'    Get All Permission Groups    name.in=${permission_group_name}
    ${permission_group_json}=    Run Keyword If    '${permission_group_name}' != '${EMPTY}'    Generate Json From Json Property Value    .id    id
    ${permission_group_string}=    Run Keyword If    '${permission_group_name}' != '${EMPTY}'    Set Variable    , "permissionGroups": [ ${permission_group_json} ]
    ...    ELSE    Set Variable    ${EMPTY}
    Run Keyword If    '${permission_name}' != '${EMPTY}'    Get All Permissions    name.in=${permission_name}
    ${permission_json}=    Run Keyword If    '${permission_name}' != '${EMPTY}'    Generate Json From Json Property Value    .id    id
    ${permission_string}=    Run Keyword If    '${permission_name}' != '${EMPTY}'    Set Variable    , "permissions": [ ${permission_json} ]
    ...    ELSE    Set Variable    ${EMPTY}
    Get All User Groups    name.equals=${PROD_TEST_USER_GROUP}
    ${user_group_id}=    Get Property Value From Json By Index    .id    0
    Put Update User Group    { "id": ${user_group_id}, "name": "${PROD_TEST_USER_GROUP}", "description": null${permission_group_string}${permission_string}, "users": [ { "id": ${user_id} } ] }

Generate Gateway Header
    [Arguments]    ${username}    ${password}
    Generate Access Token    ${username}    ${password}
    &{gateway_header}=    Create Dictionary    authorization=Bearer ${access_token}    Content-Type=application/json
    Set Suite Variable    &{gateway_header}

Generate Basic Authentication Header
    [Arguments]    ${client_id}    ${client_secret}
    Create Gateway Session
    ${authorization_key}=    Generate Authorization Key    ${client_id}    ${client_secret}
    &{BASIC_GATEWAY_HEADER}=    Create Dictionary    authorization=Basic ${authorization_key}    Content-Type=application/json
    Set Suite Variable    &{BASIC_GATEWAY_HEADER}

Generate Access Token With Admin Tools
    [Arguments]    ${username}    ${password}
    Create Gateway Session
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded    Authorization=${ADMIN_TOOLS_AUTHORIZATION_KEY}
    &{data}=    Create Dictionary    username=${username}    password=${password}    grant_type=password
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    ${api_uaa}/oauth/token    data=${data}    headers=${headers}
    &{resp_body}=    To Json    ${RESP.text}
    Set Suite Variable    ${access_token}    ${resp_body.access_token}

Generate Admin Tools Gateway Header
    [Arguments]    ${username}    ${password}
    Generate Access Token With Admin Tools    ${username}    ${password}
    &{gateway_header}=    Create Dictionary    authorization=Bearer ${access_token}    Content-Type=application/json
    Set Suite Variable    &{gateway_header}

Login To Gateway As Admin User
    Generate Access Token    ${GATEWAY_ADMIN_USER}    ${GATEWAY_ADMIN_PASSWORD}

Generate Access Token With TrueID
    [Arguments]        ${username}      ${password}
    Get True ID Credential    ${username}    ${password}
    Create Gateway Session
    ${headers}=             Create Dictionary       Authorization=${AUTHORIZATION_KEY}
    ${trueid_login_uri}=    Replace String          ${trueid_login_verify}      _loginCode            ${code_id}
    ${trueid_login_uri}=    Replace String          ${trueid_login_uri}         _loginState           ${state_id}
    ${RESP}=                Get Request             ${GATEWAY_SESSION}          ${trueid_login_uri}   headers=${headers}
    Set Suite Variable       ${RESP}
    ${access_token}=   Set Variable If   '${RESP}'=='<Response [${SUCCESS_CODE}]>'    ${RESP.json()['access_token']}
    Set Suite Variable        ${access_token}

Create True ID Session
    Create Session    true_id_login    ${trueid_session}    verify=true

Get True ID Credential
    [Arguments]    ${username}    ${password}
    Create True ID Session
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    &{data}=    Create Dictionary    account=${username}    password=${password}
    ${resp}=    Post Request    true_id_login    ${trueid_uri}    data=${data}    headers=${headers}
    ${get_credential}=    Get Regexp Matches    ${resp.text}    window.location.href = '(.*)'    1
    ${get_credential}=    Convert To String    ${get_credential}
    ${code_id}=    Get Regexp Matches    ${get_credential}    code=(.*)&    1
    ${code_id}=    Get From List    ${code_id}    0
    ${state_id}=    Get Regexp Matches    ${get_credential}    state=(.*)'    1
    ${state_id}=    Get From List    ${state_id}    0
    Set Test Variable    ${code_id}
    Set Test Variable    ${state_id}

# Clean data
Delete Created Client And User Group
    Generate Gateway Header    ${ROLE_ADMIN}    ${ROLE_ADMIN_PASSWORD}
    ${user_group_exist}=    Run Keyword And Return Status    Variable Should Exist    ${SUITE_USER_GROUP_ID}
    ${client_exist}=    Run Keyword And Return Status    Variable Should Exist    ${CREATED_CLIENT_ID}
    Run Keyword If    ${user_group_exist} == ${True}    Delete User Group    ${SUITE_USER_GROUP_ID}
    Run Keyword If    '${ENV}' == 'production'    Reset Production User Group
    Run Keyword If    ${client_exist} == ${True}    Delete OAuth Client Details    ${CREATED_CLIENT_ID}
    Run Keyword If    '${ENV}' == 'production'    Reset Production Client
    Delete Reset All Cache
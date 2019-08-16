*** Keywords ***
Create Sdk Session
    Create Session    ${SDK_SESSION}    ${SDK_HOST}    verify=true

Post Generate Access Token
    [Arguments]    ${user_name}    ${encoded_password}
    &{data}=    Create Dictionary    client_id=190    client_secret=test    username=${user_name}    password=${encoded_password}    grant_type=password    scope=public_profile,mobile,email,references    device_id=M34567994    device_model=ME909483022O    latlong=16.56523,100.13137    ip_address=155.5.5.5
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${RESP}=    Post Request    ${SDK_SESSION}    /v4/oauth2/token    data=${data}    headers=${headers}
    Set Suite Variable    ${RESP}

Get Test Data Sdk Access Token
    Create Sdk Session
    Post Generate Access Token    ${SDK_AUTHENTICATION_USER_NAME}    ${SDK_AUTHENTICATION_PASSWORD}
    ${sdk_access_token}=    Get Value From Json    ${RESP.json()}    $.access_token
    Set Test Variable    ${TEST_DATA_SDK_ACCESS_TOKEN}    @{sdk_access_token}[0]
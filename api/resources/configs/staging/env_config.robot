*** Variables ***
${GATEWAY_SESSION}    GATEWAY_SESSION
${API_HOST}           https://gateway.weomni-test.com
${SDK_SESSION}    SDK_SESSION
${SDK_HOST}           https://sdk-auth.trueid-dev.net
${TRUE_YOU_SESSION}    TRUE_YOU_SESSION
${TRUE_YOU_HOST}           http://172.18.124.30:8080
#Client_Id : robot_automation_client
${AUTHORIZATION_KEY}    Basic cm9ib3RfYXV0b21hdGlvbl9jbGllbnQ6cm9ib3RfYXV0b21hdGlvbl9jbGllbnQ=
#Client_Id : trueyouapp
${TRUEYOU_AUTHORIZATION_KEY}    Basic dHJ1ZXlvdWFwcDp8YXNkNis+Z29wRDZSUHpS
#Client_Id : edc
${EDC_AUTHORIZATION_KEY}    Basic ZWRjX2VzdGFtcDoyfFROTm92YCV2eC08WEps
#Client_Id : admintools
${ADMIN_TOOLS_AUTHORIZATION_KEY}    Basic YWRtaW50b29sczpkZWNiX0Utamh5YUw4WmVE
${APIGEE_SESSION}    APIGEE_SESSION
${APIGEE_HOST}           https://api.weomni-test.com
${WEOMNI_AUTHORIZATION_KEY}=    Basic QVZqdTdXVDVFTVZodmhvYVUwZ0ZuZ0JMTGlWTTU1YWw6TkIyYThwUlBja1B0MFBVTQ==
${RPP_HOST}    https://am-rpp-alpha.eggdigital.com
${RPP_SESSION}     RPP_SESSION
${RPP_AUTHORIZATION_KEY}=    Basic dGVzdDoxMjM0NTY=
# List of the response code
${SUCCESS_CODE}               200
${CREATED_CODE}               201
${BAD_REQUEST_CODE}           400
${INTERNAL_SERVER_CODE}       500
${NOT_FOUND_CODE}             404
${UNAUTHORIZED}               401
${FORBIDDEN_CODE}             403
${METHOD_NOT_ALLOWED}         405
## MongoDB Configuration
${MDB_HOST}    staging-mastermerchant-db.weomni-test.com
${MDB_PORT}    ${27017}
${MDB_USER}    qa-rw
${MDB_PASSWORD}    xhWp2RJyhmUBM4xA

*** Variables ***
${GATEWAY_SESSION}    GATEWAY_SESSION
${API_HOST}           https://alpha-gateway.weomni-test.com
${SDK_SESSION}    SDK_SESSION
${SDK_HOST}           https://sdk-auth.trueid-dev.net
${TRUE_YOU_SESSION}    TRUE_YOU_SESSION
${TRUE_YOU_HOST}           http://172.18.124.30:8080
#Client_Id : trueyousellerapp
${AUTHORIZATION_KEY}    Basic dHJ1ZXlvdXNlbGxlcmFwcDpDLFpmJmR9OUckJUQzYChE
#Client_Id : trueyouapp
${TRUEYOU_AUTHORIZATION_KEY}    Basic dHJ1ZXlvdWFwcDp8YXNkNis+Z29wRDZSUHpS
#Client_Id : edc
${EDC_AUTHORIZATION_KEY}    Basic ZWRjX2VzdGFtcDoyfFROTm92YCV2eC08WEps
#Client_Id : admintools
${ADMIN_TOOLS_AUTHORIZATION_KEY}    Basic YWRtaW50b29sczpkZWNiX0Utamh5YUw4WmVE
# APIGEE gateway is not available on Alpha and Dev environments
${APIGEE_SESSION}       APIGEE_SESSION
${APIGEE_HOST}          https://api.weomni-test.com
${WEOMNI_AUTHORIZATION_KEY}=    Basic QVZqdTdXVDVFTVZodmhvYVUwZ0ZuZ0JMTGlWTTU1YWw6TkIyYThwUlBja1B0MFBVTQ==
${RPP_HOST}                 https://am-rpp-alpha.eggdigital.com
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
${MDB_HOST}    alpha-mastermerchant-db.weomni-test.com
${MDB_PORT}    ${27017}
${MDB_USER}    apollodev
${MDB_PASSWORD}    1H98msfk
## MySQL Configuration
${SQL_MODULE_NAME}    pymysql
${SQL_USERNAME}    apollodev
${SQL_PASSWORD}    1H98msfk
${SQL_HOST}    o2o-th-alpha-rds.c6ehhunbi0fx.ap-southeast-1.rds.amazonaws.com
${SQL_PORT}    3306

*** Settings ***
Resource    ../common/api_common.robot
Resource    ../common/json_common.robot


*** Variables ***
${search_campaign_url}   /promotion/api/projects


*** Keywords ***
Post Redeem To Generate Coupon
    [Arguments]    ${data}  ${project_id}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    ${search_campaign_url}/${project_id}/redeem/campaign-code    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}


Post Redeem To Use Coupon
    [Arguments]    ${data}  ${project_id}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    ${search_campaign_url}/${project_id}/redeem/campaign-code    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}
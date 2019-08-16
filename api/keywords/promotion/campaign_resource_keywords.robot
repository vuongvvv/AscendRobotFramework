*** Settings ***
Resource    ../common/api_common.robot
Resource    ../common/json_common.robot


*** Variables ***
${create_campaign_url}   /promotion/api/projects



*** Keywords ***
Post Create Campaign
    [Arguments]    ${data}  ${project_id}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    ${create_campaign_url}/${project_id}/campaigns    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Delete Campaign
    [Arguments]    ${id}  ${project_id}
    ${RESP}=    Delete Request    ${GATEWAY_SESSION}    ${create_campaign_url}/${project_id}/campaigns/${id}      headers=&{gateway_header}

Post Search Campaign
    [Arguments]   ${data}  ${project_id}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    ${create_campaign_url}/${project_id}/search    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Get Created Gencoupon CampaignID From Response
    ${gen_campaign_id_list}=    Get Value From Json    ${RESP.json()}    $.id
    ${gen_campaign_id}=    Get From List    ${gen_campaign_id_list}    0
    Set Suite Variable    ${gen_campaign_id}

Get Created Usecoupon CampaignID From Response
    ${use_campaign_id_list}=    Get Value From Json    ${RESP.json()}    $.id
    ${use_campaign_id}=    Get From List    ${use_campaign_id_list}    0
    Set Suite Variable    ${use_campaign_id}

Get Created CustomerId From Response
    ${customer_id_list}=   Get Value From Json    ${RESP.json()}   $.attribute.customerId
    ${customer_id}=    Get From List   ${customer_id_list}   0
    Set Suite Variable    ${customer_id}

Get Created Coupon RefCode From Response
    ${coupon_refcode_list}=    Get Value From Json    ${RESP.json()}    $.actions..campaign.refCode
    ${coupon_refcode}=    Get From List    ${coupon_refcode_list}   0
    Set Suite Variable    ${coupon_refcode}

Get Created Coupon Code From Response
    ${coupon_code_list}=    Get Value From Json    ${RESP.json()}    $.actionTxs..then.data..value
    ${coupon_code}=    Get From List    ${coupon_code_list}   4
    Set Suite Variable    ${coupon_code}

Get Search Coupon
    [Arguments]   ${data}  ${project_id}
    ${RESP}=    Post Request    ${GATEWAY_SESSION}    ${create_campaign_url}/${project_id}/search    data=${data}    headers=&{gateway_header}
    Set Test Variable    ${RESP}

Get Created Campaign RefCode From Response
    ${campaign_refcode_list}=    Get Value From Json    ${RESP.json()}    $.refCode
    ${campaign_refcode}=    Get From List    ${campaign_refcode_list}   0
    Set Suite Variable    ${campaign_refcode}
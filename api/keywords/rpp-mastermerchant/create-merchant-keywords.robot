*** Settings ***
Resource    ../../resources/import.robot

*** Keywords ***
Call Create Merchant API With JSON Body
    [Arguments]    ${jsonbody}
    Create Session    post_create_merchant    ${egg_api_url}    disable_warnings=${1}
    ${headers}=    Set header
    ${RESP}=    Post Request    post_create_merchant    ${create_merchant_uri}    data=${jsonbody}    headers=${headers}
    Run Keyword If    ${RESP.status_code} == 200    Set Global Variable    ${json_resp}    ${RESP.json()}
    Set Global Variable    ${response}    ${RESP}

Call Create Merchant API With JSON Body and create Global Variable for preparing use in Get_Benefit_in_Merchant API

    [Arguments]    ${jsonbody}
    Create Session    post_create_merchant    ${egg_api_url}    disable_warnings=${1}
    ${headers}=    Set header
    ${RESP}=    Post Request    post_create_merchant    ${create_merchant_uri}    data=${jsonbody}    headers=${headers}
    Run Keyword If    ${RESP.status_code} == 200    Set Test Variable    ${json_resp}    ${RESP.json()}
    Set Test Variable    ${response}    ${RESP}


    ${convert}=  Converting a JSON File       ${response.text}
    Log     ${convert['id']}
    Log     ${convert['merchantId']}
    Set Global Variable	${getMerchantId}	${convert['merchantId']}    ## Create Global Variable for calling in Add or Update Benefit in Merchant
    ${getMerchantId}    Set Global Variable        ${convert['merchantId']}          ## Create Global Variable for calling in Add or Update Benefit in Merchant


Call Create Merchant API With JSON Body and create Global Variable_AU_1001

    [Arguments]    ${jsonbody}
    Create Session    post_create_merchant    ${egg_api_url}    disable_warnings=${1}
    ${headers}=    Set header
    ${RESP}=    Post Request    post_create_merchant    ${create_merchant_uri}    data=${jsonbody}    headers=${headers}
    Run Keyword If    ${RESP.status_code} == 200    Set Test Variable    ${json_resp}    ${RESP.json()}
    Set Test Variable    ${response}    ${RESP}


    ${convert}=  Converting a JSON File       ${response.text}
    Log     ${convert['id']}
    Log     ${convert['merchantId']}
    Log     ${convert['trueyouId']}

    Set Global Variable	${New_merchantId1}	${convert['merchantId']}    ## Create Global Variable for calling in Add or Update Benefit in Merchant
    ${New_merchantId1}    Set Variable    ${convert['merchantId']}          ## Create Global Variable for calling in Add or Update Benefit in Merchant

    Set Global Variable	${New_trueyouId1}	${convert['trueyouId']}    ## Create Global Variable for calling in Add or Update Benefit in Merchant
    ${New_trueyouId1}    Set Variable       ${convert['trueyouId']}          ## Create Global Variable for calling in Add or Update Benefit in Merchant

Call Create Merchant API With JSON Body and create Global Variable_AU_1002

    [Arguments]    ${jsonbody}
    Create Session    post_create_merchant    ${egg_api_url}    disable_warnings=${1}
    ${headers}=    Set header
    ${RESP}=    Post Request    post_create_merchant    ${create_merchant_uri}    data=${jsonbody}    headers=${headers}
    Run Keyword If    ${RESP.status_code} == 200    Set Test Variable    ${json_resp}    ${RESP.json()}
    Set Test Variable    ${response}    ${RESP}


    ${convert}=  Converting a JSON File       ${response.text}
    Log     ${convert['id']}
    Log     ${convert['merchantId']}
    Set Global Variable	${New_merchantId2}	${convert['merchantId']}    ## Create Global Variable for calling in Add or Update Benefit in Merchant
    ${New_merchantId2}    Set Variable    ${convert['merchantId']}          ## Create Global Variable for calling in Add or Update Benefit in Merchant

Call Create Merchant API With JSON Body and create Global Variable_AU_2004

    [Arguments]    ${jsonbody}
    Create Session    post_create_merchant    ${egg_api_url}    disable_warnings=${1}
    ${headers}=    Set header
    ${RESP}=    Post Request    post_create_merchant    ${create_merchant_uri}    data=${jsonbody}    headers=${headers}
    Run Keyword If    ${RESP.status_code} == 200    Set Test Variable    ${json_resp}    ${RESP.json()}
    Set Test Variable    ${response}    ${RESP}


    ${convert}=  Converting a JSON File       ${response.text}
    Log     ${convert['id']}
    Log     ${convert['merchantId']}


Create New Merchant
    Prepare Json Request    ${create_merchant_api_birthdate}
    Prepare Merchant Info by birthdate
    Call Create Merchant API With JSON Body    ${request}
    Save 'id' As 'new_id' From Response
    Save 'merchantId' As 'new_mid' From Response
    Save 'trueyouId' As 'new_trid' From Response
    Save 'tmnMerchantId' As 'new_tmnid' From Response
    Save 'refId' As 'new_refid' From Response

Prepare Merchant Info
    Get Rand Numbers Only    7
    Update 'merchantId' Is '${rand_num}' For Request
    Get Rand Numbers Only    11
    Update '"trueyouId"' Is '${rand_num}' For Request
    Get Rand Numbers Only    7
    Update 'tmnMerchantId' Is '${rand_num}' For Request
    Get Rand Letters and Numbers    32
    Update 'refId' Is '${rand_str}' For Request
    Get Rand Numbers Only    13
    Update 'thaiId' Is '${rand_num}' For Request

Prepare Merchant Info_without random thaiID
    Get Rand Numbers Only    7
    Update 'merchantId' Is '${rand_num}' For Request
    Get Rand Numbers Only    5
    Update '"trueyouId"' Is '${rand_num}' For Request
    Get Rand Numbers Only    7
    Update 'tmnMerchantId' Is '${rand_num}' For Request
    Get Rand Letters and Numbers    32
    Update 'refId' Is '${rand_str}' For Request


Prepare Merchant Info by creating Global thaiID from random number
    Get Rand Numbers Only    7
    Update 'merchantId' Is '${rand_num}' For Request
    Get Rand Numbers Only    7
    Update '"trueyouId"' Is '${rand_num}' For Request
    Get Rand Numbers Only    7
    Update 'tmnMerchantId' Is '${rand_num}' For Request
    Get Rand Letters and Numbers    32
    Update 'refId' Is '${rand_str}' For Request
    Get Rand Numbers Only    13
    Update 'thaiId' Is '${rand_num}' For Request
    Set Global Variable  ${thaiIdByRandom}   ${rand_num}

Prepare Merchant Info by calling Global thaiID from random number

    Get Rand Numbers Only    7
    Update 'merchantId' Is '${rand_num}' For Request
    Get Rand Numbers Only    7
    Update '"trueyouId"' Is '${rand_num}' For Request
    Get Rand Numbers Only    7
    Update 'tmnMerchantId' Is '${rand_num}' For Request
    Get Rand Letters and Numbers    32
    Update 'refId' Is '${rand_str}' For Request
    Update 'thaiId' Is '${thaiIdByRandom}' For Request

Prepare Merchant Info by birthdate
    Prepare Merchant Info
    Update 'birthdate' Is '1990-04-18' For Request

Prepare Merchant Info by tmnApproveDate
    Prepare Merchant Info by birthdate
    Update 'tmnApproveDate' Is '2018-10-25T16:37:16' For Request

Prepare Merchant Info by trueyouApproveDate
    Prepare Merchant Info by tmnApproveDate
    Update '"trueyouApproveDate"' Is '2018-10-25T16:37:16' For Request

Prepare Merchant Info by approveDate
    Prepare Merchant Info by trueyouApproveDate
    Update 'approveDate' Is '2018-10-25T16:37:16' For Request

Verify Response error code for don't fill in data
    ${convert}=  Converting a JSON File       ${response.text}
    ${size}=     Get Length    ${convert['fieldErrors']}
    :FOR  ${INDEX}    IN RANGE    0    ${size}
    \    fieldErrors.field       ${convert['fieldErrors'][${INDEX}]['field']}
    \    fieldErrors.message       ${convert['fieldErrors'][${INDEX}]['message']}

fieldErrors.field
   [Arguments]      ${fieldErrors_field}
   run keyword if    '${fieldErrors_field}'=='NotBlank'    Should Be Equal As Strings       NotBlank     ${fieldErrors_field}
   ...      ELSE IF      '${fieldErrors_field}'=='NotNull'    Should Be Equal As Strings       NotNull    ${fieldErrors_field}
   ...      ELSE    Should Be Equal As Strings  ${response.status_code}     200

fieldErrors.message
   [Arguments]      ${fieldErrors_message}
   run keyword if    '${fieldErrors_message}'=='FirstName is required.'    Should Be Equal As Strings       FirstName is required.     ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='ContactNo is required.'    Should Be Equal As Strings       ContactNo is required.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='TitleId is required.'    Should Be Equal As Strings       TitleId is required.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='ThaiId is required.'    Should Be Equal As Strings       ThaiId is required.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='BusinessType is required.'    Should Be Equal As Strings       BusinessType is required.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='LastName is required.'    Should Be Equal As Strings       LastName is required.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='MerchantId is required.'    Should Be Equal As Strings       MerchantId is required.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='DeviceType is required.'    Should Be Equal As Strings       DeviceType is required.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='Thai Store Name is required.'    Should Be Equal As Strings       Thai Store Name is required.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='Gender is required'    Should Be Equal As Strings       Gender is required    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='TrueyouId is required.'    Should Be Equal As Strings       TrueyouId is required.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='RegisterChannel is required.'    Should Be Equal As Strings       RegisterChannel is required.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='Status is required.'    Should Be Equal As Strings       Status is required.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='Category Id is required.'    Should Be Equal As Strings       Category Id is required.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='StoreTypeId is required.'    Should Be Equal As Strings       StoreTypeId is required.    ${fieldErrors_message}
   ...      ELSE    Should Be Equal As Strings  ${response.status_code}     200

Verify Response error code for data already exists
    ${convert}=  Converting a JSON File       ${response.text}
    ${size}=     Get Length    ${convert['fieldErrors']}
    :FOR  ${INDEX}    IN RANGE    0    ${size}
    \    fieldErrors_field       ${convert['fieldErrors'][${INDEX}]['field']}
    \    fieldErrors_message       ${convert['fieldErrors'][${INDEX}]['message']}

fieldErrors_field
   [Arguments]      ${fieldErrors_field}
   run keyword if    '${fieldErrors_field}'=='MerchantIdDuplicate'    Should Be Equal As Strings       MerchantIdDuplicate     ${fieldErrors_field}
   ...      ELSE IF      '${fieldErrors_field}'=='RefIdDuplicate'    Should Be Equal As Strings       RefIdDuplicate    ${fieldErrors_field}
   ...      ELSE IF      '${fieldErrors_field}'=='TrueYouIdDuplicate'    Should Be Equal As Strings       TrueYouIdDuplicate    ${fieldErrors_field}
   ...      ELSE IF      '${fieldErrors_field}'=='TmnMerchantIdDuplicate'    Should Be Equal As Strings       TmnMerchantIdDuplicate    ${fieldErrors_field}
   ...      ELSE IF      '${fieldErrors_field}'=='thaiId'    Should Be Equal As Strings       thaiId    ${fieldErrors_field}
   ...      ELSE    Should Be Equal As Strings  ${response.status_code}     200

fieldErrors_message
   [Arguments]      ${fieldErrors_message}
   run keyword if    '${fieldErrors_message}'=='Ref id duplicate.'    Should Be Equal As Strings       Ref id duplicate.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='TrueyouId duplicate.'    Should Be Equal As Strings       TrueyouId duplicate.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='TmnMerchantId duplicate.'    Should Be Equal As Strings       TmnMerchantId duplicate.    ${fieldErrors_message}
   ...      ELSE IF      '${fieldErrors_message}'=='MerchantId duplicate.'    Should Be Equal As Strings       MerchantId duplicate.     ${fieldErrors_message}
   ...      ELSE    Should Be Equal As Strings  ${response.status_code}     200
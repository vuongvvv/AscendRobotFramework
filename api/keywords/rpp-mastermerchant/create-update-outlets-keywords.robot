*** Settings ***
Resource    ../../resources/import.robot

*** Keywords ***

##### Merchant part #####
To Create a New Merchant for using in 'create outlet' script
    Prepare Json Request    ${create_merchant_for_outlet}
    Prepare Merchant Info
    Call Create Merchant API With JSON Body    ${request}

To Covert a JSON File for using in 'create outlet' script
   Log Json      ${response.text}
   ${convert_mechantInfo}=  Converting a JSON File       ${response.text}
   Log           ${convert_mechantInfo}
   Log           ${convert_mechantInfo['merchantId']}
   Set Global Variable     ${MerchantId_forOutlet}           ${convert_mechantInfo['merchantId']}

########################

To Prepare JSON file for sending request to the system (multi oulet)

  Log        ${trueyouIdByRandom0}
  Log        ${trueyouIdByRandom1}
  Log        ${outletsIdByRandom0}
  Log        ${outletsIdByRandom1}
  Log        ${tmnOutletIdByRandom0}
  Log        ${tmnOutletIdByRandom1}

    &{create_newOutlet0}   create dictionary
    ...   outletId=${outletsIdByRandom0}
    ...   tmnOutletId=${tmnOutletIdByRandom0}
    ...   outletNameTh=พารากอน
    ...   outletNameEn=Paragon
    ...   outletDetail=ชั้น1
    ...   titleId=2
    ...   contactFirstName=Postpet
    ...   contactLastName=Momo
    ...   contactMobile=0896757874
    ...   contactTel=0896757889
    ...   contactEmail=sipahtsanan.kit@ascendcorp.com
    ...   headQuarter=true
    ...   status=APPROVE
    ...   terminalTotal=5
    ...   trueyouId=${trueyouIdByRandom0}

    &{create_newOutlet1}   create dictionary
    ...   outletId=${outletsIdByRandom1}
    ...   tmnOutletId=${tmnOutletIdByRandom1}
    ...   outletNameTh=พารากอน
    ...   outletNameEn=Paragon
    ...   outletDetail=ชั้น1
    ...   titleId=2
    ...   contactFirstName=Postpet
    ...   contactLastName=Momo
    ...   contactMobile=0896757874
    ...   contactTel=0896757889
    ...   contactEmail=sipahtsanan.kit@ascendcorp.com
    ...   headQuarter=true
    ...   status=APPROVE
    ...   terminalTotal=5
    ...   trueyouId=${trueyouIdByRandom1}

    @{outlets_lists}   create list    ${create_newOutlet0}     ${create_newOutlet1}

    &{outlets}   create dictionary
    ...     outlets=${outlets_lists}
    Return From Keyword    ${outlets}

To Prepare JSON file for sending request to the system (one oulet)
  Log        ${trueyouIdByRandom0}
  Log        ${outletsIdByRandom0}
  Log        ${tmnOutletIdByRandom0}

    &{create_newOutlet}   create dictionary
    ...   outletId=${outletsIdByRandom0}
    ...   tmnOutletId=${tmnOutletIdByRandom0}
    ...   outletNameTh=พารากอน
    ...   outletNameEn=Paragon
    ...   outletDetail=ชั้น1
    ...   titleId=2
    ...   contactFirstName=Postpet
    ...   contactLastName=Momo
    ...   contactMobile=0896757874
    ...   contactTel=0896757889
    ...   contactEmail=sipahtsanan.kit@ascendcorp.com
    ...   headQuarter=true
    ...   status=APPROVE
    ...   terminalTotal=5
    ...   trueyouId=${trueyouIdByRandom0}

    @{outlets0}   create list   ${create_newOutlet}

    &{outlets}   create dictionary
    ...     outlets=${outlets0}
    Return From Keyword    ${outlets}

To Prepare Outlet Info by creating Global outletID from random number
    Get Rand Numbers Only    11
    Set Global Variable  ${outletsIdByRandom0}   ${rand_num}
    Get Rand Numbers Only    11
    Set Global Variable  ${outletsIdByRandom1}   ${rand_num}

To Prepare Outlet Info by creating Global trueyouId from random number
    Get Rand Numbers Only    11
    Set Global Variable  ${trueyouIdByRandom0}   ${rand_num}
    Get Rand Numbers Only    11
    Set Global Variable  ${trueyouIdByRandom1}   ${rand_num}

To Prepare Outlet Info by creating Global tmnOutletId from random number
    Get Rand Numbers Only    11
    Set Global Variable  ${tmnOutletIdByRandom0}   ${rand_num}
    Get Rand Numbers Only    11
    Set Global Variable  ${tmnOutletIdByRandom1}   ${rand_num}

To Create multi outlets API With JSON Body
    [Arguments]    ${merchantId}        ${jsonbody}
    Create Session    post_create_outlets    ${url}    disable_warnings=${1}
    &{headers}   set header
    ${RESP}=    Post Request    post_create_outlets    /api/merchants/${merchantId}/outlets    data=${jsonbody}    headers=${headers}
    Run Keyword If    ${RESP.status_code} == 201    Set Test Variable    ${json_resp}    ${RESP.json()}
    Set Test Variable       ${response}    ${RESP}


To Get Outlets Info and set it to be Global outlet

    ${convert}=  Converting a JSON File       ${response.text}
    Log    ${convert}
    Set Global Variable          ${getOutletId}               ${convert['outlets'][0]['outletId']}



Calling update Outlet
    [Arguments]   ${merchantId}    ${data_post}
    Create Session    PUT_Update_Outlet   ${url}        disable_warnings=${1}
    &{headers}   set header
    ${RESP}=    Put Request    PUT_Update_Outlet   /api/merchants/${merchantId}/outlets    data=${data_post}    headers=${headers}
    Run Keyword If    ${RESP.status_code} == 200    Set Test Variable    ${json_resp}    ${RESP.json()}
    Set Global Variable       ${response}    ${RESP}


To Prepare JSON file for Updating request data
  ${convert}=  Converting a JSON File       ${response.text}
  Log    ${convert}
  Log    ${convert['outlets'][0]['id']}
  Log    ${convert['outlets'][0]['outletNameEn']}
  &{update_newOutlet}   create dictionary
    ...   id=${convert['outlets'][0]['id']}
    ...   outletId=${convert['outlets'][0]['outletId']}
    ...   tmnOutletId=${convert['outlets'][0]['tmnOutletId']}
    ...   outletNameTh=${convert['outlets'][0]['outletNameTh']}
    ...   outletNameEn=${convert['outlets'][0]['outletNameEn']}
    ...   outletDetail=ลองเปลี่ยนข้อมูลหน่อยค่ะ
    ...   titleId=${convert['outlets'][0]['titleId']}
    ...   contactFirstName=แป๋มนะ
    ...   contactLastName=แป๋มเองไง
    ...   contactMobile=${convert['outlets'][0]['contactMobile']}
    ...   contactTel=${convert['outlets'][0]['contactTel']}
    ...   contactEmail=${convert['outlets'][0]['contactEmail']}
    ...   headQuarter=${convert['outlets'][0]['headQuarter']}
    ...   status=${convert['outlets'][0]['status']}
    ...   trueyouId=${convert['outlets'][0]['trueyouId']}
    ...   createBy=${convert['outlets'][0]['createBy']}
    ...   createDate=${convert['outlets'][0]['createDate']}
    ...   modifyBy=${convert['outlets'][0]['modifyBy']}
    ...   modifyDate=${convert['outlets'][0]['modifyDate']}
    ...   outletGroups=${convert['outlets'][0]['outletGroups']}

    @{outlets0}   create list   ${update_newOutlet}

    &{outlets}   create dictionary
    ...     outlets=${outlets0}
    Return From Keyword    ${outlets}


To Prepare JSON file for Updating request data by sending some parameter
  ${convert}=  Converting a JSON File       ${RESPonse.text}
  Log    ${convert}
  Log    ${convert['outlets'][0]['id']}
  Log    ${convert['outlets'][0]['outletNameEn']}
  &{update_newOutlet}   create dictionary
    ...   id=${convert['outlets'][0]['id']}
    ...   outletDetail=ลองเปลี่ยนข้อมูลหน่อยค่ะ

    @{outlets0}   create list   ${update_newOutlet}

    &{outlets}   create dictionary
    ...     outlets=${outlets0}
    Return From Keyword    ${outlets}
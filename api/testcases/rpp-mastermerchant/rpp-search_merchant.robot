*** Settings ***
Resource          ../../resources/import.robot

*** Test Cases ***

TC_O2O_06643
    [Documentation]         Verify search (Merchant) when fill in data truly exist in ID
    [Tags]    Regression      Sanity      Medium      Hercules
    Given Create New Merchant
    And Create Search String For Search Merchant
    And Add Query String 'Id' With '${new_id}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content[0].id' Should Be Equal '${new_id}'
    And Response Field 'totalPages' Should Be Equal '1'
    And Response Field 'totalElements' Should Be Equal '1'

TC_O2O_06644
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in ID
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'Id' With '5965' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06645
    [Documentation]         Verify search (Merchant) when ID don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'Id' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06646
    [Documentation]         Verify search (Merchant) when fill in Id dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'Id' With '666666666666666' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06647
    [Documentation]         Verify search (Merchant) when fill in data truly exist in Merchant ID
    [Tags]    Regression      Medium      Hercules
    Given Create New Merchant
    And Create Search String For Search Merchant
    And Add Query String 'merchantId' With '${new_mid}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content[0].merchantId' Should Be Equal '${new_mid}'
    And Response Field 'totalPages' Should Be Equal '1'
    And Response Field 'totalElements' Should Be Equal '1'

TC_O2O_06648
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in Merchant ID
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantId' With '0045' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06649
    [Documentation]         Verify search (Merchant) when Merchant ID don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantId' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06650
    [Documentation]         Verify search (Merchant) when fill in merchantId dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantId' With 'กก66' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06651
    [Documentation]         Verify search (Merchant) when fill in data truly exist in trueyouId
    [Tags]    Regression      Medium      Hercules
    Given Create New Merchant
    And Create Search String For Search Merchant
    And Add Query String 'trueyouId' With '${new_trid}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content[0]."trueyouId"' Should Be Equal '${new_trid}'
    And Response Field 'totalPages' Should Be Equal '1'
    And Response Field 'totalElements' Should Be Equal '1'

TC_O2O_06652
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in trueyouId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'trueyouId' With '200001' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06653
    [Documentation]         Verify search (Merchant) when trueyouId don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'trueyouId' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06654
    [Documentation]         Verify search (Merchant) when fill in trueyouId dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'trueyouId' With '66ddกก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06655
    [Documentation]         Verify search (Merchant) when fill in data truly exist in tmnMerchantId
    [Tags]    Regression      Medium      Hercules
    Given Create New Merchant
    And Create Search String For Search Merchant
    And Add Query String 'tmnMerchantId' With '${new_tmnid}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content[0].tmnMerchantId' Should Be Equal '${new_tmnid}'
    And Response Field 'totalPages' Should Be Equal '1'
    And Response Field 'totalElements' Should Be Equal '1'

TC_O2O_06656
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in tmnMerchantId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'tmnMerchantId' With '0045' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06657
    [Documentation]         Verify search (Merchant) when tmnMerchantId don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'tmnMerchantId' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06658
    [Documentation]         Verify search (Merchant) when fill in tmnMerchantId dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'tmnMerchantId' With '66ddกก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06659
    [Documentation]         Verify search (Merchant) when fill in data truly exist in businessType
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'businessType' With 'INDIVIDUAL' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06660
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in businessType
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'businessType' With 'INDIVI' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '400'
    And Response Field 'violations[0].field' Should Be Equal 'businessType'

TC_O2O_06661
    [Documentation]         Verify search (Merchant) when businessType don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'businessType' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06662
    [Documentation]         Verify search (Merchant) when fill in businessType dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'businessType' With 'กก66dd' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '400'
    And Response Field 'violations[0].field' Should Be Equal 'businessType'

TC_O2O_06663
    [Documentation]         Verify search (Merchant) when fill in data truly exist in categoryId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'categoryId' With '02bdf8c080f2b6b699e5b711d13d5cac' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06664
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in categoryId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'categoryId' With '02bd' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06665
    [Documentation]         Verify search (Merchant) when categoryId don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'categoryId' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06666
    [Documentation]         Verify search (Merchant) when fill in categoryId dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'categoryId' With '66ddกก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06667
    [Documentation]         Verify search (Merchant) when fill in data truly exist in storeTypeId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeTypeId' With '1' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06668
    [Documentation]         Verify search (Merchant) when storeTypeId don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeTypeId' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06669
    [Documentation]         Verify search (Merchant) when fill in storeTypeId dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeTypeId' With '10' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06670
    [Documentation]         Verify search (Merchant) when fill in data truly exist in registerChannel
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'registerChannel' With 'mobile_admin_register' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06671
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in registerChannel
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'registerChannel' With 'mobile' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '400'
    And Response Field 'violations[0].field' Should Be Equal 'registerChannel'

TC_O2O_06672
    [Documentation]         Verify search (Merchant) when registerChannel don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'registerChannel' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06673
    [Documentation]         Verify search (Merchant) when fill in registerChannel dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'registerChannel' With '66ddกก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '400'
    And Response Field 'violations[0].field' Should Be Equal 'registerChannel'

TC_O2O_06674
    [Documentation]         Verify search (Merchant) when fill in data truly exist in storeNameTh
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeNameTh' With 'ลำไย' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06675
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in storeNameTh
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeNameTh' With 'ไย' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06676
    [Documentation]         Verify search (Merchant) when storeNameTh don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeNameTh' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06677
    [Documentation]         Verify search (Merchant) when fill in storeNameTh dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeNameTh' With 'dsd223ดก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06678
    [Documentation]         Verify search (Merchant) when fill in data truly exist in storeNameEn
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeNameEn' With 'Longan' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06679
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in storeNameEn
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeNameEn' With 'Long' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06680
    [Documentation]         Verify search (Merchant) when storeNameEn don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeNameEn' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06681
    [Documentation]         Verify search (Merchant) when fill in storeNameEn dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeNameEn' With 'dsd223ดก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06682
    [Documentation]         Verify search (Merchant) when fill in data truly exist in thaiId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'thaiId' With '3300701174152' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06683
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in thaiId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'thaiId' With '174152' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06684
    [Documentation]         Verify search (Merchant) when thaiId don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'thaiId' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06685
    [Documentation]         Verify search (Merchant) when fill in thaiId dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'thaiId' With 'dsd223ดก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06686
    [Documentation]         Verify search (Merchant) when fill in data truly exist in titleId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'titleId' With '99' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06687
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in titleId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'titleId' With '9' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06688
    [Documentation]         Verify search (Merchant) when titleId don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'titleId' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06689
    [Documentation]         Verify search (Merchant) when fill in titleId dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'titleId' With '6' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06690
    [Documentation]         Verify search (Merchant) when fill in data truly exist in firstName
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'firstName' With 'โรบอท' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06691
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in titleId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'firstName' With 'โร' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06692
    [Documentation]         Verify search (Merchant) when firstName don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'firstName' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06693
    [Documentation]         Verify search (Merchant) when fill in firstName dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'firstName' With '44ddภภ' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06694
    [Documentation]         Verify search (Merchant) when fill in data truly exist in lastName
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'lastName' With 'ทดสอบ' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06695
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in lastName
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'lastName' With 'ทด' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06696
    [Documentation]         Verify search (Merchant) when lastName don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'lastName' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06697
    [Documentation]         Verify search (Merchant) when fill in lastName dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'lastName' With 'ภภ44dd' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06698
    [Documentation]         Verify search (Merchant) when fill in data truly exist in contactNo
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'contactNo' With '66-917017212' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06699
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in contactNo
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'contactNo' With '17212' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06700
    [Documentation]         Verify search (Merchant) when contactNo don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'contactNo' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06701
    [Documentation]         Verify search (Merchant) when fill in contactNo dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'contactNo' With '44ffกก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06702
    [Documentation]         Verify search (Merchant) when fill in data truly exist in storeContactNo1
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeContactNo1' With '0851699960' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06703
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in storeContactNo1
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeContactNo1' With '085169' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06704
    [Documentation]         Verify search (Merchant) when storeContactNo1 don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeContactNo1' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06705
    [Documentation]         Verify search (Merchant) when fill in storeContactNo1 dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeContactNo1' With '44ffกก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06706
    [Documentation]         Verify search (Merchant) when fill in data truly exist in storeContactNo2
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeContactNo2' With '66-917017212' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06707
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in storeContactNo2
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeContactNo2' With '91701' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06708
    [Documentation]         Verify search (Merchant) when storeContactNo2 don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeContactNo2' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06709
    [Documentation]         Verify search (Merchant) when fill in storeContactNo2 dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeContactNo2' With 'ภภ44dd' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06710
    [Documentation]         Verify search (Merchant) when fill in data truly exist in storeWebsite
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeWebsite' With 'test_true' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06711
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in storeWebsite
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeWebsite' With 'true' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06712
    [Documentation]         Verify search (Merchant) when storeWebsite don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeWebsite' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06713
    [Documentation]         Verify search (Merchant) when fill in storeWebsite dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeWebsite' With '44ddกก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06714
    [Documentation]         Verify search (Merchant) when fill in data truly exist in storeFacebook
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeFacebook' With 'https://www.facebook.com/jhh' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06715
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in storeFacebook
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeFacebook' With 'jhh' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06716
    [Documentation]         Verify search (Merchant) when storeFacebook don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeFacebook' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06717
    [Documentation]         Verify search (Merchant) when fill in storeFacebook dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeFacebook' With '44ddกก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06718
    [Documentation]         Verify search (Merchant) when fill in data truly exist in storeLineAt
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeLineAt' With 'aongnoymario' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06719
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in storeLineAt
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeLineAt' With 'aong' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06720
    [Documentation]         Verify search (Merchant) when storeLineAt don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeLineAt' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06721
    [Documentation]         Verify search (Merchant) when fill in storeLineAt dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeLineAt' With '44ddกก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06722
    [Documentation]         Verify search (Merchant) when fill in data truly exist in storeTwitter
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeTwitter' With 'zzzz' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06723
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in storeTwitter
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeTwitter' With 'zz' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06724
    [Documentation]         Verify search (Merchant) when storeTwitter don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeTwitter' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06725
    [Documentation]         Verify search (Merchant) when fill in storeTwitter dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeTwitter' With '44ddกก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06726
    [Documentation]         Verify search (Merchant) when fill in data truly exist in storeInstagram
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeInstagram' With 'STAR' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06727
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in storeInstagram
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeInstagram' With 'ST' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06728
    [Documentation]         Verify search (Merchant) when storeInstagram don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeInstagram' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06729
    [Documentation]         Verify search (Merchant) when fill in storeInstagram dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'storeInstagram' With '44ddกก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06730
    [Documentation]         Verify search (Merchant) when fill in data truly exist in email
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'email' With 'chudapa.moon@ascendcorp.com' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06731
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in email
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'email' With 'chudapa.moon' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06732
    [Documentation]         Verify search (Merchant) when email don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'email' With '${EMPTY}.moon' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06733
    [Documentation]         Verify search (Merchant) when fill in email dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'email' With '44ddกก' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06734
    [Documentation]         Verify search (Merchant) when fill in data truly exist in lineId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'lineId' With 'ZOMID' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06735
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in lineId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'lineId' With 'ZO' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06736
    [Documentation]         Verify search (Merchant) when lineId don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'lineId' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06737
    [Documentation]         Verify search (Merchant) when fill in lineId dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'lineId' With '45svfึ฿๕๕' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06738
    [Documentation]         Verify search (Merchant) when fill in data truly exist in lineAt
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'lineAt' With 'ZOMID' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06739
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in lineAt
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'lineAt' With 'ZOM' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06740
    [Documentation]         Verify search (Merchant) when lineAt don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'lineAt' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06741
    [Documentation]         Verify search (Merchant) when fill in lineAt dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'lineAt' With '45svfึ฿๕๕' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06742
    [Documentation]         Verify search (Merchant) when fill in data truly exist in refId
    [Tags]    Regression      Medium      Hercules
    Given Create New Merchant
    And Create Search String For Search Merchant
    And Add Query String 'refId' With '${new_refid}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content[0].refId' Should Be Equal '${new_refid}'
    And Response Field 'totalPages' Should Be Equal '1'
    And Response Field 'totalElements' Should Be Equal '1'

TC_O2O_06743
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in refId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'refId' With '02bdf8c080f2b' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06744
    [Documentation]         Verify search (Merchant) when refId don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'refId' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06745
    [Documentation]         Verify search (Merchant) when fill in refId dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'refId' With 'ภภ44ee' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06746
    [Documentation]         Verify search (Merchant) when fill in data truly exist in taxId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'taxId' With '3300701174152' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content[0].taxId' Should Be Equal '3300701174152'
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06747
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in taxId
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'taxId' With '1174152' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06748
    [Documentation]         Verify search (Merchant) when taxId don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'taxId' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06749
    [Documentation]         Verify search (Merchant) when fill in taxId dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'taxId' With '44กดdd' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06750
    [Documentation]         Verify search (Merchant) when fill in data truly exist in serviceType
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'serviceType' With 'EDC' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06751
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in serviceType
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'serviceType' With 'ED' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06752
    [Documentation]         Verify search (Merchant) when serviceType don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'serviceType' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06753
    [Documentation]         Verify search (Merchant) when fill in serviceType dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'serviceType' With '45ดกc' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06754
    [Documentation]         Verify search (Merchant) when fill in data truly exist in deviceType
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'deviceType' With 'BarcodeQR' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06755
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in deviceType
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'deviceType' With 'codeQR' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06756
    [Documentation]         Verify search (Merchant) when deviceType don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'deviceType' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06757
    [Documentation]         Verify search (Merchant) when fill in deviceType dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'deviceType' With 'reภภ44' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06758
    [Documentation]         Verify search (Merchant) when fill in data truly exist in paymentMethod
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantGroups' With 'university' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06759
    [Documentation]         Verify search (Merchant) when merchantGroup don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantGroups' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06761
    [Documentation]         Verify search (Merchant) when fill in data truly exist in status
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'status' With 'ACTIVATE' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06762
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in status
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'status' With 'ACTI' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '400'
    And Response Field 'violations[0].field' Should Be Equal 'status'

TC_O2O_06763
    [Documentation]         Verify search (Merchant) when status don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'status' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06764
    [Documentation]         Verify search (Merchant) when fill in status dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'status' With 'ww44ดด' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '400'
    And Response Field 'violations[0].field' Should Be Equal 'status'

TC_O2O_06765
    [Documentation]         Verify search (Merchant) when fill in data truly exist in createDateStart
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'createDateStart' With '2018-08-21T11:30:06' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06766
    [Documentation]         Verify search (Merchant) when createDateStart don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'createDateStart' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06767
    [Documentation]         Verify search (Merchant) when fill in data truly exist in createDateEnd
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'createDateEnd' With '2018-08-21T11:30:06' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06768
    [Documentation]         Verify search (Merchant) when createDateEnd don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'createDateEnd' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06769
    [Documentation]         Verify search (Merchant) when fill in data truly exist in createBy
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'createBy' With 'system' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06770
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in createBy
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'createBy' With 'sys' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06771
    [Documentation]         Verify search (Merchant) when createBy don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'createBy' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06772
    [Documentation]         Verify search (Merchant) when fill in createBy dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'createBy' With 'manual' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06773
    [Documentation]         Verify search (Merchant) when fill in data truly exist in modifyDateStart
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'modifyDateStart' With '2018-08-21T11:30:06' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06774
    [Documentation]         Verify search (Merchant) when modifyDateStart don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'modifyDateStart' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06775
    [Documentation]         Verify search (Merchant) when fill in data truly exist in modifyBy
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'modifyBy' With 'migrated by etl' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06776
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in modifyBy
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'modifyBy' With 'migrated' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06777
    [Documentation]         Verify search (Merchant) when modifyBy don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'modifyBy' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06779
    [Documentation]         Verify search (Merchant) when require to system show data size
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'size' With '2' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'
    And Response Field 'size' Should Be Equal '2'
    And Response Field 'numberOfElements' Should Be Equal '2'

TC_O2O_06780
    [Documentation]         Verify search (Merchant) when size don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'size' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'
    And Response Field 'size' Should Be Equal '20'
    And Response Field 'numberOfElements' Should Be Equal '20'

TC_O2O_06781
    [Documentation]         Verify search (Merchant) when require to system show data sort
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'sort' With 'email,asc' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06782
    [Documentation]         Verify search (Merchant) when fill in data truly exist in merchantGroup.id
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantGroup.id' With '1' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06783
    [Documentation]         Verify search (Merchant) when merchantGroup.id don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantGroup.id' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06784
    [Documentation]         Verify search (Merchant) when fill in merchantGroup.id dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantGroup.id' With '99' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06785
    [Documentation]         Verify search (Merchant) when fill in data truly exist in merchantGroup.name
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantGroup.name' With 'university' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06786
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in merchantGroup.name
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantGroup.name' With 'ma' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06787
    [Documentation]         Verify search (Merchant) when merchantGroup.name don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantGroup.name' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06788
    [Documentation]         Verify search (Merchant) when fill in merchantGroup.name dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantGroup.name' With 'major' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06789
    [Documentation]         Verify search (Merchant) when fill in data truly exist in merchantGroup.code
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantGroup.code' With 'cabbie' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06790
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in merchantGroup.code
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantGroup.code' With 'cab' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06791
    [Documentation]         Verify search (Merchant) when merchantGroup.code don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantGroup.code' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06792
    [Documentation]         Verify search (Merchant) when fill in merchantGroup.code dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'merchantGroup.code' With 'major' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06793
    [Documentation]         Verify search (Merchant) when fill in data truly exist in birthDateStart
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'birthDateStart' With '1990-04-18' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06794
    [Documentation]         Verify search (Merchant) when birthDateStart don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'birthDateStart' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06795
    [Documentation]         Verify search (Merchant) when fill in data truly exist in birthDateEnd
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'birthDateEnd' With '1990-04-18' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06796
    [Documentation]         Verify search (Merchant) when birthDateEnd don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'birthDateEnd' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06797
    [Documentation]         Verify search (Merchant) when fill in data truly exist in (birthDateStart,birthDateEnd)
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'birthDateStart' With '1990-04-18' For Search Merchant
    And Add Query String 'birthDateEnd' With '1990-04-18' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06798
    [Documentation]         Verify search (Merchant) when fill in data truly exist in gender
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'gender' With 'male' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06799
    [Documentation]         Verify search (Merchant) when fill in data truly exist in gender
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'gender' With 'female' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06800
    [Documentation]         Verify search (Merchant) when gender don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'gender' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06801
    [Documentation]         Verify search (Merchant) when fill in data truly exist in gender
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'gender' With '${NULL}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06802
    [Documentation]         Verify search (Merchant) when fill in data truly exist in tmnStatus
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'tmnStatus' With 'APPROVE' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06803
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in tmnStatus
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'tmnStatus' With 'APPR' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06804
    [Documentation]         Verify search (Merchant) when tmnStatus don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'tmnStatus' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06805
    [Documentation]         Verify search (Merchant) when fill in tmnStatus dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'tmnStatus' With 'ww44ดด' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06806
    [Documentation]         Verify search (Merchant) when fill in data truly exist in trueyouStatus
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'trueyouStatus' With 'APPROVE' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06807
    [Documentation]         Verify search (Merchant) when fill in partially data truly exist in trueyouStatus
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'trueyouStatus' With 'APPR' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06808
    [Documentation]         Verify search (Merchant) when trueyouStatus don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'trueyouStatus' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06809
    [Documentation]         Verify search (Merchant) when fill in trueyouStatus dosen't truly exist data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'trueyouStatus' With 'ww44ดด' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Be Empty
    And Response Field 'totalPages' Should Be Equal '0'
    And Response Field 'totalElements' Should Be Equal '0'

TC_O2O_06810
    [Documentation]         Verify search (Merchant) when fill in data truly exist in tmnApproveDateStart
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'tmnApproveDateStart' With '2018-10-26T15:56:16' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06811
    [Documentation]         Verify search (Merchant) when tmnApproveDateStart don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'tmnApproveDateStart' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06812
    [Documentation]         Verify search (Merchant) when fill in data truly exist in tmnApproveDateEnd
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'tmnApproveDateEnd' With '2018-10-26T15:56:16' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06813
    [Documentation]         Verify search (Merchant) when tmnApproveDateEnd don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'tmnApproveDateEnd' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06814
    [Documentation]         Verify search (Merchant) when fill in data truly exist in (tmnApproveDateStart,tmnApproveDateEnd)
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'tmnApproveDateStart' With '2018-10-26T15:56:16' For Search Merchant
    And Add Query String 'tmnApproveDateEnd' With '2018-10-26T15:56:16' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06815
    [Documentation]         Verify search (Merchant) when fill in data truly exist in trueyouApproveDateStart
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'trueyouApproveDateStart' With '2018-10-26T15:56:16' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06816
    [Documentation]         Verify search (Merchant) when trueyouApproveDateStart don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'trueyouApproveDateStart' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06817
    [Documentation]         Verify search (Merchant) when fill in data truly exist in trueyouApproveDateEnd
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'trueyouApproveDateEnd' With '2018-10-26T15:56:16' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06818
    [Documentation]         Verify search (Merchant) when trueyouApproveDateEnd don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'trueyouApproveDateEnd' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06819
    [Documentation]         Verify search (Merchant) when fill in data truly exist in (trueyouApproveDateStart,trueyouApproveDateEnd)
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'trueyouApproveDateStart' With '2018-10-26T15:56:16' For Search Merchant
    And Add Query String 'trueyouApproveDateEnd' With '2018-10-26T15:56:16' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06820
    [Documentation]         Verify search (Merchant) when fill in data truly exist in approveDateStart
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'approveDateStart' With '2018-10-26T15:56:16' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06821
    [Documentation]         Verify search (Merchant) when approveDateStart don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'approveDateStart' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06822
    [Documentation]         Verify search (Merchant) when fill in data truly exist in approveDateEnd
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'approveDateEnd' With '2018-10-26T15:56:16' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06823
    [Documentation]         Verify search (Merchant) when approveDateEnd don't fill in data
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'approveDateEnd' With '${EMPTY}' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

TC_O2O_06824
    [Documentation]         Verify search (Merchant) when fill in data truly exist in (approveDateStart,approveDateEnd)
    [Tags]    Regression      Medium      Hercules
    Given Create Search String For Search Merchant
    And Add Query String 'approveDateStart' With '2018-10-26T15:56:16' For Search Merchant
    And Add Query String 'approveDateEnd' With '2018-10-26T15:56:16' For Search Merchant
    When Call Search Merchant API
    Then Http Response Should Be '200'
    And Response Field 'content' Should Not Be Empty
    And Response Field 'totalPages' Should Not Be Equal '0'
    And Response Field 'totalElements' Should Not Be Equal '0'

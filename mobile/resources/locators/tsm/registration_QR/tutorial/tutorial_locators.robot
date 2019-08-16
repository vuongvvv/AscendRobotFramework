*** Variables ***
${tutorial}              &{tutorial_${OS}}

&{tutorial_ios}     tutorail_page=xpath=//XCUIElementTypeButton[@name="สมัครฟรี ไม่มีค่าธรรมเนียม"]
...     txt_tutorial_title=id=tutorialPageTitleTextView
...     txt_tutorial_description=id=tutorialPageDescriptionTextView
...     btn_registration=xpath=//XCUIElementTypeButton[@name="สมัครฟรี ไม่มีค่าธรรมเนียม"]
...     btn_activation_code=xpath=//XCUIElementTypeButton[@name="เปิดใช้งานครั้งแรก"]
...     btn_check_merchant_status=xpath=//XCUIElementTypeButton[@name="ตรวจสอบสถานะ"]

&{tutorial_android}     tutorail_page=id=tutorialViewPager
...     txt_tutorial_title=id=tutorialPageTitleTextView
...     txt_tutorial_description=id=tutorialPageDescriptionTextView
...     btn_registration=id=tutorialRegisterButton
...     btn_activation_code=id=tutorialNegativeButton
...     btn_check_merchant_status=id=tutorialPositiveButton

&{tutorial_menu}     lbl_merchant_registration=สมัครฟรี ไม่มีค่าธรรมเนียม
...     lbl_activation_code=เปิดใช้งานครั้งแรก
...     lbl_check_merchant_status=ตรวจสอบสถานะ

&{tutorial_promotion_page}     lbl_promotion=ช่วยทำโปรโมชั่น
...     lbl_description_promotion=เรียกลูกคาเพิ่มยอดขาย ดวยฟงกชั่น สงเสริมการขายครบวงจร
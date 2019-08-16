*** Variables ***
${dashboard_snapshot}              &{dashboard_snapshot_${OS}}
${total_today_sale}                &{total_today_sale_${OS}}
${total_yesterday_sale}            &{total_yesterday_sale_${OS}}
${total_revenue}                   &{total_revenue_${OS}}

&{dashboard_snapshot_text}       lbl_title=รายงานของฉัน
...     lbl_summary=สรุป
...     lbl_transaction_statement=รายการ
...     lbl_unit=บาท

&{dashboard_snapshot_android}       tab_summary=android=new UiSelector().className("android.view.View").resourceId("mat-tab-label-0-0")
...     tab_transaction_statement=android=new UiSelector().className("android.view.View").resourceId("mat-tab-label-0-1")

&{total_today_sale_text}    lbl_today_sale=ยอดขายรวมวันนี้
...     lbl_update=อัพเดทเมื่อ

&{total_today_sale_android}     lbl_total_sales_today=android=new UiSelector().className("android.view.View").resourceId("labelTotalSalesToday")
...     btn_total_sale_information=android=new UiSelector().className("android.view.View").resourceId("btnTotalSaleInformation")
...     lbl_total_today_sales=android=new UiSelector().className("android.view.View").resourceId("labelTotalTodaySales")
...     lbl_total_today_sales_unit=android=new UiSelector().className("android.view.View").resourceId("labelTotalTodaySalesUnit")
...     lbl_update_on=android=new UiSelector().className("android.view.View").resourceId("labelUpdateOn")

&{total_yesterday_sale_text}    lbl_yesterday=เมื่อวาน
...     lbl_total_revenue=รายได้รวม
...     lbl_total_revenue_remark=อัพเดททุกๆวันเวลา 12:00น
...     lbl_total_sale=ยอดขาย
...     lbl_summary_list=ส่วนลดจากทรู
...     lbl_subsidy_remark=ให้ส่วนลดลูกค้าโดยร้านค้าไม่ต้องออกเงินเอง
...     lbl_true_reward=รางวัลจากทรู
...     lbl_true_reward_remark=รับเงินเพิ่มเมื่อลูกค้าจ่ายด้วยทรูมันนี่
...     lbl_truepoint_1=ได้รับ
...     lbl_truepoint_2=ทรูพ้อยท์

&{total_yesterday_sale_android}     lbl_yesterday=android=new UiSelector().className("android.view.View").resourceId("labelYesterday")
...     lbl_total_revenue=android=new UiSelector().className("android.view.View").resourceId("labelTotalRevenue")
...     btn_total_revenue_information=android=new UiSelector().className("android.view.View").resourceId("btnTotalRevenueInformation")
...     lbl_total_revenue_remark=android=new UiSelector().className("android.view.View").resourceId("labelTotalRevenueRemark")
...     lbl_total_sale=android=new UiSelector().className("android.view.View").resourceId("labelTotalSale")
...     btn_total_sale_information_on_total_sale=android=new UiSelector().className("android.view.View").resourceId("btnTotalSaleInformationOnTotalSale")
...     lbl_yesterday_sales_unit=android=new UiSelector().className("android.view.View").resourceId("labelYesterdaySalesUnit")
...     lbl_summary_list=android=new UiSelector().className("android.view.View").resourceId("labelSummaryList")
...     icon_info_gray=android=new UiSelector().className("android.view.View").resourceId("iconInfoGray")
...     lbl_value_summary_list_unit=android=new UiSelector().className("android.view.View").resourceId("labelValueSummaryListUnit")
...     lbl_subsidy_remark=android=new UiSelector().className("android.view.View").resourceId("labelSubsidyRemark")
...     lbl_true_reward=android=new UiSelector().className("android.view.View").resourceId("labelTrueReward")
...     btn_true_reward_information=android=new UiSelector().className("android.view.View").resourceId("btnTrueRewardInformation")
...     lbl_reward_yesterday_unit=android=new UiSelector().className("android.view.View").resourceId("labelRewardYesterdayUnit")
...     lbl_true_reward_remark=android=new UiSelector().className("android.view.View").resourceId("labelTrueRewardRemark")
...     btn_truepoint_information=xpath=//android.view.View[19]/android.view.View[1]/android.widget.Image

&{total_revenue_text}       lbl_revenue_header=รายได้เดือนนี้
...     lbl_revenue_detail=รายได้รวมเดือนนี้

&{total_revenue_android}     lbl_revenue_header=android=new UiSelector().className("android.view.View").resourceId("labelRevenueHeader")
...     lbl_revenue_detail=android=new UiSelector().className("android.view.View").resourceId("labelRevenueDetail")
*** Variables ***
${transaction_statement}              &{transaction_statement_${OS}}

&{transaction_statement_android}       btn_date_picker=android=new UiSelector().className("android.widget.EditText").resourceId("btnDatePicker")
...     lbl_total_transaction=android=new UiSelector().className("android.view.View").resourceId("labelTotalTransaction")
...     lbl_total_unit=android=new UiSelector().className("android.view.View").resourceId("labelTotalUnit")

&{transaction_statement_text}    lbl_total_unit=รายการ
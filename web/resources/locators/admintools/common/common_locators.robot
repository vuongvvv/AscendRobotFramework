*** Variables ***
${modal}                   css=body.modal-open
${hamberger_menu}    //a[@class="jh-navbar-toggler d-none d-xs-none d-sm-none d-md-block float-left"]
${nav_right_menu}    //div[@id="navbarResponsive"][@class="navbar-collapse"]
#Dynamic locators
${mnu_right_menu_bar}    //*[@id="navbarResponsive"]//span[text()="_DYNAMIC_0"]
${mnu_sub_menu}    //*[@id="navbarResponsive"]//span[text()="_DYNAMIC_0"]//ancestor::li//ul[contains(@class,"dropdown-menu")]//span[contains(text(),"_DYNAMIC_1")]
${lbl_column_name}    //div[@class="table-responsive"]//span[text()="_DYNAMIC_0"]
${lnk_page_number}    //ngb-pagination//a[contains(text(),"_DYNAMIC_0")]
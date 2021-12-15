*** Settings ***
Library     SeleniumLibrary
Resource    common.robot


*** Variable ***
${login_btn}    dt_login_button
${email_field}  name=email
${password_field}   //*[@type="password"]
${login_oauth_btn}  //*[text()="Log in"]
${acc_info}     //*[@id="dt_core_account-info_acc-info"]
${demo_tab}     //*[@id="dt_core_account-switcher_demo-tab"]
${switch_virtual}   //*[@id="dt_VRTC4795342"]


*** Keyword ***


*** Test Cases ***
Open Deriv
    Login   ${my_email}     ${my_pw}
    AccountSettings
    TokenMenu
    CheckBox
    TokenName
    CopyToken
    DeleteToken
    DisableCreateButton
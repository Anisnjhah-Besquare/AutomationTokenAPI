*** Settings ***
Library     SeleniumLibrary

*** Keyword ***
Login
    [arguments]     ${email}    ${pw}
    Open Browser    url=https://app.deriv.com   browser=chrome
    maximize browser window
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element    ${login_btn}    60
    Click Element   ${login_btn}
    wait until page contains element    ${email_field}   15
    input text  ${email_field}   ${email}
    input text  ${password_field}   ${pw}
    Click Element   ${login_oauth_btn}


AccountSettings
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   //*[@id="dt_core_header_acc-info-container"]
    click element   //*[@id="dt_core_header_acc-info-container"]/div[2]/div/div

#TestCase1 and TestCase2
TokenMenu
    sleep   3
    wait until page contains element    //*[@id="/account/api-token"]
    click element  //*[@id="/account/api-token"]


CheckBox
#Verify if user able to select all the checkbox
    sleep   3
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element    //*[@id="app_contents"]
    click element   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
    wait until page contains element    //*[@id="app_contents"]
    click element   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[2]/label/span[1]
    wait until page contains element    //*[@id="app_contents"]
    click element   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[3]/label/span[1]
    wait until page contains element    //*[@id="app_contents"]
    click element   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[4]/label/span[1]
    wait until page contains element    //*[@id="app_contents"]
    click element   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[5]/label/span[1]

TokenName
    sleep   2
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element    //*[@class="dc-input__field"]
#TestCase5 Check user input minimum 2 characters and maximum 32
    input text  //*[@class="dc-input__field"]  t
    sleep   2
    press keys  //*[@class="dc-input__field"]  CTRL+A  DELETE
    input text  //*[@class="dc-input__field"]  abcdefghijklmnoppqrstuvwxyz123456789101123
#TestCase4  Check user able to input any token name correctly
    sleep   2
    press keys  //*[@class="dc-input__field"]  CTRL+A  DELETE
    input text  //*[@class="dc-input__field"]  test
#Test6  Check Create button token
    click element   //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]


CopyToken
#TestCase10 Check if user able to click on copy token button
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element    //*[@class="dc-icon dc-clipboard da-api-token__clipboard"]
    click element   //*[@class="dc-icon dc-clipboard da-api-token__clipboard"]

DeleteToken
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
#Test12    Check user able to click Delete button
    click element   //*[@class="dc-btn dc-btn--secondary dc-btn__small"]
    sleep   3
#Test14    Check 'Yes' or 'No' button
    click element   //*[@class="dc-btn__group"]
    click element   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[1]/td[5]/div/button[2]


DisableCreateButton
#TestCase7  When the user wants to create a token name but does not click on any checkbox scopes, the ‘Create’ button should be disable.
    sleep   2
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element    //*[@class="dc-input__field"]
    input text  //*[@class="dc-input__field"]  test
    click element   //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]
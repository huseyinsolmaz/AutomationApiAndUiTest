*** Settings ***
Documentation     This is basic amazon wish list test
Suite Setup       Open Browser    https://www.amazon.com/    Chrome
Suite Teardown    Close Browser
Library           FakerLibrary  locale=tr_TR
Library           Selenium2Library
Library           String

*** Variables ***
${VALID_USER}     angealhelwey@gmail.com
${VALID_PASSWORD}    12801988

*** Test Cases ***
Amazon login and wish list test
    [Documentation]    As user sign in and Searched a key go to 3. page and 3. product then add to wish list then delete on wish list
    ${current_url}=    Get Location
    Run Keyword if    '${current_url}'=='https://www.amazon.com/'    Log To Console    \nYou are in amazon    console=true
    ...    ELSE    Log to console    ${current_url}
    Mouse Over    id:nav-link-accountList
    Wait Until Element Is visible    xpath://a[@data-nav-ref="nav_signin"]
    Click Element    xpath://a[@data-nav-ref="nav_signin"]
    Input Text    id:ap_email    ${valid_user}
    Input Text    id:ap_password    ${valid_password}
    Click Element    id:signInSubmit
    Input Text    id:twotabsearchtextbox    Samsung
    Click Element    xpath://input[@value="Go"]
    Wait until element contains    xpath://div[@id="s-result-info-bar-content"]//span[@class="a-color-state a-text-bold"]    "Samsung"    timeout=10
    ${search_keyword}=    get text    xpath://div[@id="s-result-info-bar-content"]//span[@class="a-color-state a-text-bold"]
    Log    \n Results for ${search_keyword}    DEBUG    console=true    html=true
    ${page_number}=    get text    class:pagnLink
    Run Keyword if    '${page_number}'=='2'    Click element    class:pagnLink
    ...    ELSE    click element    xpath://span[@pagnLink][2]
    Wait until element contains    class:pagnCur    2
    ${current_page}=    Get text    class:pagnCur
    Log To Console    \nYou are in '${current_page}'
    ${product_name}=    Get text    xpath://li[3]//h2
    Click Element    xpath://li[3]//h2
    Click Element    id:wishListDropDown
    Wait until element is visible    xpath://li[@class="a-dropdown-item"][2]
    Click Element    xpath://li[@class="a-dropdown-item"][2]
    Wait Until element contains    id:WLHUC_continue    Continue shopping
    ${wish_list_name}=    get text    xpath://div[@id="WLHUC_info"]//a
    Run Keyword if    '${wish_list_name}'=='${product_name}'    log to console    \nCorrect Product
    ...    ELSE    log to console    \nWrong Product
    Click Element    id:WLHUC_continue
    Wait until Element is visible    id:nav-link-accountList
    mouse over    id:nav-link-accountList
    Wait until Element Is visible    xpath://div[@id="nav-flyout-wl-items"]//a[2]/span
    Click Element    xpath://div[@id="nav-flyout-wl-items"]//a[2]/span
    Click Element    xpath://input[@name="submit.deleteItem"]
    Wait until Element Contains    xpath://ul[@id="g-items"]//div[@class="a-alert-content"]    Deleted
    ${Alert_message}=    get text    xpath://ul[@id="g-items"]//div[@class="a-alert-content"]
    Log to console    \n${Alert_message}
Logout and Errors log in
    Go to   https://www.amazon.com/
    Mouse Over  id:nav-link-accountList
    Click Element   id:nav-item-signout
    Wait until Page Contains    Sign in
    Log to console      \nSuccess logout
    Input text  id:ap_email     angealhelwey@gmail.com
    Click Element   id:signInSubmit
    Wait until element Contains     id:auth-password-missing-alert  Enter your password
    Clear Element Text  id:ap_email
    Input Text  id:ap_password  12801988
    Click Element   id:signInSubmit
    Wait Until Element Contains     id:auth-email-missing-alert     Enter your email or mobile phone number
    Input Text  id:ap_email     angealhelwey@gmail.com
    Click Element   id:signInSubmit
    Mouse Over    id:nav-link-accountList
    Wait Until Element Contains     xpath://div[@id="nav-al-your-account"]/div      Your Account    timeout=15
    Log to Console      \nSuccess Sign in
    ${searchfakeword}=  FakerLibrary.Color_name
    Log to console      \nSearch key ${searchfakeword}
    Input Text  id:twotabsearchtextbox  ${searchfakeword}
    Click Element   xpath://input[@value="Go"]
    ${searchedkey}=     get text    xpath://span[@id="s-result-count"]/span/span
    ${searchkey}=     Remove String     ${searchedkey}     "
    log to console      ${searchkey}
    Run Keyword if      '${searchkey}'=='${searchfakeword}'      Log to console  Equal search keys
    Click Element   xpath://li[@id="result_0"]//a/img
    Wait Until Element is visible   id:wishListMainButton
    Click Element   id:wishListMainButton
    Wait Until Element is visible   id:WLHUC_continue
    Click Element   id:WLHUC_viewlist
    Wait Until Element is visible   xpath://span[@data-a-class="g-move-button"]
    Click Element   xpath://span[@data-a-class="g-move-button"]
    Wait Until Element is visible   xpath://a[@class="a-dropdown-link"]
    Click Element   xpath://a[@class="a-dropdown-link"]
    Wait until page Contains    Moved
    Wait until Element contains     xpath://span[@class="a-text-ellipsis move-success-response a-nowrap"]   Moved to Wish List



*** Keywords ***

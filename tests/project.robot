*** Settings ***
Documentation           This is basic amazon wish list test
Library                 Selenium2Library
Test Setup              Open Browser    https://www.amazon.com/  Chrome
*** Variables ***

*** Test Cases ***

Amazon login and wish list test
    [Documentation]                                           As user sign in and Searched a key go to 3. page and 3. product then add to wish list then delete on wish list

    ${current_url}=       Get Location
                          Run Keyword if                      '${current_url}'=='https://www.amazon.com/'   Log To Console     \nYou are in amazon   console=true   ELSE    Log to console        ${current_url}
                          Mouse Over                          id:nav-link-accountList
                          Wait Until Element Is visible       xpath://a[@data-nav-ref="nav_signin"]
                          Click Element                       xpath://a[@data-nav-ref="nav_signin"]
                          Input Text                          id:ap_email     angealhelwey@gmail.com
                          Click Element                       id:continue
                          Input Text                          id:ap_password     12801988
                          Click Element                       id:signInSubmit
                          Input Text                          id:twotabsearchtextbox      Samsung
                          Click Element                       xpath://input[@value="Go"]
                          Wait until element contains         xpath://div[@id="s-result-info-bar-content"]//span[@class="a-color-state a-text-bold"]     "Samsung"  timeout=10
    ${search_keyword}=    get text                            xpath://div[@id="s-result-info-bar-content"]//span[@class="a-color-state a-text-bold"]
                          Log                                 \n Results for ${search_keyword}    DEBUG   console=true    html=true
    ${page_number}=       get text                            class:pagnLink
                          Run Keyword if                      '${page_number}'=='2'     Click element   class:pagnLink      ELSE    click element   xpath://span[@pagnLink][2]
                          Wait until element contains         class:pagnCur     2
    ${current_page}=      Get text                            class:pagnCur
                          Log To Console                      \nYou are in '${current_page}'
    ${product_name}=      Get text                            xpath://li[3]//h2
                          Click Element                       xpath://li[3]//h2
                          Click Element                       id:wishListDropDown
                          Wait until element is visible       xpath://li[@class="a-dropdown-item"][2]
                          Click Element                       xpath://li[@class="a-dropdown-item"][2]
                          Wait Until element contains         id:WLHUC_continue     Continue shopping
    ${wish_list_name}=    get text                            xpath://div[@id="WLHUC_info"]//a
                          Run Keyword if                      '${wish_list_name}'=='${product_name}'    log to console  \nCorrect Product     ELSE    log to console  \nWrong Product
                          Click Element                       id:WLHUC_continue
                          mouse over                          id:nav-link-accountList
                          Wait until Element Is visible       xpath://div[@id="nav-flyout-wl-items"]//a[2]
                          Click Element                       xpath://div[@id="nav-flyout-wl-items"]//a[2]
                          Click Element                       xpath://input[@name="submit.deleteItem"]
                          Wait until Element Contains         xpath://ul[@id="g-items"]//div[@class="a-alert-content"]     Deleted
    ${Alert_message}=     get text                            xpath://ul[@id="g-items"]//div[@class="a-alert-content"]
                          Log to console                      \n${Alert_message}




*** Keywords ***
    ${search+keyword}
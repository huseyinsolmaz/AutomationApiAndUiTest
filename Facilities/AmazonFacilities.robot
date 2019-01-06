*** Settings ***
Resource  ../Variables/AmazonVariables.robot
Resource  ../Variables/MainFunctions.robot
Library  Selenium2Library

*** Keywords ***

AmazonCheckMainPage
    ${current_url}=    Get Location
    Run Keyword if    '${current_url}'=='https://www.amazon.com/'    Log To Console    \nYou are in amazon    console=true
    ...    ELSE    Log to console    ${current_url}

AmazonLogin
    Mouse Over    ${accountListNav}
    Wait And Click Element  ${signInLink}
    Wait And Send Text  ${emailInput}  ${VALID_USER}
    Wait And Send Text  ${passwordInput}  ${VALID_PASSWORD}
    Wait And Click Element  ${signInButton}

AmazonSearch
    [arguments]   ${searchKeyword}
    Wait And Send Text  ${searchInput}  ${searchKeyword}
    Input Text    ${searchInput}    ${searchKeyword}
    Wait And Click Element  ${searchButton}
    AmazonCheckSearchKeyword  ${searchKeyword}

AmazonCheckSearchKeyword
    [arguments]   ${searchKeyword}
    Wait until element contains    ${searchKeywordSpan}    "${searchKeyword}"    timeout=10
    ${search_keyword}=    get text    ${searchKeywordSpan}
    Log    \n Results for ${search_keyword}    level=WARN

AmazonGoToPage
    wait for element  ${pagenumber}
    ${page_number}=    get text    ${pageNumber}
    Run Keyword if    '${page_number}'=='2'    Click element    class:pagnLink
    ...    ELSE    click element    xpath://span[@pagnLink][2]
    Wait until element contains    ${currentPageNumber}     2
    ${current_page}=    Get text    ${currentPageNumber}
    Log    \nYou are in '${current_page}'   level=WARN

AmazonChooseProductThree
    ${product_name}=    Get text    ${productNameLink}
    set test variable  ${product_name}
    Wait And Click Element    ${productnamelink}

AmazonAddWishListAndCheckProduct
    Wait And Click Element    ${wishlistdropdown}
    Wait And Click Element  ${wishlistoption}
    Wait For Element  ${wishListProductInfo}
    ${wish_list_name}=    get text    ${wishListProductInfo}
    Run Keyword if    '${wish_list_name}'=='${product_name}'    log to console    \nCorrect Product
    ...    ELSE    log to console    \nWrong Product
    Wait And Click Element    ${continueButton}

AmazonGoToWishList
    Wait For Element    ${accountlistnav}
    Mouse Over    ${accountListNav}
    Wait And Click Element    ${wishListLink}

AmazonDeleteFavProduct
    Wait And Click Element    ${productdeletebutton}
    wait for element    ${alertcontent}
    ${Alert_message}=    get text    ${alertcontent}
    Log to console    \n${Alert_message}

*** Settings ***
Resource          ../Variables/MainFunctions.robot
Resource          ../Variables/TrendyolVariables.robot
Library           Selenium2Library
Library           ../Variables/PythonFunctions.py

*** Keywords ***
ClosePopup
    run keyword and ignore error   Wait And Click Element  ${closeIcon}  timeout=5s
    Wait Until Element Is Not Visible  ${closeIcon}

TrendyolLogin
    OpenLoginPopup
    EnterMailAndPassword
    SubmitLoginButton
    CheckLogin

CheckLogin
    CheckElementText  ${loginIconName}  Hesabım   Login Case is

SubmitLoginButton
    Wait And Click Element  ${loginButton}

EnterMailAndPassword
    Wait For Element  ${emailInput}
    Input Text  ${emailInput}  ${userMail}
    Input Text  ${passwordInput}  ${userPassword}

OpenLoginPopup
    Wait And Click Element  ${loginIcon}

GoToBoutique
    : FOR  ${INDEX}     IN RANGE    1    9
    \    ClickAndCheckImages  ${INDEX}

ClickAndCheckImages
    [Arguments]   ${INDEX}
    Wait And Click Element   ${boutiqueMainPath}${INDEX}
    Wait For Element  ${boutiqueMainImgPath}="${index}"]//img
    ${elementCount}=  Get Element Count  ${boutiqueMainImgPath}]
    : FOR  ${INDEXimg}     IN RANGE    1    ${elementCount}
    \    CheckImageStatus  ${INDEXimg}
    ${elementCountBanner}=  Get Element Count  ${boutiqueMainBannerImgPath}
    CheckBannerImage  ${elementCountBanner}

CheckBannerImage
    [arguments]   ${elementCount}
    : FOR  ${index}     IN RANGE    1    ${elementCount}
    \   ${imagepath}=  Get Element Attribute  ${boutiqueMainBannerImgPath}\[${index}\]//img  src
    \   ${statuscode}=  Image Request  ${imagepath}
    \   Run Keyword If  '${statuscode}'!='200'  Log  Banner Image Path Doesn't Load Properly

CheckImageStatus
    [Arguments]  ${index}
    ${imagepath}=  Get Element Attribute  ${boutiqueMainImgPath}="${index}"]//img  src
    ${title}=  Get Element Attribute  ${boutiqueMainImgPath}="${index}"]//img  title
    ${statuscode}=  Image Request  ${imagepath}
    Run Keyword If  '${statuscode}'!='200'  Log  Image Path Doesn't Load Properly ${title}

GoToRandomBoutiqueAndAddToBasket
    ${randomNumber}=  Generate Random Number  1
    Wait And Click Element  ${boutiqueMainPath}${randomNumber}
    Wait And Click Element  ${boutiqueMainImgPath}="${randomNumber}"]
    ${elementCount}=  Get Element Count   ${productPath}\[${randomNumber}\]
    CheckRandomBoutiqueImage   ${elementCount}
    Wait And Click Element  ${productPath}\[${randomNumber}\]
    Wait For Element  ${addToBasket}
    SelectSize
    Wait And Click Element  ${addToBasket}
    CheckProductAddToBasket

SelectSize
    ${status}  ${value}=  Run Keyword And Ignore Error  Wait For Element  ${sizeDropdown}  timeout=3s
    Run Keyword If  '${status}'=='PASS'   SelectPossibleSize

SelectPossibleSize
    Wait And Click Element  ${sizeDropdown}
    Wait And Click Element  ${sizeSelect}

CheckRandomBoutiqueImage
      [Arguments]   ${elementCount}
      : FOR  ${INDEXimg}     IN RANGE    1    ${elementCount}
        \    ${imagepath}=  Get Element Attribute  ${productPath}[${INDEXimg}]//img  src
        \    ${title}=  Get Element Attribute  ${productPath}[${INDEXimg}]//img  title
        \    ${statuscode}=  Image Request  ${imagepath}
        \    Run Keyword If  '${statuscode}'!='200'  Log  Image Path Doesn't Load Properly ${title}

CheckProductAddToBasket
    Wait And Click Element  ${myBasketOnTop}
    ${status}  ${value}=  Run Keyword And Ignore Error  Wait For Element  ${productOnBasket}
    Run Keyword If  '${status}'=='PASS'   log  Product Added on Basket  level=WARN
    ...  ELSE  fail  Basket is Empty !!!

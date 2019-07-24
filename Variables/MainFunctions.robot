*** Settings ***
Library           Collections
Library           String
Library           Selenium2Library
Resource          ../Variables/Variables.robot
Library           FakerLibrary  locale=en_CA
Library           DateTime

*** Keywords ***
Launch Browser
    [Documentation]    ***Description:***
    ...
    ...    Robot will create Chrome Driver
    ...
    ...     *Note:*
    ...     Envoriment of AWS
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]  ${BROWSER}
    Set Screenshot Directory  ${CURDIR}/../Tests/testresults/${TEST_NAME}
    Create Webdriver  ${BROWSER}    alias=Main  executable_path=D:/a/1/s/node_modules/chromedriver/lib/chromedriver/chromedriver.exe
    Go To      ${trendyolUrl}
    Maximize Browser Window

wait for home page
    [Documentation]    ***Description:***
    ...
    ...    Robot will Wait element on page through 30 second
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${elementName}
    Wait Until Keyword Succeeds    20 sec    1 sec    Page Should Contain Element    ${elementName}
    Log    Homepage is viewed    level=WARN
    Capture Page Screenshot

Wait For Element
    [Documentation]    ***Description:***
    ...
    ...    Robot will Wait element on page through timeout
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${element}    ${timeout}=20 sec    ${interval}=1 sec
    Wait Until Keyword Succeeds    ${timeout}    ${interval}    Page Should Contain Element    ${element}
    Capture Page Screenshot

Wait And Click Element
    [Documentation]    ***Description:***
    ...
    ...    Robot will Wait element on page through timeout if
    ...    When element is exist robot will click
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${element}    ${timeout}=20 sec    ${interval}=1 sec
    Wait For Element    ${element}    ${timeout}    ${interval}
    Click Element    ${element}

Wait And Send Text
    [Documentation]    ***Description:***
    ...
    ...    Robot will Wait element on page through timeout if
    ...    When element is exist robot will Type text
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${element}    ${text}    ${timeout}=20 sec    ${interval}=1 sec
    Wait For Element    ${element}    ${timeout}    ${interval}
    Input Text    ${element}    ${text}

Select IFrame
    [Documentation]    ***Description:***
    ...
    ...    Robot will Select Frame
    ...
    ...     *Note:*
    ...     Use Unselect Frame after the process is finished in the frame
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${element}
    Wait For Element    ${element}
    Select Frame    ${element}

Is Text Found
    [Documentation]    ***Description:***
    ...
    ...    Robot will Check Text contain in page or not
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${text}
    ${status}    ${value}=    Run keyword and ignore error    Page Should Contain Textfield    ${text}
    [Return]    ${status}

Focus Element
    [Documentation]    ***Description:***
    ...
    ...    Robot will Scroll to Element
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${element}
    Set Focus To Element    ${element}

Wait And Focus Element
    [Documentation]    ***Description:***
    ...
    ...    Robot will wait element contain in page after will focus to element
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${element}    ${timeout}=20 sec    ${interval}=1 sec
    Wait For Element    ${element}    ${timeout}    ${interval}
    focus element    ${element}

Create Random Text
    [Documentation]    ***Description:***
    ...
    ...    Robot will Generate Random Text
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    ${randomText}=    Generate Random String    8    [LOWER]
    [Return]  ${randomText}

Create Random Email
    [Documentation]    ***Description:***
    ...
    ...    Robot will Generate Random Email
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    ${randomText}=    Generate Random String    8    [LOWER]
    ${randomText}=    Set Variable    ${randomText}@gmail.com
    [Return]  ${randomText}

When Test Fail Take Screenshot
    [Documentation]    ***Description:***
    ...
    ...    When Test Fail Robot will Take a Screenshot
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    Run Keyword If Test Failed    Capture Page Screenshot
    Run Keyword If Test Failed    Close Browser
    Run Keyword If Test Passed    Close Browser

Scroll To Element
    [Documentation]    ***Description:***
    ...
    ...    Robot will Scroll to Element
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${element}
    Wait For Element    ${element}
    Scroll Element Into View    ${element}

Wait Element And Get Text
    [Documentation]    ***Description:***
    ...
    ...    Robot will wait element contain in page then will Get Element content
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${element}    ${timeout}=20 sec    ${interval}=1 sec
    Wait For Element    ${element}    ${timeout}    ${interval}
    Get Text    ${element}
    [Return]  ${element}

Wait Element And Get Value
    [Documentation]    ***Description:***
    ...
    ...    Robot will wait element contain in page then will Get Element value
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${element}    ${timeout}=20 sec    ${interval}=1 sec
    Wait For Element    ${element}    ${timeout}    ${interval}
    Get Value    ${element}

Generate Random First Name
    [Documentation]    ***Description:***
    ...
    ...    Robot will Genarate Fake First name
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    ${randomFirstName}=    FakerLibrary.first_name
    [Return]    ${randomFirstName}

Generate Random Last Name
    [Documentation]    ***Description:***
    ...
    ...    Robot will Genarate Fake Last name
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    ${randomLastname}=    FakerLibrary.first_name
     [Return]    ${randomLastname}

Generate Random Date
    [Documentation]    ***Description:***
    ...
    ...    Robot will Genarate Fake Date
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    ${randomDate}=    FakerLibrary.date    pattern=%d-%m-%Y
    ${randomDate}=    Remove String    ${randomDate}    -
      [Return]    ${randomDate}

Generate Random Phone
    [Documentation]    ***Description:***
    ...
    ...    Robot will Genarate Fake Phone
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    ${randomPhone}=    FakerLibrary.Phone_number
    [Return]    ${randomPhone}

Generate Mail
    [Documentation]    ***Description:***
    ...
    ...    Robot will Genarate Fake Phone
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    ${randomEmail}=    FakerLibrary.email
    [Return]    ${randomEmail}

Generate Random Text
    [Documentation]    ***Description:***
    ...
    ...    Robot will Genarate Fake Text
    ...
    ...     *Note:*
    ...      ${nb_word} is how many word should be include
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${nb_word}
    ${randomText}=    FakerLibrary.sentence    nb_words=${nb_word}
    Set Test Variable    ${randomText}

Generate Random Number
    [Documentation]    ***Description:***
    ...
    ...    Robot will Genarate Random Number
    ...
    ...     *Note:*
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${digits}
    ${randomNumber}=    Random Number    ${digits}
    [Return]    ${randomNumber}

Delete Attribute By Id
    [Documentation]    ***Description:***
    ...
    ...    Robot will Delete Html Attribute
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${locationId}    ${attribute}
    Execute Javascript    document.getElementById("${locationId}").removeAttribute("${attribute}");


Scroll To Location
    [Documentation]    ***Description:***
    ...
    ...    Scroll with Javascript
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${y}
    Execute Javascript    window.scrollTo(0,${y})

CurrentDate
    [Documentation]    ***Description:***
    ...
    ...    Robot will get current day
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    ${currentDate}=    Get Current Date    result_format=%Y %m %d
    [Return]    ${currentDate}

CreateBirthDateOver18
    [Documentation]    ***Description:***
    ...
    ...    Robot will Generate birthdate over 18
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    ${currentDate}=  CurrentDate
    ${birthDate}=  Subtract Time From Date  ${currentDate}  7570 days
    ${birthDate}=  Remove String  ${birthDate}   00:00:00.000
    ${birthDate}=  Remove String  ${birthDate}   -
    ${birthDate}=    Replace String    ${birthDate}    ${space}    ${empty}
    [Return]    ${birthDate}

Erase Space Characters
    [Documentation]    ***Description:***
    ...
    ...    Robot will Remove string space character
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${element}
    ${element}=    Replace String    ${element}    ${space}    ${empty}
    [Return]    ${element}

Delete Csv
    [Documentation]    ***Description:***
    ...
    ...    Robot will Remove file
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]  ${file}
    Remove File  ${file}


CheckElementText
    [Documentation]    ***Description:***
    ...
    ...    Robot will Check Element Text
    ...    If Text isn't match test case will fall
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]   ${element}  ${expectedText}  ${checkMessage}
    Wait For Element  ${element}  30s
    Sleep  1s
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Text Should Be    ${element}    ${expectedText}
    Run Keyword If    '${status}'=='PASS'    log to console    \n${checkMessage} Success
    ...    ELSE    Fail    \nERROR-${checkMessage}-ERROR
    Capture Page Screenshot

SelectNgSelect
    [Documentation]    ***Description:***
    ...
    ...    Angular Js Dropdown select action
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${location}  ${customerType}
    Wait And Click Element    ${location}
    Sleep    1s
    Wait And Click Element    xpath=//span[contains(text(),'${customerType}')]

ConsoleLog
    [Documentation]    ***Description:***
    ...
    ...    Robot will log on new line
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]   ${text}
    Log To Console  \n${text}


Set Chrome Options
    [Documentation]    ***Description:***
    ...
    ...    Robot will set chrome arguments
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR    ${option}    IN    @{chrome_arguments}
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}

HeadlessChrome
    [Documentation]    ***Description:***
    ...
    ...    Robot will open headless chrome browser
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]   ${URL}   ${alias}=None
    ${chrome_options}=    Set Chrome Options
    ${ws}=    Set Variable    window-size=1920,1200
    ${disableLogging}=    Set Variable    --log-level=3
    Call Method   ${chrome_options}    add_argument    ${ws}
    Call Method   ${chrome_options}    add_argument    ${disableLogging}
    Create Webdriver    Chrome   ${alias}   chrome_options=${chrome_options}
    consolelog  Created WebDriver
    Go To  ${URL}
    Capture Page Screenshot

CreateChrome
    [Documentation]    ***Description:***
    ...
    ...    Robot will open chrome browser
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]   ${URL}   ${alias}=None
    ${chrome_options}=    Set Chrome Options
    ${ws}=    Set Variable    window-size=1920,1200
    ${disableLogging}=    Set Variable    --log-level=3
    Call Method   ${chrome_options}    add_argument    ${ws}
    Call Method   ${chrome_options}    add_argument    ${disableLogging}
    Call Method   ${chrome_options}    set_headless    headless=False
    Create Webdriver    Chrome   ${alias}   chrome_options=${chrome_options}
    consolelog  Created WebDriver
    Go To  ${URL}
    Capture Page Screenshot

DropRow
    [Documentation]    ***Description:***
    ...
    ...    Robot will drop first row on csv
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]    ${Csvpath}
    drop_first_row    ${csvpath}

Get Xpath Count
    [Documentation]    ***Description:***
    ...
    ...    Robot will count page contain how many that element
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]  ${location}
    ${count}=    Get Element Count    ${location}
    ${count}=    Convert To Integer    ${count}
    [Return]   ${count+1}

ViewScreen
    [Documentation]    ***Description:***
    ...
    ...    JS xpath locator
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]  ${location}
    Execute Javascript   function getElementByXpath(path) { return document.evaluate(path, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; }; getElementByXpath('${location}').style.zoom="55%";

Send Mail
    [Documentation]    ***Description:***
    ...
    ...    Robot will Send Mail
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]  ${to}  ${Subject}  ${message}
    Send_Email  ${to}   ${Subject}   ${message}

ScrollEnd
    [Documentation]    ***Description:***
    ...
    ...    Robot will scroll to end with Js
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    Execute Javascript  document.querySelector('.ps').scrollTo(0,2000)

ScrollTop
    [Documentation]    ***Description:***
    ...
    ...    Robot will scroll to Top with Js
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    Execute Javascript  document.querySelector('.ps').scrollTo(0,0)

ScrollVariablesCssSelector
    [Documentation]    ***Description:***
    ...
    ...    Robot will scroll to inside element with js
    ...
    ...     *Note:*
    ...     Working with element id
    ...    ---
    ...    _Author:_ Hüseyin Solmaz \ \ _Creation:_ 2019/04/08
    [Arguments]  ${location}  ${y}
    Execute Javascript  document.querySelector('${location}').scrollTo(0,${y})

Image Request
    [Arguments]  ${path}
    ${statuscode}=  set variable  500
    ${status}  ${value}=  run keyword and ignore error  ${statuscode}=  get image request  ${path}
    [Return]   ${statuscode}

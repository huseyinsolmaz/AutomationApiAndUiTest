*** Settings ***
Suite Setup
Suite Teardown    Close All Browsers
Test Setup        Launch Browser  ${BROWSER}
Test Teardown     When Test Fail Take Screenshot
Resource          ../Variables/MainFunctions.robot
Resource          ../Facilities/TrendyolFacilities.robot
Library           Selenium2Library
Library           Collections
Library           Process
Library           Collections
Library           String
Library           DateTime
Library           ExtendedRequestsLibrary
Library           String
Library           ../Variables/PythonFunctions.py

*** Variables ***
${BROWSER}=   chrome
*** Test Cases ***
TrendyolExample
    ConsoleLog  test
2TrendyolExample
    ConsoleLog  test

1TrendyolExample
    ConsoleLog  test


*** Keywords ***

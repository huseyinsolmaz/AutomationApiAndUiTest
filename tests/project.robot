*** Settings ***
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


*** Keywords ***

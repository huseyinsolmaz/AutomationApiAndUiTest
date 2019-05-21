*** Settings ***
Resource          ../Variables/MainFunctions.robot
Resource          ../Facilities/TrendyolApiFacilities.robot
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

*** Test Cases ***
BookApiTestCases
    BookGetAndPutRequest


*** Keywords ***

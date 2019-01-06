*** Settings ***
Suite Setup
Suite Teardown    Close All Browsers
Test Setup        Launch Browser  chrome
Test Teardown     When Test Fail Take Screenshot
Resource          ../Variables/MainFunctions.robot
Resource          ../Facilities/AmazonFacilities.robot
Library           FakerLibrary  locale=tr_TR
Library           Selenium2Library
Library           String

*** Variables ***

*** Test Cases ***
01.Amazon login and wish list test
    AmazonCheckMainPage
    Amazonlogin
    AmazonSearch  Samsung
    AmazonGoToPage
    AmazonChooseProductThree
    AmazonAddWishListAndCheckProduct
    AmazonGoToWishList
    AmazonDeleteFavProduct


*** Keywords ***

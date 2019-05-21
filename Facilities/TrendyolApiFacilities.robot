*** Settings ***
Resource          ../Variables/MainFunctions.robot
Resource          ../Variables/TrendyolVariables.robot
Library           Selenium2Library
Library           ExtendedRequestsLibrary
Library           ../Variables/PythonFunctions.py


*** Keywords ***
BookGetAndPutRequest
    ListEmptyGetRequest
    TestBookApi
    AddBookAndVerify

TestBookApi
    EmptyAuthor
    EmptyTitle
    EmptyAuthor
    WithIdTest

AddBookAndVerify
    ${resp}=   BookPutRequest   Zeus   Olympos
    Run Keyword If  '${resp.status_code}'=='200'  Log  ${putApiSuccessMessage} - ${resp.status_code} level=WARN
    ...  ELSE  Log   ${putApiFailMessage} - ${resp.status_code}  level=ERROR
    ${resp}=   BookPutRequest   Zeus   Olympos
    Run Keyword If  '${resp.status_code}'=='400'  Log  ${putApiDuplicateSuccessMessage} - ${resp.status_code} level=WARN
    ...  ELSE  Log   ${putApiDuplicateFailMessage} - ${resp.status_code}  level=ERROR
    Run Keyword If  '${resp.json()}[error]'=='${dublicateErrormessage}'  Log  ${putApiDuplicateErrorSuccessMessage} - ${resp.status_code} level=WARN
    ...  ELSE  Log   ${putApiDuplicateErrorFailMessage} - ${resp.status_code}  level=ERROR

WithIdTest
    ${resp}=   BookPutRequest   Zeus   Olympos   id=2
    Run Keyword If  '${resp.status_code}'=='400'  Log  ${idTestSuccessCodeMessage} - ${resp.status_code} level=WARN
    ...  ELSE  Log   ${idTestfailCodeMessage} - ${resp.status_code}  level=ERROR
    Run Keyword If  '${resp.json()}[Error]'=='${idTestSuccessExpectMessage}'  Log  ${idTestSuccessExceptMessage} - \n${resp.json()}[Error] level=WARN
    ...  ELSE  Log   ${idTestfailExceptMessage} - ${resp.json()}[Error]  level=ERROR


EmptyTitle
    ${resp}=  BookPutRequest  Zeus  ${EMPTY}
    Run Keyword If  '${resp.status_code}'=='400'  Log  ${titleTestSuccessCodeMessage} - ${resp.status_code} level=WARN
    ...  ELSE  Log   ${titleTestfailCodeMessage} - ${resp.status_code}  level=ERROR
    Run Keyword If  '${resp.json()}[Error]'=='${titleTestSuccessExpectMessage}'  Log  ${titleTestSuccessExceptMessage} - \n${resp.json()}[Error] level=WARN
    ...  ELSE  Log   ${titleTestfailExceptMessage} - ${resp.json()}[Error]  level=ERROR

EmptyAuthor
    ${resp}=  BookPutRequest  ${EMPTY}  Olympos
    Run Keyword If  '${resp.status_code}'=='400'  Log  ${authorTestSuccessCodeMessage} - ${resp.status_code} level=WARN
    ...  ELSE  Log   ${authorTestfailCodeMessage} - ${resp.status_code}  level=ERROR
    Run Keyword If  '${resp.json()}[Error]'=='${authorTestSuccessExpectMessage}'  Log  ${authorTestSuccessExceptMessage} - \n${resp.json()}[Error] level=WARN
    ...  ELSE  Log   ${authorTestfailExceptMessage} - ${resp.json()}[Error]  level=ERROR

ListEmptyGetRequest
    ${resp}=  GetAllBookList
    Run Keyword If  '${resp.status_code}'=='404'  Log  ${emptyBookTestSuccessCodeMessage} - ${resp.status_code} level=WARN
    ...  ELSE  Log   ${emptyBookTestfailCodeMessage} - ${resp.status_code}  level=ERROR

GetAllBookList
    Create Session  httpbin     ${apiURL}
    ${resp}=     Get Request  httpbin  ${apiPath}
    [Return]   ${resp}

#    Should Be Equal As Strings  ${resp.status_code}  200
#    Should Be True  ${resp.json()}
#    Log  ${resp.json()}  level=INFO

GetSpesificBook
    [Arguments]   ${bookID}
    Create Session  httpbin     ${apiURL}
    ${resp}=     Get Request  httpbin  ${apiPath}${bookID}
    [Return]  ${resp}

#    Should Be Equal As Strings  ${resp.status_code}  200
#    Should Be Equal As Strings  ${resp.json}[id]  ${bookID}
#    Should Be True  ${resp.json()}
#    Log  ID= ${resp.json()}[id]  level=INFO
#    Log  Author= ${resp.json()}[author]  level=INFO
#    Log  Title= ${resp.json()}[title]  level=INFO

BookPutRequest
    [Arguments]  ${author}   ${title}  ${id}=${EMPTY}
    Create Session  httpbin     ${apiURL}
    &{data}=    Create Dictionary   id=${id}  author=${author}  title=${title}
    ${resp}=     Put Request  httpbin  ${apiPath}    json=${data}
    [Return]   ${resp}
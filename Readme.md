#Install

please install python and pip and brew

you have to install robot framework

`pip install robotframework`

then selenium2library

``pip install robotframework-selenium2library``

You should have Requests Library

``pip install robotframework-ExtendedRequestsLibrary``

install chromewebdriver

```brew cask install chromedriver```

for run 

@Chapter 1 

``robot -d results tests/project.robot``

@Chapter 2 

``robot -d results tests/ApiTestCases.robot``

Log and report documents in 'results' folder


note: 
if you want to change browser
You have to add on run in this: 

for chrome : -v browser:chrome   

for Firefox : : -v browser:ff

Example

``robot -d results -v browser:ff tests/project.robot``

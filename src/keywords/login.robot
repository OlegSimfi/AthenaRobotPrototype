*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${DEV-URL}  https://dev-backend.athena-security.com/


*** Keywords ***
Open Chrome
    [Arguments]    ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Maximize Browser Window
#    Set Window Size  1920  1080
    Go To    ${url}


Close Browser Window
    ${Title} =  Get Title
    Log  ${Title}
    Close Browser
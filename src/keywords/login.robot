*** Settings ***
Library  SeleniumLibrary
Variables  ../pages/login-page.py

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
    Close Browser

Assert Login page elements
    Wait Until Element Is Enabled   ${header}
    Wait Until Element Is Enabled   ${login_input}
    Wait Until Element Is Enabled   ${password_input}
    Wait Until Element Is Enabled   ${login_button}  5  "Element is not visible"

User login on the Backend
    [Arguments]  ${user_login}   ${user_passwor}
    Input Text   ${login_input}  ${user_login}
    Input Password  ${password_input}   ${user_passwor}
    Click Button  ${login_button}

User should see alert
    Alert Should Be Present     Unable to log in with provided credentials.


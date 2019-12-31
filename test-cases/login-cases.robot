*** Settings ***
Library  SeleniumLibrary
Resource  ../src/keywords/login.robot
Test Setup  Open Chrome    ${DEV-URL}
Test Teardown  Close Browser Window

*** Test Cases ***
User loging with incorrect login and password
    [Tags]  regression
    Log  "Test"
    Assert Login page elements
    User login on the Backend  incorrect_login    incorrect_password
    User should see alert
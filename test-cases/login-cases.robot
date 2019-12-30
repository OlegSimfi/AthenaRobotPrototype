*** Settings ***
Library  SeleniumLibrary
Resource  ../src/keywords/login.robot
Test Setup  Open Chrome    ${DEV-URL}
Test Teardown  Close Browser Window

*** Test Cases ***
Robot First Test Case
    [Tags]  regression
    Log  "Test"
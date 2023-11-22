*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot

Test Teardown    Close All Browsers


*** Test Cases ***
Validate that login title is shown in the login page while enabling login title in General
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Select Checkbox    id:user_registration_login_title
    Click Element   xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains   Your settings have been saved  10s
    Page Should Contain    Your settings have been saved
    Open Browser In Incognito Mode
#    My Account Page
    Wait Until Page Contains    Login  10s
    Page Should Contain    Login

Validate that login title is not shown in the login page while disabling login title in General
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Unselect Checkbox   id:user_registration_login_title
    Click Element   xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains    Your settings have been saved  10s
    Page Should Contain    Your settings have been saved
    Open Browser In Incognito Mode
#    My Account Page
    Page Should Not Contain    Login
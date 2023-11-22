
*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot

Test Teardown    Close All Browsers

*** Test Cases ***
Validate Hide Field Labels
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Select Checkbox    id:user_registration_login_options_hide_labels
    Click Element    xpath:(//input[@name='save'])[2]
    Wait Until Page Contains   Your settings have been saved  10s
    Page Should Contain    Your settings have been saved
    Open browser in incognito mode
    Maximize Browser Window
    Page Should Not Contain    Username or Email
    Page Should Not Contain Element    xpath:label[for='Password']

Validate disable Hide Field Labels
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Unselect Checkbox    id:user_registration_login_options_hide_labels
    Click Element    xpath:(//input[@name='save'])[2]
    Wait Until Page Contains   Your settings have been saved  10s
    Page Should Contain    Your settings have been saved
    Open browser in incognito mode
    Maximize Browser Window
    Wait Until Page Contains   Username or Email  10s
    Page Should Contain    Username or Email
    Wait Until Page Contains   Password  10s
    Page Should Contain  Password


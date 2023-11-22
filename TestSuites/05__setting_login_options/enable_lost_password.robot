*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot


Test Teardown    Close All Browsers



*** Test Cases ***
Validate that loss password hyperlink is shown in Login Page while enabling loss password from General
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Select Checkbox    id:user_registration_login_options_lost_password
    Click Element   xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains   Your settings have been saved  10s
    Page Should Contain    Your settings have been saved
    Open Browser In Incognito Mode
#    My Account Page
    Page Should Contain    Lost your password?
    Click Element    xpath://a[normalize-space()='Lost your password?']
    Wait Until Page Contains    Lost password  10s
    Page Should Contain    Lost password

Validate that loss password hyperlink is not shown in Login Page while disabling loss password from General
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Unselect Checkbox    id:user_registration_login_options_lost_password
    Click Element   xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains    Your settings have been saved  10s
    Page Should Contain    Your settings have been saved
    Open Browser In Incognito Mode
#    My Account Page
#    Wait Until Page Contains   Lost your password?  10s
    Page Should Not Contain    Lost your password?


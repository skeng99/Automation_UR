*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
Test Teardown    Close All Browsers


*** Test Cases ***
Validate when 'Enable Hide/Show Password' is enabled
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Select Checkbox    id:user_registration_login_option_hide_show_password
    Click Element    xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains   Your settings have been saved  10s
    Page Should Contain    Your settings have been saved
    Open Browser In Incognito Mode
    Set Selenium Implicit Wait    10s
#    My Account Page
    Input Fields    ${wp_username}   password
    Page Should Contain Element    //a[@title='Show password']
    Click Element    //a[@title='Show password']
    

Validate when 'Enable Hide/Show Password' is disabled
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
#    Click Element    xpath://label[normalize-space()='Enable Hide/Show Password']
    Unselect Checkbox    id:user_registration_login_option_hide_show_password
    Click Element    xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains   Your settings have been saved  10s
    Page Should Contain    Your settings have been saved
    Open Browser In Incognito Mode
    Set Selenium Implicit Wait    10s
#    My Account Page
    Input Fields    {${wp_username}  password
    Page Should Not Contain Element    //a[@title='Show password']


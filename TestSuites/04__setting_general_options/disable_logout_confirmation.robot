*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot

Test Teardown    Close All Browsers

*** Test Cases ***
Validate Disable Logout Confirmation
    Login To Wordpress
    Wait Until Page Contains Element    ${user_registration_hover}
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Select Checkbox    id:user_registration_disable_logout_confirmation
    Click Element    xpath:(//input[@name='save'])[2]
    Open Browser     ${url}/my-account   ${browser}    options=add_argument("--incognito")
    Maximize Browser Window
    Input Text    xpath://input[@name='username']  ${wp_username}
    Input Text    xpath://input[@name='password']  ${wp_password}
    Click Button    xpath://input[@name='login']
    Wait Until Element Is Visible    //span[normalize-space()='User Logout']  10s
    Click Element    //span[normalize-space()='User Logout']


Validate Enable Logout Confirmation
    Login To Wordpress
    Wait Until Page Contains Element    ${user_registration_hover}
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Unselect Checkbox    id:user_registration_disable_logout_confirmation
    Click Element    xpath:(//input[@name='save'])[2]
    Open Browser     ${url}/my-account   ${browser}    options=add_argument("--incognito")
    Maximize Browser Window
    Input Text    xpath://input[@name='username']  ${wp_username}
    Input Text    xpath://input[@name='password']  ${wp_password}
    Click Button    xpath://input[@name='login']
    Wait Until Element Is Visible    //span[normalize-space()='User Logout']  10s
    Click Element    //span[normalize-space()='User Logout']
    Page Should Contain    Are you sure you want to log out?
    Click Element    link:Confirm and log out
    Page Should Contain    My Account
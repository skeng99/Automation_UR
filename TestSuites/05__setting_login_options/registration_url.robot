*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/common_keywords.robot
Test Teardown    Close All Browsers


*** Test Cases ***
Validate whether 'Not a member yet? Register now.' is displayed or not
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Input Text    id:user_registration_general_setting_registration_url_options   ${url}/registration/
    Click Element    xpath:(//input[@name='save'])[2]
    Wait Until Page Contains   Your settings have been saved  10s
    Page Should Contain    Your settings have been saved
    Open Browser     ${url}/my-account/   ${browser}  options=add_argument("--incognito")
    Maximize Browser Window
    Wait Until Page Contains    Not a member yet? Register now.  10s
    Page Should Contain    Not a member yet? Register now.
    Click Element    //a[starts-with(text(),' Not a member yet? Register now.')]
    ${current_url}=    Get Location
    Should Be Equal    ${url}/registration/  ${current_url}

Validate whether 'Not a member yet? Register now.' is hidden or not
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Clear Element Text    id:user_registration_general_setting_registration_url_options
#    Input Text    id:user_registration_general_setting_registration_url_options   ${url}/registration/
    Click Element    xpath:(//input[@name='save'])[2]
    Wait Until Page Contains   Your settings have been saved  10s
    Page Should Contain    Your settings have been saved
    Open browser in incognito mode
    Maximize Browser Window
#    Wait Until Page Contains    Not a member yet? Register now.  10s
    Page Should Not Contain    Not a member yet? Register now.








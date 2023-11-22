*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot

Test Teardown    Close All Browsers


*** Test Cases ***
Validate when 'Disable Default WordPress Login Screen' is enabled
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Select Checkbox    id:user_registration_login_options_prevent_core_login
    Select From List By Label    id:user_registration_login_options_login_redirect_url  My Account
    Click Element    xpath:(//input[@name='save'])[2]
    Wait Until Page Contains    Your settings have been saved.  10s
    Page Should Contain    Your settings have been saved.
    Open Browser     ${url}/wp-admin   ${browser}  options=add_argument("--incognito")
    Maximize Browser Window
    ${current_url}=   Get Location
    Log To Console    ${current_url}
    Should Be Equal    ${current_url}  ${url}/my-account/
    Log To Console    Default Wordpress login screen is disabled succesfully!
    Input Text    xpath://input[@name='username']  ${wp_username}
    Input Text    xpath://input[@name='password']  ${wp_password}
    Click Button    xpath://input[@name='login']
    Go To   ${url}/wp-admin
    Wait Until Element Is Visible    ${user_registration_hover}  10s
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Unselect Checkbox        id:user_registration_login_options_prevent_core_login
    Click Element    xpath:(//input[@name='save'])[2]
    Wait Until Page Contains    Your settings have been saved.  10s
    Page Should Contain    Your settings have been saved.
    Close All Browsers




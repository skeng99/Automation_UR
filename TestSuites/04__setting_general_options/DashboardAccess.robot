*** Settings ***
Library     SeleniumLibrary
Variables   ../../PageObjects/locators.py
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot
Resource    ../../Resources/EmailDelivery_keywords.robot

Test Teardown    Close All Browsers

*** Variables ***
${login_url}       ${url}/my-account/
${admin_url}       ${url}/wp-admin/


*** Test Cases ***
Validate when 'Prevent WP Dashboard Access' is not enabled
    Login To Wordpress
    Generate random data
    Wait Until Page Contains Element    ${user_registration_hover}
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    class:select2-selection__choice__remove
    Execute Javascript    window.scrollTo(0,1000)
    Wait Until Element Is Visible    xpath:(//input[@name='save'])[2]
    Click Element    (//input[@name='save'])[2]
    Click Element    (//input[@name='save'])[2]
    Sleep    2
    Add New Form    Dashboard Access
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new
    Register A New User    ${rand_first_name}  ${rand_first_name}@mailinator.com  password  User successfully registered.
    Open Browser    ${login_url}  ${browser}  options=add_argument("--incognito")
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Input Text    xpath://input[@name='username']  ${rand_first_name}
    Input Text    xpath://input[@name='password']  password
    Click Button    xpath://input[@name='login']
    Wait Until Page Contains    My Account
    Go To    ${admin_url}
    ${current_url}=     Get Location
    Log To Console    ${current_url}
    Should Be Equal    ${current_url}   ${admin_url}


Validate when 'Prevent WP Dashboard Access' is enabled
    Login To Wordpress
    Generate random data
    Mouse Over  ${user_registration_hover}
    Wait Until Page Contains Element    ${user_registration_hover}
    Click Element    link:Settings
    Sleep    2
    Select From List By Value    id:user_registration_general_setting_disabled_user_roles  subscriber
#    Click Element    class:select2-selection__choice__remove
    Execute Javascript    window.scrollTo(0,500)
    Click Element    xpath:(//input[@name='save'])[2]
    Add New Form    Dashboard Access
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new
    Register A New User    ${rand_first_name}  ${rand_first_name}@mailinator.com  password  User successfully registered.
    Open Browser    ${login_url}  ${browser}  options=add_argument("--incognito")
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Input Text    xpath://input[@name='username']  ${rand_first_name}
    Input Text    xpath://input[@name='password']  password
    Click Button    xpath://input[@name='login']
    Go To    ${admin_url}
    ${current_url}=     Get Location
    Should Be Equal    ${current_url}   ${login_url}

*** Keywords ***
Generate random data
    ${rand_first_name} =  FakerLibrary.first_name
	Set Test Variable    ${rand_first_name}






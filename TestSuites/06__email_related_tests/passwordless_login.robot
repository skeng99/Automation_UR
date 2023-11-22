*** Settings ***
Library     SeleniumLibrary
#Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot
Resource    ../../Resources/EmailDelivery_keywords.robot
Library    ../../Resources/RandomDataGenerator.py
Test Teardown    Close All Browsers

*** Test Cases ***
Validate passwordless login
	#	**Generate random first name using faker library**
	${user_name}=  Generate Random First Name
	${lowercase_name}=  Evaluate    "${user_name}".lower()
	Login To Wordpress
	Goto user setting login option and enable passwordless login
#    Click Element    ${settings_emails}
    Click Element    (//input[@name='save'])[2]
    Wait Until Page Contains    Your settings have been saved.
    Add New Form    Passwordless login
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element    ${preview_form_btn}
    Switch Window    new
    Register A New User  ${user_name}  ${user_name}@mailinator.com  password  User successfully registered.
    Open Browser    ${url}/my-account  ${browser}  options=add_argument("--incognito")
    Maximize Browser Window
    Click Element    link:Passwordless Login
    My account page with passwordless login>>   ${user_name}@mailinator.com
    Wait Until Page Contains    A secure login link has been sent to your email address, it will expire in 1 hour.
    Email Verification Using Mailinator   ${user_name}
    Wait Until Element Is Visible   //td[normalize-space()='Login at My Blog']
    Click Element    //td[normalize-space()='Login at My Blog']
    Verify Email Content  Login at My Blog
    Select Frame    id:html_msg_body
#    Verify Email Content  Login at My Blog
    Click Link    //a
    Switch Window  new
    Wait Until Page Contains    Welcome,
    Page Should Contain    Welcome,


*** Keywords ***
Goto user setting login option and enable passwordless login
	Click Element    id=toplevel_page_user-registration
    Click Element    xpath://a[@href='admin.php?page=user-registration-settings']
    Click Element    xpath://a[normalize-space()='General Options']
    Click Element    link:Login Options
    Select Checkbox    id:user_registration_pro_passwordless_login

My account page with passwordless login>>
    [Arguments]    ${first_name}
    Input Text    id:username   ${first_name}
    Click Button    xpath://input[@name='login']

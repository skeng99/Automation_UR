*** Settings ***
Library     SeleniumLibrary
#Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot
Resource    ../../Resources/EmailDelivery_keywords.robot
Library    ../../Resources/RandomDataGenerator.py
Test Teardown    Close All Browsers

*** Test Cases ***
Validate email sent to admin after user's account deletion
	#	**Generate random first name using faker library**
	${user_name}=  Generate Random First Name
	${lowercase_name}=  Evaluate    "${user_name}".lower()
	Login To Wordpress
	Goto User Setting General Option
    Select Option >>    direct_delete
    Click Element    ${settings_emails}
    Click Element    link:Delete Account Admin Email
    Input Text    id:user_registration_pro_delete_account_email_receipents  themegrill123@mailinator.com  True
    Click Element    (//input[@name='save'])[2]
    Wait Until Page Contains    Your settings have been saved.
    Add New Form    Delete Account2
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element    ${preview_form_btn}
    Switch Window    new
    Register A New User  ${user_name}  ${user_name}@mailinator.com  password  User successfully registered.
    Open Browser    ${url}/my-account  ${browser}  options=add_argument("--incognito")
    Maximize Browser Window
    Login To My Account Page    ${user_name}  password
    Delete Account Without Password
    Login To My Account Page    ${user_name}  password
    Verify Error Message Is Displayed Or Not    ${lowercase_name}
    Email Verification Using Mailinator   themegrill123
    Wait Until Element Is Visible   ${admin_delete_account_email}
    Click Element    ${admin_delete_account_email}
    Verify Email Content  ${lowercase_name} has just deleted their My Blog account.


Validate Delete Account>>Direct Delete and also verify user email
	#	**Generate random first name using faker library**
	${user_name}=  Generate Random First Name
	${lowercase_name}=  Evaluate    "${user_name}".lower()
	Login To Wordpress
	Goto User Setting General Option
    Select Option >>    direct_delete
    Add New Form    Delete Account1
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element    ${preview_form_btn}
    Switch Window    new
    Register A New User  ${user_name}  ${user_name}@mailinator.com  password  User successfully registered.
    Open Browser    ${url}/my-account  ${browser}  options=add_argument("--incognito")
    Maximize Browser Window
    Login To My Account Page    ${user_name}  password
    Delete Account Without Password
    Login To My Account Page    ${user_name}  password
    Verify Error Message Is Displayed Or Not    ${lowercase_name}
    Email Verification Using Mailinator   ${user_name}
    Wait Until Element Is Visible   ${user_delete_account_email}
    Click Element    ${user_delete_account_email}
    Verify Email Content  Your account has been deleted


Validate Delete Account>> Prompt password popup before delete account and also verify user email
	#	**Generate random first name using faker library**
	${user_name}=  Generate Random First Name
	${lowercase_name}=  Evaluate    "${user_name}".lower()
	Login To Wordpress
	Goto User Setting General Option
    Select Option >>    prompt_password
    Add New Form    Delete Account2
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element    ${preview_form_btn}
    Switch Window    new
    Register A New User  ${user_name}  ${user_name}@mailinator.com  password  User successfully registered.
    Open Browser    ${url}/my-account  ${browser}  options=add_argument("--incognito")
    Maximize Browser Window
    Login To My Account Page    ${user_name}  password
    Delete Account With Password  password
    Login To My Account Page    ${user_name}  password
    Verify Error Message Is Displayed Or Not    ${lowercase_name}
    Email Verification Using Mailinator   ${user_name}
    Wait Until Element Is Visible   ${user_delete_account_email}
    Click Element    ${user_delete_account_email}
    Verify Email Content  Your account has been deleted




*** Variables ***
${user_delete_account_email}  //td[contains(text(),'Your account has been deleted')]
${admin_delete_account_email}  //td[contains(text(),'My Blog Account deleted')]
${settings_emails}  //p[normalize-space()='Emails']


*** Keywords ***
Goto user setting general option
	Click Element    id=toplevel_page_user-registration
    Click Element    xpath://a[@href='admin.php?page=user-registration-settings']
    Click Element    xpath://a[normalize-space()='General Options']

Select option >>
	[Arguments]    ${option}
	Scroll Element Into View    //label[normalize-space()='Delete Account Action']
    Select From List By Value    id:user_registration_pro_general_setting_delete_account  ${option}
    Click Element    xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains   Your settings have been saved  10s

Verify error message is displayed or not
	[Arguments]    ${lowercase_name}
	Wait Until Page Contains    Error: The username ${lowercase_name} is not registered on this site. If you are unsure of your username, try your email address instead.
    Page Should Contain    Error: The username ${lowercase_name} is not registered on this site. If you are unsure of your username, try your email address instead.


Login to my account page
	[Arguments]    ${user_name}  ${user_pass}
	Input Text    id:username  ${user_name}
    Input Text    id:password  ${user_pass}
    Click Button    name:login
#    Wait Until Page Contains    My Account

Delete account without password
	Wait Until Page Contains    My Account
	Click Element    //span[normalize-space()='Delete Account']
    Wait Until Page Contains    Are you sure you want to delete your account?
#    Input Text    id:password  password
    Click Element    //button[normalize-space()='Delete Account']
    Wait Until Page Contains    Account successfully deleted!
    Page Should Contain    Account successfully deleted!
    Wait Until Page Contains Element    //label[@for='username']  10s

Delete account with password
	[Arguments]    ${user_pass}
    Wait Until Page Contains    My Account
    Click Element    //span[normalize-space()='Delete Account']
    Wait Until Page Contains    Are you sure you want to delete your account?
    Input Text    id:password  password
    Click Element    //button[normalize-space()='Delete Account']
    Wait Until Page Contains    Account successfully deleted!
    Page Should Contain    Account successfully deleted!
    Wait Until Page Contains Element    //label[@for='username']  10s


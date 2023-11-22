*** Settings ***
Library     SeleniumLibrary
#Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot
Resource    ../../Resources/EmailDelivery_keywords.robot
Library    ../../Resources/RandomDataGenerator.py
Test Teardown    Close All Browsers

*** Variables ***

*** Test Cases ***
Validate Admin Email and Successfully Registered Email
	#	**Generate random first name using faker library**
    ${user_name}=  Generate Random First Name

#    ** Login to Wordpress with username and password from Resource>>credentials.py file
    Login To Wordpress

    Add New Form    Email test1
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new
    Register A New User  ${user_name}  ${user_name}@mailinator.com  password  User successfully registered.
    Email Verification Using Mailinator   themegrill123
    Wait Until Element Is Visible   //td[contains(text(),'A New User Registered')]
    Click Element    //td[contains(text(),'A New User Registered')]
    Verify Email Content  A New User Registered
    Email Verification Using Mailinator    ${username}
    Wait Until Element Is Visible   //td[contains(text(),'Congratulations! Registration Complete on My Blog')]
    Click Element    //td[contains(text(),'Congratulations! Registration Complete on My Blog')]
    Verify Email Content  Congratulations! Registration Complete on My Blog
    Close Browser



Validate Registration Pending Email, Awaiting Admin Approval Email and Registration Approved Email
	#	**Generate random first name using faker library**
    ${user_name}=  Generate Random First Name
    Login To Wordpress
    Add New Form    Email test3
    Click Element    link:Form Settings
    Select From List By Value    id:user_registration_form_setting_login_options  admin_approval
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window    new
    Register A New User  ${user_name}  ${user_name}@mailinator.com  password  User registered. Wait until admin approves your registration.
    Email Verification Using Mailinator    ${user_name}
    Wait Until Element Is Visible   //td[contains(text(),'Sorry! Registration changed to pending on My Blog')]
    Wait Until Element Is Visible    //td[contains(text(),'Thank you for registration on My Blog')]
    Click Element    //td[contains(text(),'Sorry! Registration changed to pending on My Blog')]
    Verify Email Content  Sorry! Registration changed to pending on My Blog

    Go Back
    Click Element    //td[contains(text(),'Thank you for registration on My Blog')]
    Verify Email Content  Thank you for registration on My Blog

    Switch Window   main
    Click Element    xpath://li[@id='menu-users']
    Input Text    id:user-search-input  ${user_name}
    Click Element    id:search-submit
    Mouse Over    xpath://td[@data-colname='Username']
    Click Element    link:Approve
    Switch Window    Mailinator
    Go Back
    Wait Until Element Is Visible   //td[contains(text(),'Congratulations! Registration approved on My Blog')]
    Click Element    //td[contains(text(),'Congratulations! Registration approved on My Blog')]
    Verify Email Content  Congratulations! Registration approved on My Blog

    Switch Window    main
    Click Element    xpath://li[@id='menu-users']
    Input Text    id:user-search-input  ${user_name}
    Click Element    id:search-submit
    Mouse Over    xpath://td[@data-colname='Username']
    Click Element    link:Deny

    Switch Window    Mailinator
    Go Back
    Wait Until Element Is Visible   //td[contains(text(),'Sorry! Registration denied on My Blog')]
    Click Element    //td[contains(text(),'Sorry! Registration denied on My Blog')]
    Verify Email Content  Sorry! Registration denied on My Blog
    Close Browser


Validate Email Confirmation
#	**Generate random first name using faker library**
    ${user_name}=  Generate Random First Name
    Login To Wordpress
    Add New Form    Email test3
    Click Element    link:Form Settings
    Select From List By Value    id:user_registration_form_setting_login_options  email_confirmation
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window   new
    Register A New User  ${user_name}  ${user_name}@mailinator.com  password  User registered. Verify your email by clicking on the link sent to your email.
    Email Verification Using Mailinator    ${user_name}
    Wait Until Element Is Visible   //td[contains(text(),'Please confirm your registration on My Blog')]
    Click Element    //td[contains(text(),'Please confirm your registration on My Blog')]
    Verify Email Content  Please confirm your registration on My Blog
    Close Browser









*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot
Resource    ../../Resources/EmailDelivery_keywords.robot
Library    FakerLibrary
Test Teardown    Close All Browsers

*** Test Cases ***
Validate User Approval and Login Options (Auto Approval and Manual Login)
    Login To Wordpress
    Add New Form    Register
    Click Element   xpath://a[@href='#ur-tab-field-settings']
    Select From List By Value  user_registration_form_setting_login_options    default
    Click Button  name=save_form
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   link:Preview
    switch window   new
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}    FakerLibrary.email
    Register An User    ${first_name}    ${password1}   ${email}
    Wait Until Page Contains    User successfully registered.  10s
    Page Should Contain    User successfully registered.
    Open browser in incognito mode
#    My Account Page
    Login To My Account Page    ${first_name}   ${password1}


Validate User Approval and Login Options (Auto Approval Auto Login)
    Login To Wordpress
    Add New Form    Register
    Click Element   xpath://a[@href='#ur-tab-field-settings']
    Select From List By Value  user_registration_form_setting_login_options    auto_login
    Click Button  name=save_form
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   link:Preview
    Switch Window   new
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}    FakerLibrary.email
    Register An User    ${first_name}    ${password1}   ${email}
    Wait Until Page Contains    My Account
    Page Should Contain    My Account


Validate User Approval and Login Options (Admin approval)
    ${user_name}=  Generate Random First Name
    Login To Wordpress
    Add New Form    Admin Approval
    Click Element    link:Form Settings
    Select From List By Value    id:user_registration_form_setting_login_options  admin_approval
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window    new
    Register A New User  ${user_name}  ${user_name}@mailinator.com  password  User registered. Wait until admin approves your registration.
    Page Should Contain    User registered. Wait until admin approves your registration.
    Switch Window  main
    Click Element    xpath://li[@id='menu-users']
    Input Text    id:user-search-input  ${user_name}
    Click Element    id:search-submit
    Mouse Over    xpath://td[@data-colname='Username']
    Click Element    link:Approve
    Wait Until Page Contains    User Approved: 1 users approved.  10s
    Page Should Contain    User Approved: 1 users approved.
    Open Browser In Incognito Mode
#    My Account Page
    Login To My Account Page    ${user_name}   password
    Wait Until Page Contains    My Account
    Page Should Contain    Welcome,
#    Wait Until Page Contains    User successfully registered.  10s
#    Page Should Contain    User successfully registered.

Validate User Approval and Login Options (Auto Approval after email confirmation)
    Login To Wordpress
    Add New Form    Register
    Click Element   //a[@href='#ur-tab-field-settings']
    Select From List By Value  user_registration_form_setting_login_options    email_confirmation
    Click Button  name=save_form
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   link:Preview
    switch window   new
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@mailinator.com
    Register An User    ${first_name}    ${password1}   ${email}
    Wait Until Page Contains    User registered. Verify your email by clicking on the link sent to your email.  10s
    Page Should Contain    User registered. Verify your email by clicking on the link sent to your email.
    Email verification using mailinator    ${first_name}
    Wait Until Element Is Visible   //td[contains(text(),'Please confirm your registration on My Blog')]
    Wait Until Element Is Visible    //td[contains(text(),'Please confirm your registration on My Blog')]
    Click Element    //td[contains(text(),'Please confirm your registration on My Blog')]
    Wait Until Page Contains    Please confirm your registration on My Blog
    Verify Email Content  Please confirm your registration on My Blog
    Select Frame    id:html_msg_body
    Click Link   //a[normalize-space()='Click here']
    Open browser in incognito mode
    Login To My Account Page    ${first_name}   ${password1}
    Wait Until Page Contains    My Account
    Page Should Contain    My Account


Validate User Approval and Login Options (Automation on Admin approval after email confirmation)
    Login To Wordpress
    Add New Form    Register form
    Click Element   xpath://a[@href='#ur-tab-field-settings']
    Select From List By Value   user_registration_form_setting_login_options    admin_approval_after_email_confirmation
    Click Button  name=save_form
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   link:Preview
    switch window   new
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@mailinator.com
    Register An User    ${first_name}    ${password1}   ${email}
    Wait Until Page Contains    User registered. Verify your email by clicking on the link sent to your email.  10s
    Page Should Contain    User registered. Verify your email by clicking on the link sent to your email.
    Email verification using mailinator    ${first_name}
    Wait Until Element Is Visible   //td[contains(text(),'Please confirm your registration on My Blog')]
    Wait Until Element Is Visible    //td[contains(text(),'Please confirm your registration on My Blog')]
    Click Element    //td[contains(text(),'Please confirm your registration on My Blog')]
    Wait Until Page Contains    Please confirm your registration on My Blog
    Verify Email Content  Please confirm your registration on My Blog
    Select Frame    id:html_msg_body
    Click Link   //a[normalize-space()='Click here']
    Open browser in incognito mode
    Login To My Account Page    ${first_name}   ${password1}
    Wait Until Page Contains    ERROR: Your account is still pending approval.  10s
    Page Should Contain    ERROR: Your account is still pending approval.


















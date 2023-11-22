*** Settings ***
Library     SeleniumLibrary
#Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot
Resource    ../../Resources/EmailDelivery_keywords.robot
Library    ../../Resources/RandomDataGenerator.py
Test Teardown    Close All Browsers

*** Test Cases ***
Validate Auto Generated Password Email
#	**Generate random first name using faker library**
	${user_name}=  Generate Random First Name
	Login To Wordpress
    Add New Form    Email test4
    Goto Form Settings And Activate Auto Generated Password
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element    ${preview_form_btn}
    Switch Window    new
    Register User In Preview Form  ${user_name}  ${user_name}@mailinator.com
    Email Verification Using Mailinator    ${user_name}
    Wait Until Element Is Visible   ${auto_gen_pass_mail}
    Click Element    ${auto_gen_pass_mail}
    Verify Email Content  Your password for logging into My Blog


*** Variables ***
${auto_gen_pass_mail}   //td[contains(text(),'Your password for logging into My Blog')]

*** Keywords ***
Goto form settings and activate auto generated password
    Click Element    link:Form Settings
    Click Element    //div[@id='ur-tab-field-settings']//div[@id='pro-settings']
    Select Checkbox    id:user_registration_pro_auto_password_activate

Register user in preview form
    [Arguments]    ${user_name}  ${user_mail}
    Input Text    id:user_login   ${user_name}
    Input Text    id:user_email   ${user_mail}
    Click Button    xpath://button[@type='submit']
    Wait Until Page Contains    An email with a password to access your account has been sent to your email.
    Page Should Contain   An email with a password to access your account has been sent to your email.
    Drag And Drop By Offset    locator    xoffset    yoffset


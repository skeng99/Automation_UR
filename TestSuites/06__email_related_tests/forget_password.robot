*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot
#Resource    ../Resources/EmailDelivery_keywords.robot

Test Teardown    Close All Browsers

*** Variables ***
${username}     admin
${password}     admin

*** Test Cases ***
Validate Forget Password
    Login To Wordpress
    Click Element    id:toplevel_page_user-registration
    Click Element    id:toplevel_page_user-registration
    Click Element    xpath://a[@href='admin.php?page=user-registration-settings']
    Click Element    xpath://a[normalize-space()='Login Options']
    Select Checkbox    id:user_registration_login_options_lost_password
    Click Element   xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains  Your settings have been saved  10s
    Page Should Contain    Your settings have been saved
    Add New Form    Register
    Click Element    ${update_form_btn}
    Click Element    ${update_form_btn}
    Click Element    ${preview_form_btn}
    switch window   new
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@mailinator.com
    Register An User    ${first_name}    ${password1}   ${email}
    Open Browser In Incognito Mode
    My Account Page
    Click Element    xpath://a[contains(text(),'Lost your password?')]
    Input Text    id:user_login  ${email}
    Click Element    xpath://input[@value='Reset password']
    Wait Until Page Contains    Password reset email has been sent.  10s
    Page Should Contain    Password reset email has been sent.
    Go To    https://www.mailinator.com/
    Input Text    xpath://input[@id='search']    ${email}
    Click Element    xpath://button[normalize-space()='GO']
    Wait Until Element Is Visible    xpath://a[normalize-space()='Public Inboxes']
    Click Element    xpath://a[normalize-space()='Public Inboxes']
    Reload Page
    Wait Until Element Is Visible    xpath://td[normalize-space()='Password Reset Email: My Blog']
    Click Element    xpath://td[normalize-space()='Password Reset Email: My Blog']
    Select Frame    id:html_msg_body
    Wait Until Element Is Visible    xpath://a[normalize-space()='Click Here']
    Click Element    xpath://a[normalize-space()='Click Here']
    switch window   new
    ${new password}     FakerLibrary.Password
    Wait Until Element Is Visible    xpath://h1[normalize-space()='Lost password']
    Change Password Page    ${new password}
    Wait Until Page Contains   Your password has been reset successfully.  10s
    Page Should Contain    Your password has been reset successfully.
    Input Text    id:username   ${email}
    Input Text    id:password   ${new password}
    Click Button    xpath://input[@name='login']
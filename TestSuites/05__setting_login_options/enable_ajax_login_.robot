*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot

Test Teardown    Close All Browsers

*** Test Cases ***
Form Login and edit profile is working properly in Ajax
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Select Checkbox    id:ur_login_ajax_submission
    Click Element    (//input[@value='Save Changes'])[2]
    Wait Until Page Contains    Your settings have been saved.  10s
    Add New Form    Register
    Make single column form
    Sleep    2
    Drag And Drop Field  ${field_firstname}
    Drag And Drop Field  ${field_lastname}
    Drag And Drop Field  ${field_display_name}
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   xpath://a[@href='#ur-tab-field-settings']
    select from list by label   user_registration_form_setting_login_options    Auto approval and manual login
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   link:Preview
    switch window   new
    ${first_name}   FakerLibrary.first_name
    ${password1}     password
    ${email}=       set variable   ${first_name}@getnada.com
    Register An User    ${first_name}    ${password1}   ${email}
    Wait Until Page Contains    User successfully registered.  10s
    Page Should Contain    User successfully registered.
    Open Browser In Incognito Mode
    My Account Page
    Login To My Account Page    ${first_name}   ${password1}
    Wait Until Page Contains    Welcome,
    Go To    ${url}/my-account/edit-profile/
    Generate random data
    Execute Javascript    window.scrollTo(0,500)
    Wait Until Element Is Visible    id:user_registration_first_name  10s
    Input Text    id:user_registration_first_name    ${rand_first_name}
    Input Text    id:user_registration_last_name     ${rand_last_name}
    Input Text    id:user_registration_display_name  ${rand_first_name}
    Click Element   //input[@name='save_account_details']
    Wait Until Page Contains    User profile updated successfully.  10s
    Page Should Contain    User profile updated successfully.

Form Login and edit profile is working properly in Post.
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Unselect Checkbox    id:ur_login_ajax_submission
    Click Element    (//input[@value='Save Changes'])[2]
    Wait Until Page Contains    Your settings have been saved.  10s
    Add New Form    Register
    Make single column form
    Drag And Drop Field  ${field_firstname}
    Drag And Drop Field  ${field_lastname}
    Drag And Drop Field  ${field_display_name}
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   xpath://a[@href='#ur-tab-field-settings']
    select from list by label   user_registration_form_setting_login_options    Auto approval and manual login
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   link:Preview
    switch window   new
    ${first_name}   FakerLibrary.first_name
    ${password1}     password
    ${email}=      set variable     ${first_name}@getnada.com
    Register An User    ${first_name}    ${password1}   ${email}
    Wait Until Page Contains    User successfully registered.  10s
    Page Should Contain    User successfully registered.
    Open Browser In Incognito Mode
    My Account Page
    Login To My Account Page    ${first_name}   ${password1}
    Wait Until Page Contains    Welcome,
    Go To    ${url}/my-account/edit-profile/
    Generate random data
    Execute Javascript    window.scrollTo(0,500)
    Wait Until Element Is Visible    id:user_registration_first_name  10s
    Input Text    id:user_registration_first_name    ${rand_first_name}
    Input Text    id:user_registration_last_name     ${rand_last_name}
    Input Text    id:user_registration_display_name  ${rand_first_name}
    Click Element   //input[@name='save_account_details']
    Wait Until Page Contains    User profile updated successfully.  10s
    Page Should Contain    User profile updated successfully.
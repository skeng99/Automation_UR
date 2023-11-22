*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot

Test Teardown    Close All Browsers


*** Test Cases ***
Login with Email when Username is selected
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Select From List By Label  id:user_registration_general_setting_login_options_with      Username
    Input Text    id:user_registration_message_username_required    Username is Required.
    Click Element    xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains    Your settings have been saved.  10s
    Page Should Contain    Your settings have been saved.
    Add New Form  Register
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new

    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@getnada.com
    Register An User    ${first_name}    ${password1}   ${email}
    Open Browser In Incognito Mode
#    My Account Page
    Login To My Account Page    ${email}   ${password1}
    Wait Until Page Contains    Username is Required.  10s
    Page Should Contain    Username is Required.

Login with Email when Email is selected
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Select From List By Label  id:user_registration_general_setting_login_options_with  Email
    Click Element    xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains    Your settings have been saved.  10s
    Page Should Contain    Your settings have been saved.
    Add New Form  Register
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@getnada.com
    Register An User    ${first_name}    ${password1}   ${email}
    Open Browser In Incognito Mode
    My Account Page
    Login To My Account Page    ${email}   ${password1}


Login with Username when Email is selected
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Select From List By Label  id:user_registration_general_setting_login_options_with  Email
    Clear Element Text    id:user_registration_message_username_required
    Input Text    id:user_registration_message_username_required    Email is Required.
    Click Element    xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains   Your settings have been saved.  10s
    Page Should Contain    Your settings have been saved.
    Add New Form  Register
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@getnada.com
    Register An User    ${first_name}    ${password1}   ${email}
    Open Browser In Incognito Mode
    My Account Page
    Login To My Account Page    ${first_name}   ${password1}
    Wait Until Page Contains    Email is Required.  10s
    Page Should Contain    Email is Required.

Login with Username when Username is selected
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Select From List By Label  id:user_registration_general_setting_login_options_with  Username
    Click Element    xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains    Your settings have been saved.  10s
    Page Should Contain    Your settings have been saved.
    Add New Form  Register
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@getnada.com
    Register An User    ${first_name}    ${password1}   ${email}
    Open Browser In Incognito Mode
    My Account Page
    Login To My Account Page    ${first_name}   ${password1}
#    Sleep    10

Login with Username and email both is selected and login with Username
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Select From List By Label  id:user_registration_general_setting_login_options_with  Username or Email
    Click Element    xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains    Your settings have been saved.  10s
    Page Should Contain    Your settings have been saved.
    Add New Form  Register
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@getnada.com
    Register An User    ${first_name}    ${password1}   ${email}
    Open Browser In Incognito Mode
    My Account Page
    Login To My Account Page    ${first_name}   ${password1}
#    Sleep    10

Login with Username and email both is selected and login with Email
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    link:Login Options
    Select From List By Label  id:user_registration_general_setting_login_options_with  Username or Email
    Click Element    xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains    Your settings have been saved.  10s
    Page Should Contain    Your settings have been saved.
    Add New Form  Register
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new

    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@getnada.com
    Register An User    ${first_name}    ${password1}   ${email}
    Open Browser In Incognito Mode
    My Account Page
    Login To My Account Page    ${email}   ${password1}


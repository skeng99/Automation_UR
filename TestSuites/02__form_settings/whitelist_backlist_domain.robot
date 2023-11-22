*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot

Test Teardown    Close All Browsers

*** Variables ***
${username}     admin
${password}     admin

*** Test Cases ***
 Validate the Working of Blacklist Domain(Denied Domains)
    Login To Wordpress
    Add New Form    Register
    Click Element   xpath://a[@href='#ur-tab-field-settings']
    Click Element    id:pro-settings
    Click Element    xpath://label[normalize-space()='Enable Whitelist/Blacklist Domain']
    Select From List By Label    user_registration_form_setting_whitelist_domain    Denied Domains
    Clear Element Text    id:user_registration_form_setting_domain_restriction_settings
    Input Text    id:user_registration_form_setting_domain_restriction_settings     mailinator.com
    Click Button  name=save_form
   Wait Until Page Contains    Success! Form successfully saved.
    Click Element   link:Preview
    switch window   new
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@mailinator.com
    Register An User    ${first_name}    ${password1}   ${email}
    Wait Until Page Contains    The email domain mailinator.com is restricted. Please try another email address.  10s
    Page Should Contain    The email domain mailinator.com is restricted. Please try another email address.

Validate the Working of Whitelist Domain(Allowed Domains)
    Login To Wordpress
    Add New Form    Register
    Click Element   xpath://a[@href='#ur-tab-field-settings']
    Click Element    id:pro-settings
    Click Element    xpath://label[normalize-space()='Enable Whitelist/Blacklist Domain']
    Select From List By Label    user_registration_form_setting_whitelist_domain    Allowed Domains
    Clear Element Text    id:user_registration_form_setting_domain_restriction_settings
    Input Text    id:user_registration_form_setting_domain_restriction_settings     mailinator.com
    Click Button  name=save_form
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   link:Preview
    switch window   new
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@mailinator.com
    Register An User    ${first_name}    ${password1}   ${email}
    Wait Until Page Contains    User successfully registered.  10s
    Page Should Contain    User successfully registered.

Validate the Working of Blacklist Domain(Denied Domains) with two domains entries
    Login To Wordpress
    Add New Form    Register
    Click Element   xpath://a[@href='#ur-tab-field-settings']
    Click Element    id:pro-settings
    Click Element    xpath://label[normalize-space()='Enable Whitelist/Blacklist Domain']
    Select From List By Label    user_registration_form_setting_whitelist_domain    Denied Domains
    Clear Element Text    id:user_registration_form_setting_domain_restriction_settings
    Input Text    id:user_registration_form_setting_domain_restriction_settings     mailinator.com,getnada.com
    Click Button  name=save_form
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   link:Preview
    switch window   new
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@mailinator.com
    Register An User    ${first_name}    ${password1}   ${email}
    Wait Until Page Contains    The email domain mailinator.com is restricted. Please try another email address.  10s
    Page Should Contain    The email domain mailinator.com is restricted. Please try another email address.
    Reload Page
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@getnada.com
    Register An User    ${first_name}    ${password1}   ${email}
    Wait Until Page Contains    The email domain getnada.com is restricted. Please try another email address.  10s
    Page Should Contain    The email domain getnada.com is restricted. Please try another email address.
    Reload Page
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@gmail.com
    Register An User    ${first_name}    ${password1}   ${email}
    Wait Until Page Contains   User successfully registered.  10s
    Page Should Contain    User successfully registered.

Validate the Working of Whitelist Domain(Allowed Domains) with two domain entries
    Login To Wordpress
    Add New Form    Register
    Click Element   xpath://a[@href='#ur-tab-field-settings']
    Click Element    id:pro-settings
    Click Element    xpath://label[normalize-space()='Enable Whitelist/Blacklist Domain']
    Select From List By Label    user_registration_form_setting_whitelist_domain    Allowed Domains
    Clear Element Text    id:user_registration_form_setting_domain_restriction_settings
    Input Text    id:user_registration_form_setting_domain_restriction_settings     mailinator.com,gmail.com
    Click Button  name=save_form
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   link:Preview
    switch window   new
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@mailinator.com
    Register An User    ${first_name}    ${password1}   ${email}
    Wait Until Page Contains   User successfully registered.  10s
    Page Should Contain    User successfully registered.
    Reload Page
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@gmail.com
    Register An User    ${first_name}    ${password1}   ${email}
    Wait Until Page Contains   User successfully registered.  10s
    Page Should Contain    User successfully registered.
    Reload Page
    ${first_name}   FakerLibrary.first_name
    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@getnada.com
    Register An User    ${first_name}    ${password1}   ${email}
    Wait Until Page Contains    The email domain getnada.com is restricted. Please try another email address.  10s
    Page Should Contain    The email domain getnada.com is restricted. Please try another email address.

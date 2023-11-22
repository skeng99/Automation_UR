*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot
Library    FakerLibrary
Test Teardown    Close All Browsers


*** Test Cases ***
Validate password Strength Very Weak
        Login To Wordpress
        Add New Form    Register
        Click Element   ${form_settings}
        Select Checkbox    ${enable_strong_password}
        Click Element   ${password_strength_very_weak}
        Click Button  ${update_form_btn}
        Wait Until Page Contains    Success! Form successfully saved.
        Click Element   ${preview_form_btn}
        switch window   new
        ${first_name}=   FakerLibrary.first_name
        ${email}=              Set Variable     ${first_name}@getnada.com
        Check Password Strength        ${first_name}    ${veryWeakPassword}   ${email}
        Wait Until Page Contains    Very Weak  10s
        Page Should Contain    Very Weak


Validate password Strength Weak
        Login To Wordpress
        Add New Form    Register
        Click Element   ${form_settings}
        Select Checkbox    ${enable_strong_password}
        Wait Until Page Contains    Weak
        Click Element   ${password_strength_weak}
        Click Button  ${update_form_btn}
        Wait Until Page Contains    Success! Form successfully saved.
        Click Element   ${preview_form_btn}
        switch window   new
        ${first_name}=   FakerLibrary.first_name
        ${email}=       Set Variable     ${first_name}@getnada.com
        Check Password Strength        ${first_name}    ${weakPassword}   ${email}
        Wait Until Page Contains    Weak  10s
        Page Should Contain    Weak

Validate password Strength Medium
        Login To Wordpress
        Add New Form    Register
        Click Element   ${form_settings}
        Select Checkbox    ${enable_strong_password}
        Wait Until Page Contains    Medium
        Click Element   ${password_strength_medium}
        Click Button  ${update_form_btn}
        Wait Until Page Contains    Success! Form successfully saved.
        Click Element   ${preview_form_btn}
        switch window   new
        ${first_name}   FakerLibrary.first_name
        ${email}=              Set Variable     ${first_name}@getnada.com
        Check Password Strength        ${first_name}    ${mediumPassword}   ${email}
        Wait Until Page Contains    Medium  10s
        Page Should Contain    Medium


Validate password Strength Strong
        Login To Wordpress
        Add New Form    Register
        Click Element   ${form_settings}
        Select Checkbox    ${enable_strong_password}
        Wait Until Page Contains    Strong
        Click Element   ${password_strength_strong}
        Click Button  ${update_form_btn}
        Wait Until Page Contains    Success! Form successfully saved.
        Click Element   ${preview_form_btn}
        switch window   new
        ${first_name}   FakerLibrary.first_name
        ${email}=     Set Variable     ${first_name}@getnada.com
        Check Password Strength        ${first_name}    ${strongPassword}   ${email}
        Wait Until Page Contains    Strong  10s
        Page Should Contain    Strong


*** Variables ***
${veryWeakPassword}  a
${weakPassword}     A1ssd
${strongPassword}  A1dddddd@234@
${mediumPassword}   A1ssd@@
${form_settings}  //a[@href='#ur-tab-field-settings']
${enable_strong_password}  //input[@id='user_registration_form_setting_enable_strong_password']
${password_strength_strong}  //form[@id='ur-field-settings']//li[1]
${password_strength_medium}  //form[@id='ur-field-settings']//li[2]
${password_strength_weak}  //form[@id='ur-field-settings']//li[3]
${password_strength_very_weak}  //form[@id='ur-field-settings']//li[4]

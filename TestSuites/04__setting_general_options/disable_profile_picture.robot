*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot

Test Teardown    Close All Browsers

*** Variables ***
#${username}     admin
#${password}     admin

*** Test Cases ***
Validate disable profile picture from general
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Select Checkbox    id:user_registration_disable_profile_picture
    Click Element    xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains    Your settings have been saved  10s
    Page Should Contain    Your settings have been saved
    Add New Form    Register
    Click Button  name=save_form
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   link:Preview
    switch window   new
    ${first_name}   FakerLibrary.first_name
#    ${password1}     FakerLibrary.Password
    ${email}=              Set Variable     ${first_name}@getnada.com
    Register An User    ${first_name}    password   ${email}
    Wait Until Page Contains    User successfully registered.  10s
    Page Should Contain    User successfully registered.
    Open Browser In Incognito Mode
    Set Selenium Implicit Wait    10s
#    My Account Page
    Login To My Account Page    ${first_name}   password
    Page Should Not Contain Element    xpath://img[@alt='profile-picture']

Validate enable profile picture from general
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Unselect Checkbox    id:user_registration_disable_profile_picture
    Click Element    xpath:(//input[@value='Save Changes'])[2]
    Wait Until Page Contains    Your settings have been saved  10s
    Page Should Contain    Your settings have been saved
    Add New Form    Register
    Click Button  name=save_form
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   link:Preview
    switch window   new
    ${first_name}   FakerLibrary.first_name
    ${email}=              Set Variable     ${first_name}@getnada.com
    Register An User    ${first_name}    password   ${email}
    Wait Until Page Contains   User successfully registered.  10s
    Page Should Contain    User successfully registered.
    Open Browser In Incognito Mode
    Set Selenium Implicit Wait    10s
#    My Account Page
    Login To My Account Page    ${first_name}   password
    Wait Until Element Is Visible    xpath://img[@alt='profile-picture']  10s
    Page Should Contain Element    xpath://img[@alt='profile-picture']
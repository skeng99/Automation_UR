*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
Test Teardown    Close All Browsers

*** Test Cases ***
Validate full content restriction
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    xpath://p[normalize-space()='Content Restriction']
    Select Checkbox    id:user_registration_content_restriction_enable
    Click Element    xpath:(//input[@name='save'])[2]
    Go To    ${url}/wp-admin/post.php?post=2&action=edit
    Select Checkbox    id:urcr_meta_checkbox
    Open Browser    ${url}/sample-page  ${browser}  options=add_argument("--incognito")
    Maximize Browser Window
    Page Should Contain    This content is restricted!

Validate diasbaling full content restriction
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    xpath://p[normalize-space()='Content Restriction']
    Unselect Checkbox    id:user_registration_content_restriction_enable
    Click Element    xpath:(//input[@name='save'])[2]
    Open Browser    ${url}/sample-page  ${browser}  options=add_argument("--incognito")
    Maximize Browser Window
    Page Should Not Contain    This content is restricted!
*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
#Resource    ../../Resources/field_keywords.robot
#Resource    ../../Resources/advanced_field_keyword.robot
Test Teardown    Close All Browsers

*** Test Cases ***
Validate add new endpoint
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    xpath://p[normalize-space()='Customize My Account']
    Click Element    xpath://button[normalize-space()='Add New']
    Select From List By Value    class:swal2-select  endpoint
    Click Button    xpath://button[normalize-space()='OK']
    Input Text    class:swal2-input  endpoint
    Click Element    xpath://button[normalize-space()='OK']
    Sleep    1
    Press Keys    None  ESC
    Click Element    xpath:(//input[@name='save'])[2]
    Go To    ${url}/my-account/endpoint
    Page Should Contain    Endpoint

Validate remove endpoint
    Login To Wordpress
    Mouse Over  ${user_registration_hover}
    Click Element    link:Settings
    Click Element    xpath://p[normalize-space()='Customize My Account']
    Click Element    xpath://nav[@class='ur-sidebar-nav-wrapper urcma-endpoint-tabs ui-sortable']//div[@id='endpoint']
    Click Button    xpath://button[normalize-space()='Remove']
    Sleep    1
    Click Button    xpath://button[normalize-space()='OK']
    Sleep    1
#    Press Keys    None  ESC
    Click Element    xpath:(//input[@name='save'])[2]
    Go To    ${url}/my-account/endpoint
    Page Should Contain    404
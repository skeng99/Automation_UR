*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite  name=DragandDrop
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot
Test Teardown    Close All Browsers

#Test Setup    Sleep    1s
#Test Teardown    Close Browser
*** Variables ***
${form name}    new form
${num}  ${1}
${x}  ${1}
${y}  ${1}

*** Test Cases ***
Validate working of Drag and Drop of all Fileds
    [Documentation]  -Login to wordpress
    ...             - Drag and drop the field one by one
    ...             -Verifies whether the fields are in the form or not

    Login To Wordpress
    Add New Form    ${form name}
#    Drag and drop the field one by one
    field_keywords.Drag and Drop Fields one by one
    Log To Console    ${SUITE NAME}
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new

#    Verifies whether the fields are in the form or not
    Verify Field Is In Form Or Not



Validate that Label and Description of Fields are changed
    [Documentation]  -Login to wordpress
    ...             - Opens a form and Changes label and description of fields from Field Options
    ...             -Verifies whether the label and description are changed or not


    Login To Wordpress
    Wait Until Element Is Visible    ${user_registration_hover}
    Mouse Over  ${user_registration_hover}
    Edit Form
#    Click Element    //div[@class='ur-input-type-user-login ur-admin-template']//div[@class='ur-label']
#    Sleep    5
    Change Label And Description Of Fields One By One
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window    new
    Verify Whether Label And Desciption Are Changed Or Not


Validate Working of Hide Label Field Option
#    [Tags]  robot:continue-on-failure
    [Documentation]  -Login to wordpress
    ...             - Opens a form and selects 'yes' in hide label of all fields
    ...             -Verifies whether the label is hidden or not
    Login To Wordpress
    Edit Form
    Hide Label Of All Fields
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window    new
    Verify Whether The Label Is Hidden Or Not






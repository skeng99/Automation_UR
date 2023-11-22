*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot
Resource    ../../Resources/advanced_field_keyword.robot
Test Teardown    Close All Browsers

*** Test Cases ***
Validate working of drag and drop of advanced fields
    Login To Wordpress
    Add New Form    Advanced_field_test
    Drag And Drop Advanced Fields
    Sleep    1
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new
    Verify Advanced Fields Are In Form Or Not

Validate field options> label
    Login To Wordpress
    Wait Until Element Is Visible    ${user_registration_hover}
    Mouse Over  ${user_registration_hover}
    Edit Form
    Change Label Of Advanced Fields
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new
    Verify Whether Label Is Changed Or Not

Validate field options> descriptions
    Login To Wordpress
    Wait Until Element Is Visible    ${user_registration_hover}
    Mouse Over  ${user_registration_hover}
    Edit Form
    Change Description Of Advanced Fields
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new
    Verify Whether Description Is Changed Or Not

Validate field options> hide label
    Login To Wordpress
    Add form    hide_label_test
    Drag And Drop Advanced Fields
    Sleep    1
    Hide Label Of Advanced Fields
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new
    Verify Whether Advanced Field's Label Is Hidden Or Not


Validate field options> required
    Login To Wordpress
    Add New Form    Advanced_field_test
    Drag And Drop Advanced Fields
    Make Advanced Field Required
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new
    Click Button    ${form_submit_button}
    Page Should Contain    This field is required.


Validate profile picture upload
    Login To Wordpress
    Add New Form    Profile picture
    Mouse Over  ${DragAndDrop_target}
    Wait Until Element Is Visible    xpath://button[@class='ur-edit-grid']
    Click Element    xpath://button[@class='ur-edit-grid']
    Wait Until Element Is Visible    xpath://div[@class='ur-toggle-grid-content']//div[1]
    Click Element    xpath://div[@class='ur-toggle-grid-content']//div[1]
    Drag And Drop    ${profile_picture}  ${DragAndDrop_target}
    Sleep    2
    Click Element    id:profile_pic_url_field
    Click Element    //form[@id='ur-setting-form']//h2[@class='ur-toggle-heading'][normalize-space()='General Settings']
    Sleep    2
    Click Element    xpath://form[@id='ur-setting-form']//h2[@class='ur-toggle-heading closed'][normalize-space()='Advanced Settings']
    Sleep    2
    Unselect Checkbox    xpath:(//input[@name='profile_pic_advance_setting[enable_crop_picture]'])[1]
    Sleep    2
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element   ${preview_form_btn}
    Switch Window  new
    Input Text    id:user_login   user10
    Input Text    id:user_email   bishal10@getnada.com
    Input Text    id:user_pass    password
    Input Text    id:user_confirm_password  password
    Choose File   //input[@id='ur-profile-pic']  ${CURDIR}\\pic.jpg
    Sleep    5
    Click Button   ${form_submit_button}
    Wait Until Page Contains    User successfully registered.
    Page Should Contain    User successfully registered.

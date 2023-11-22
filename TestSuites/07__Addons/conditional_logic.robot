*** Settings ***
Library     SeleniumLibrary
Library      AutoRecorder  mode=suite
Resource    ../../Resources/common_keywords.robot
Resource    ../../Resources/field_keywords.robot
Library    FakerLibrary
Test Teardown    Close All Browsers


*** Test Cases ***
Validate working of hide/show field when condition is satisfied
    Login To Wordpress
    Add New Form  Conditional logic test
    Make Single Column Form
    Drag And Drop    ${field_select}  ${DragAndDrop_target}
#    Drag And Drop    ${field_input}  ${DragAndDrop_target}
    Click Element    ${get_select_options}
    Input Text    ${in_select_label}   Marital Status  True
    Drag And Drop By Offset    ${move_down}  0  75
    Wait Until Element Is Visible  ${option_1}
    Input Text    ${option_1}  Married  True
    Wait Until Element Is Visible    ${option_2}
    Input Text    ${option_2}  Single  True
    Click Element    ${remove_option_3}
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element    link:Fields
    Drag And Drop    ${field_input}  ${DragAndDrop_target}
    Click Element     ${input_field_option}
    Input Text    ${fieldOption_label}  Spouse's name  True
    Click Element    ${general_settings}
    Sleep    1
    Click Element    ${conditional_settings}
    Select Checkbox    ${conditional_logic}
    Wait Until Element Is Visible    ${marital_status_field}
    Select From List By Label    ${marital_status_field}  Marital Status
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element    ${preview_form_btn}
    Switch Window    new
    Wait Until Page Contains    Conditional logic test
    Select From List By Value    //select[@data-label='Marital Status']  Married
    Page Should Contain Element    //label[contains(text(),'Spouse’s name')]


Validate working of hide/show field when condition is not satisfied
    Login To Wordpress
    Preview Last Created Form
    Wait Until Page Contains    Conditional logic test
    Select From List By Value    //select[@data-label='Marital Status']  Single
    Page Should Not Contain    //label[contains(text(),'Spouse’s name')]


Validate working of Enable Conditional Redirection>>Custom page
    Login To Wordpress
    ${random_name}=  FakerLibrary.first_name
    ${lowercase_name}=  Evaluate    "${random_name}".lower()
    Add New Form  Conditional Redirection logic test
    Make Single Column Form
    Click Element    link:Form Settings
    Click Button    id:ur-collapse
    Scroll Element Into View     id:user_registration_form_setting_enable_conditional_redirection
    Select Checkbox    id:user_registration_form_setting_enable_conditional_redirection
    Scroll Element Into View  id:urcl_conditional_redirection_action_type
    Select From List By Value    id:urcl_conditional_redirection_action_type  custom_page
    Select From List By Value    id:urcl-redirection-custom-page  2
    Select From List By Value    (//select[@name='user_registration_form_fields[condition_1][1]'])[1]  user_login
    Input Text    (//input[@name='user_registration_form_value[condition_1][1]'])[1]  ${lowercase_name}
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Wait Until Page Contains    Success! Form successfully saved.
    Page Should Contain    Success! Form successfully saved.
    Click Element    ${preview_form_btn}
    Switch Window    new
    Page Should Contain    Conditional Redirection logic test
    Input Text    id:user_login  ${lowercase_name}
    Input Text    id:user_pass  password
    Input Text    id:user_email  ${lowercase_name}@mailinator.com
    Input Text    id:user_confirm_password  password
    Click Element    //button[normalize-space()='Submit']
    Wait Until Page Contains    User successfully registered.  10s
    Wait Until Location Is  ${url}/sample-page/  10s
    ${current_url}=  Get Location
    Log To Console    ${current_url}
    Should Be Equal  ${current_url}  ${url}/sample-page/


Validate working of Enable Conditional Redirection>>External Url
    Login To Wordpress
    ${random_name}=  FakerLibrary.first_name
    ${lowercase_name}=  Evaluate    "${random_name}".lower()
    Add New Form  Conditional Redirection test
    Make Single Column Form
    Click Element    link:Form Settings
    Click Button    id:ur-collapse
    Scroll Element Into View     id:user_registration_form_setting_enable_conditional_redirection
    Select Checkbox    id:user_registration_form_setting_enable_conditional_redirection
    Scroll Element Into View  id:urcl_conditional_redirection_action_type
    Select From List By Value    id:urcl_conditional_redirection_action_type  external_url
    Input Text  id:urcl-redirection-external-url  https://themegrill.com/
    Select From List By Value    xpath:(//select[@name='user_registration_form_fields[condition_1][1]'])[1]  user_login
#    Select From List By Value    xpath://input[@class='urcl-form-settings-field']
    Input Text  xpath://input[@class='urcl-form-settings-field']  ${lowercase_name}
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Wait Until Page Contains    Success! Form successfully saved.
    Page Should Contain    Success! Form successfully saved.
    Click Element    ${preview_form_btn}
    Switch Window    new
    Page Should Contain    Conditional Redirection test
    Input Text    id:user_login  ${lowercase_name}
    Input Text    id:user_pass  password
    Input Text    id:user_email  ${lowercase_name}@mailinator.com
    Input Text    id:user_confirm_password  password
    Click Element    //button[normalize-space()='Submit']
    Wait Until Page Contains    User successfully registered.  10s
    Wait Until Location Is  https://themegrill.com/    10s
    ${current_url}=  Get Location
    Log To Console    ${current_url}
    Should Be Equal  ${current_url}  https://themegrill.com/


#Validate working of Conditional Logic for Submit Button>>Show
#	Login To Wordpress
#    ${random_name}=  FakerLibrary.first_name
#    ${lowercase_name}=  Evaluate    "${random_name}".lower()
#    Add New Form  Conditional Submit button
#    Make Single Column Form
#    Drag And Drop    ${field_firstname}  ${DragAndDrop_target}
#    Drag And Drop    ${field_lastname}   ${DragAndDrop_target}
#    Click Element    ${update_form_btn}
#    Wait Until Page Contains    Success! Form successfully saved.
##    Sleep    2
#    Click Element    link:Form Settings
#    Click Button    id:ur-collapse
#    Scroll Element Into View    id:user_registration_form_setting_enable_submit_conditional_logic
#    Select Checkbox    id:user_registration_form_setting_enable_submit_conditional_logic
#    Scroll Element Into View    //select[@class='urcl-form-settings-field urcl-submit-field urcl-field-conditional-field-select']
#    Wait Until Page Contains Element    //select[@class='urcl-form-settings-field urcl-submit-field urcl-field-conditional-field-select']
#    Select From List By Label    //select[@class='urcl-form-settings-field urcl-submit-field urcl-field-conditional-field-select']  First Name
#    Input Text    //input[@class='urcl-form-settings-field urcl-submit-field']  ${lowercase_name}
#    Click Element    ${update_form_btn}
#    Wait Until Page Contains    Success! Form successfully saved.
#    Page Should Contain    Success! Form successfully saved.
#    Click Element    ${preview_form_btn}
#    Switch Window    new
#    Page Should Contain    Conditional Submit button
#    Input Text    id:user_login  ${lowercase_name}
#    Input Text    id:user_pass  password
#    Input Text    id:user_email  ${lowercase_name}@mailinator.com
#    Input Text    id:user_confirm_password  password
#    Input Text    id:first_name_field  ${lowercase_name}
#    Wait Until Page Contains Element    //button[normalize-space()='Submit']
#    Page Should Contain Button    //button[normalize-space()='Submit']
#    Input Text    id:user_login  ${lowercase_name}
#    Input Text    id:user_pass  password
#    Input Text    id:user_email  ${lowercase_name}@mailinator.com
#    Input Text    id:user_confirm_password  password
#    Input Text    id:first_name_field  random_name
#    Page Should Not Contain Button    //button[normalize-space()='Submit']

#	id:user_registration_form_setting_enable_submit_conditional_logic


#	(//input[@id='user_registration_form_setting_enable_assign_user_role_conditionally'])[1]


#


*** Variables ***
${get_select_options}   //label[contains(text(),'Select')]
${grid}   xpath://button[@class='ur-edit-grid']
${single_column}  xpath://div[@class='ur-toggle-grid-content']//div[1]
${field_input}   xpath://li[@id='user_registration_text_list ']
${in_select_label}  //form[@id='ur-setting-form']//input[@placeholder='Label']
${input_field_option}  //label[normalize-space()='Input Field']
${move_down}   //div[@class='ps__thumb-y']
${option_1}  (//input[@name='ur_general_setting[options]_label'])[1]
${option_2}  (//input[@name='ur_general_setting[options]_label'])[2]
${remove_option_3}  (//a[@class='remove'])[3]
${form_field_input}  //div[@class='ur-input-type-text ur-admin-template']
${general_settings}  //h2[contains(text(),'General Settings')]
${conditional_settings}  //h2[contains(.,'Conditional Settings')]
${conditional_logic}  //input[@data-advance-field='enable_conditional_logic']
${marital_status_field}    //select[@class='urcl-conditional-logic__rule__param urcl-triggerer-field']
${preview_form_field_marital_status}  //select[@data-label='Marital Status']
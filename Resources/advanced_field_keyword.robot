*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py

*** Variables ***
@{advanced_fields_name}  Username  User Password  Time Picker  Phone  WYSIWYG  Select2
...                      Multi Select2  Profile Picture  Range  User Email  Confirm Password
${num}     ${1}
${count1}  ${1}
${count2}  ${1}
${count3}  ${1}
${count4}  ${1}
${count5}  ${0}
${count6}  ${0}
${count7}  ${0}


*** Keywords ***
Drag and drop advanced fields
#    Change to vertical form
    Mouse Over  ${DragAndDrop_target}
    Wait Until Element Is Visible    xpath://button[@class='ur-edit-grid']
    Click Element    xpath://button[@class='ur-edit-grid']
    Wait Until Element Is Visible    xpath://div[@class='ur-toggle-grid-content']//div[1]
    Click Element    xpath://div[@class='ur-toggle-grid-content']//div[1]
    FOR    ${i}  IN   @{advanced_fields}
        Drag And Drop    ${i}  ${DragAndDrop_target}
        ${field name}=  Get Text    ${i}
        Log To Console    Succesfully dragged and dropped ${field name} field
    END

Verify advanced fields are in form or not
    FOR    ${i}   IN  @{advanced_fields_name}
        Wait Until Page Contains    ${i}
        Page Should Contain  ${i}
        Log To Console    ${i} is in form
    END

Change label of advanced fields
    @{locators_list}=  Get Webelements  ${locators_edit_form}
    FOR   ${locator}   IN   @{locators_list}
        ${name}=  Get Text    ${locator}
        Click Element    ${locator}
        Input Text  ${fieldOption_label}  Label${count1}   True
#        Input Text  ${fieldOption_description}   This is description ${num}
        Log To Console    ${name}
        ${count1}=  Evaluate    ${count1}+${1}
    END
    Click Element    //h3[normalize-space()='Section Title']
    Input Text  ${fieldOption_label}  Label14   True


Verify whether label is changed or not
    @{preview_fields}=  Get Webelements  ${locators_preview_form}
    FOR    ${locator}  IN  @{preview_fields}
         ${name}=  Get Text    ${locator}
         Log To Console    ${name}
#        ${count2}=  Evaluate    ${count2}+${1}
         Page Should Contain    Label${count2}
         ${count2}=  Evaluate    ${count2}+${1}
    END


Change description of advanced fields
    @{locators_list}=  Get Webelements  ${locators_edit_form}
    FOR   ${locator}   IN   @{locators_list}
        ${name}=  Get Text    ${locator}
        Click Element    ${locator}
#        Input Text  ${fieldOption_label}  Label${y}   True
        Input Text  ${fieldOption_description}   This is description${count3}
        ${count3}=  Evaluate    ${count3}+${1}
    END
    Click Element    //h3[normalize-space()='Label14']
    Input Text  ${fieldOption_description}   This is description14

Verify whether description is changed or not
    @{preview_fields}=  Get Webelements  ${locators_preview_form}
    FOR    ${locator}  IN  @{preview_fields}
#        ${count4}=  Evaluate    ${count4}+${1}
        Page Should Contain    This is description${count4}
        ${count4}=  Evaluate    ${count4}+${1}
    END

Hide label of advanced fields
    @{list}=  Get Webelements    ${locators_edit_form}
    FOR   ${locator}   IN   @{list}
        Click Element    ${locator}
        Scroll Element Into View  ur_general_setting[hide_label]
        Select Checkbox    ur_general_setting[hide_label]
#        ${count5}=  Evaluate    ${count5}+${1}
    END

Verify whether advanced field's label is hidden or not
    FOR    ${locator}  IN  @{advanced_fields_name}
        Page Should Not Contain  ${locator}
    END


Make advanced field required
    FOR   ${locator}   IN   @{required_advanced_fields}
        Click Element    ${locator}
        Scroll Element Into View  ur_general_setting[required]
        Select Checkbox    ur_general_setting[required]
    END
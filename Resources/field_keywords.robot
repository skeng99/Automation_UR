*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py

*** Variables ***
@{name of fields}  Username  User Password  Textarea
...                 User Email  First Name  Last Name  Confirm Password
...                 Secondary Email  Display Name  User Bio  Input Field
...                 Password Field  Number  Privacy Policy
${num}  ${1}
${x}  ${1}
${y}  ${1}
${z}  ${1}



*** Keywords ***
Add new form
    [Arguments]    ${form name}
    Set Browser Implicit Wait    2s
    Wait Until Page Contains Element    ${user_registration_hover}
    Mouse Over  ${user_registration_hover}
    Click Element    ${add_new_form}
    Click Element    ${Start_from_scratch}
    Input Text    ${Form_name_textbox}  ${form name}  Clear True
    Click Button    ${continue_btn}
    Sleep    2
    Wait Until Element Is Visible    class:jconfirm-closeIcon
    Click Element    class:jconfirm-closeIcon
#    Click Element    ${update_form_btn}

Add form
    [Arguments]    ${form name}
#    Set Browser Implicit Wait    2s
    Wait Until Page Contains Element    ${user_registration_hover}
    Mouse Over  ${user_registration_hover}
    Click Element    ${add_new_form}
    Click Element    ${Start_from_scratch}
    Input Text    ${Form_name_textbox}  ${form name}  Clear True
    Click Button    ${continue_btn}
    Sleep    2
    Wait Until Element Is Visible    class:jconfirm-closeIcon
    Click Element    class:jconfirm-closeIcon

Make single column form
    Mouse Over    ${DragAndDrop_target}
    Wait Until Element Is Visible    xpath://button[@class='ur-edit-grid']
    Click Element    xpath://button[@class='ur-edit-grid']
    Wait Until Element Is Visible    xpath://div[@class='ur-toggle-grid-content']//div[1]
    Click Element    xpath://div[@class='ur-toggle-grid-content']//div[1]


Drag and Drop Fields one by one
#    Change to vertical form
#    Mouse Over    ${DragAndDrop_target}
#    Wait Until Element Is Visible    xpath://button[@class='ur-edit-grid']
#    Click Element    xpath://button[@class='ur-edit-grid']
#    Wait Until Element Is Visible    xpath://div[@class='ur-toggle-grid-content']//div[1]
#    Click Element    xpath://div[@class='ur-toggle-grid-content']//div[1]
    Make Single Column Form
    FOR    ${i}  IN   @{fields}
        Drag And Drop    ${i}   ${DragAndDrop_target}
        ${field name}=  Get Text    ${i}
        Log To Console    Succesfully dragged and dropped ${field name} field
    END


Verify field is in form or not

    FOR    ${i}   IN  @{name of fields}
        Wait Until Page Contains    ${i}
        Page Should Contain  ${i}
        Log To Console    ${i} is in form
    END


Change Label and description of fields one by one
    @{list}=  Get Webelements  ${locators_edit_form}
    FOR   ${locator}   IN   @{list}
#    	Sleep    3
#    	Log To Console    ${locator}
#        ${name}=  Get Text    ${locator}
#        Log To Console    ${name}
#        Mouse Over    ${locator}
#        Mouse Down   ${locator}
        Click Element    ${locator}
        Click Element    ${locator}
#        Sleep    3
        Input Text  ${fieldOption_label}  Label${num}   True
        Input Text  ${fieldOption_description}   This is description ${num}
        ${num}=  Evaluate    ${num}+${1}
    END


Verify whether label and desciption are changed or not
    @{preview_fields}=  Get Webelements  ${locators_preview_form}
    FOR    ${locator}  IN  @{preview_fields}
        Page Should Contain    Label${y}
        Page Should Contain    This is description ${y}
        ${y}=  Evaluate    ${y}+${1}
    END

Hide label of all fields
    @{list}=  Get Webelements    ${locators_edit_form}
    FOR   ${locator}   IN   @{list}
        ${name}=  Get Text    ${locator}
        Click Element    ${locator}
#        Scroll Element Into View  ${fieldOption_hideLabel}
        Scroll Element Into View  ur_general_setting[hide_label]
        Select Checkbox    ur_general_setting[hide_label]
#        Select From List By Value   ${fieldOption_hideLabel}   yes
        ${num}=  Evaluate    ${num}+${1}
    END

Verify whether the label is hidden or not
    @{preview_fields}=  Get Webelements  ${locators_preview_form}
    FOR    ${locator}  IN  @{preview_fields}
        Page Should Not Contain  Label${z}
        ${z}=  Evaluate    ${z}+${1}
    END

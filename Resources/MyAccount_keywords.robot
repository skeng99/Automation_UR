*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py
Resource    ../Resources/field_keywords.robot
Library    FakerLibrary

*** Variables ***
@{name of fields}  Textarea  First Name  Last Name  Secondary Email  Display Name  User Bio  Input Field  Number

*** Keywords ***
Form Builder
    [Arguments]    ${form_name}
    Add New Form    ${form_name}
    Mouse Over    ${DragAndDrop_target}
    Make Single Column Form
#    Wait Until Element Is Visible    xpath://button[@class='ur-edit-grid']
#    Click Element    xpath://button[@class='ur-edit-grid']
#    Wait Until Element Is Visible    xpath://div[@class='ur-toggle-grid-content']//div[1]
#    Click Element    xpath://div[@class='ur-toggle-grid-content']//div[1]
    FOR    ${i}  IN   @{fields}
        Drag And Drop    ${i}   ${DragAndDrop_target}
        ${field name}=  Get Text    ${i}
        Log To Console    Succesfully dragged and dropped ${field name} field
    END


Register a new user
    [Arguments]    ${user_name}  ${email}  ${password}  ${successful_msg}
    Input Text    id:user_login   ${user_name}
    Input Text    id:user_email   ${email}
    Input Text    id:user_pass    ${password}
    Input Text    id:user_confirm_password  ${password}
    Click Button    xpath://button[@type='submit']
    Page Should Contain    ${successful_msg}
#Genarate random data
#	${rand_first_name} =  FakerLibrary.first_name
#    ${rand_last_name} =  FakerLibrary.last_name
#	${rand_number} =   FakerLibrary.random_number
#	${random_text} =  FakerLibrary.text
#	${web}=  FakerLibrary.url
#	${sec_email}=  FakerLibrary.email
#	Set Test Variable    ${rand_first_name}
#	Set Test Variable    ${rand_last_name}
#	Set Test Variable    ${rand_number}
#	Set Test Variable    ${random_text}
#	Set Test Variable    ${web}
#	Set Test Variable    ${sec_email}
#
#login to account page
##	${rand_first_name}
#	Log To Console    ${rand_first_name}
#	Log To Console    ${rand_last_name}
#	Log To Console    ${rand_number}

#*** Keywords ***
#fill fields with random data
##	[Arguments]    ${username_input}
#    ${username_input} =  FakerLibrary.first_name
#    Set Global Variable  ${username_input}
#    ${rand_last_name} =  FakerLibrary.last_name
#	${num} =   FakerLibrary.random_number
#	${random_text} =  FakerLibrary.text
#	${web}=  FakerLibrary.url
#	${sec_email}=  FakerLibrary.email
##	Set Test Variable    ${username_input}
#	Input Text  ${username}   ${username_input}
#	Input Text  ${user_password}  password
#	Select Checkbox    xpath://input[@data-label='Privacy Policy']
#	Input Text    ${user_email}  ${username_input}@mailinator.com
#    Input Text    ${number}  ${num}
#    Input Text    ${textarea}  ${random_text}
#    Input Text    ${secondary_email}  ${sec_email}
#    Input Text    ${extra_password}  12345
#    Input Text    ${field_input}  ${random_text}
#    Input Text    ${description}  ${random_text}
#    Input Text    ${display_name}  ${username_input}
#    Input Text    ${website}  ${web}
#    Input Text    ${last_name}  ${rand_last_name}
#    Input Text    ${first_name}  ${username_input}
#    Input Text    ${nickname}  ${username_input}
#    Input Text    ${username}  ${username_input}
#    Input Text    ${confirm_password}  password
#    Input Text    ${confirm_email}  ${username_input}@mailinator.com
#
#
#Fill random data in edit profile
#	${rand_first_name} =  FakerLibrary.first_name
#	${rand_last_name} =  FakerLibrary.last_name
#	${num} =   FakerLibrary.random_number
#	${random_text} =  FakerLibrary.text
#	${web}=  FakerLibrary.url
#	${sec_email}=  FakerLibrary.email
#	Input Text    ${edit_profile_number}   ${num}
#	Input Text    ${edit_profile_textarea}   ${random_text}
#	Input Text    ${edit_profile_sec_email}  ${sec_email}
#	Input Text    ${edit_profile_input_field}  ${random_text}
#	Input Text    ${edit_profile_user_bio}  ${random_text}
#	Input Text    ${edit_profile_display_name}  ${rand_first_name}
#	Input Text    ${edit_profile_website}  ${web}
#	Input Text    ${edit_profile_lastname}  ${rand_last_name}
#	Input Text    ${edit_profile_firstname}  ${rand_first_name}
#	Input Text    ${edit_profile_nickname}  ${rand_first_name}
#	Input Text    ${edit_profile_user_email}  ${rand_first_name}@mailinator.com
#
#login to my account page

#Input firstname
#	${first_name}  FakerLibrary.First Name
#Input lastname
#    ${last_name}  FakerLibrary.Last Name
#Input number
#	${num}  FakerLibrary.Random Number
#
#Input random text
#	${random_text}  FakerLibrary.text
#
#Input email
#	${email}  FakerLibrary.email
#
#Input website
#	${website}  FakerLibrary.website




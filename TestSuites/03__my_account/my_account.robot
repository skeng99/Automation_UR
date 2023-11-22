*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py
Resource     ../Resources/MyAccount_keywords.robot
Resource    ../Resources/common_keywords.robot
Library    ../Resources/RandomDataGenerator.py
Library    FakerLibrary

Test Teardown    Close All Browsers

*** Variables ***
@{data}             User1  password  user1@getnada.com  password
...                 user1@getnada.com   nick name  First Name  Last Name  https://www.fb.com
...                 Display Name  Description  Input Field  12345
...                 email@secondary.com  TextArea  ${10}

@{new data}         new.user1@getnada.com  new_nick name
...                 new_First Name  new_Last Name  https://www.newfb.com
...                 new_Display Name  new_Description  new_Input Field  54321
...                 new.email@secondary.com  new_TextArea  ${100}

${x}  ${0}
${y}  ${0}
${preview_url}=    ${url}/my-account


*** Test Cases ***
Validate working of Edit profile
	${global_name} =  FakerLibrary.first_name
#	Set Suite Variable   ${global_name}
    Login To Wordpress
    Form Builder  My Account
    Click Element    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element    ${preview_form_btn}
    Switch Window    new
    Fill Fields With Random Data  ${global_name}
    Click Button    xpath://button[@type='submit']
    Open Browser    ${url}/my-account  ${browser}  options=add_argument("--incognito")
    Maximize Browser Window
    Input Text    xpath://input[@name='username']  ${global_name}
    Input Text    xpath://input[@name='password']  password
    Click Button    xpath://input[@name='login']
    Wait Until Page Contains    User successfully registered.
#    Reload Page
    Wait Until Element Is Visible    //span[normalize-space()='Edit Profile']
    Click Element    //span[normalize-space()='Edit Profile']
    Wait Until Page Contains   Profile Details
    Fill Random Data In Edit Profile
    Wait Until Element Is Visible    name:save_account_details  10s
    Click Element    name:save_account_details
    Verify whether profile details is changed or not



Validate Change password when entering same current password and new password
    Login To Wordpress
    Add New Form  Change password
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element    ${preview_form_btn}
    Switch Window    new
    Genarate Random Data
    Register A New User  ${rand_first_name}  ${rand_first_name}@mailinator.com  password  User successfully registered.
    Open Browser    ${url}/my-account  ${browser}  options=add_argument("--incognito")
    Maximize Browser Window
    Input Text    xpath://input[@name='username']    ${rand_first_name}
    Input Text    xpath://input[@name='password']  password
    Click Button    xpath://input[@name='login']
    Wait Until Element Is Visible    //a[@title='Edit Password']  10s
    Click Element   //a[@title='Edit Password']
    Input Text       id:password_current  password
    Input Text        id:password_1   password
    Input Text        id:password_2   password
    Click Element    name:save_change_password
    Wait Until Page Contains    New password must not be same as old password  10s
    Page Should Contain    New password must not be same as old password

Validate Change password when entering new password
    Login To Wordpress
    Add New Form  Change password
    Click Button    ${update_form_btn}
    Wait Until Page Contains    Success! Form successfully saved.
    Click Element    ${preview_form_btn}
    Switch Window    new
    Genarate Random Data
    Register A New User  ${rand_first_name}  ${rand_first_name}@mailinator.com  password  User successfully registered.
    Open Browser    ${url}/my-account  ${browser}  options=add_argument("--incognito")
    Maximize Browser Window
    Input Text    xpath://input[@name='username']    ${rand_first_name}
    Input Text    xpath://input[@name='password']  password
    Click Button    xpath://input[@name='login']
    Wait Until Element Is Visible    //a[@title='Edit Password']  10s
    Click Element   //a[@title='Edit Password']
    Input Text   id:password_current  password
    Input Text   id:password_1  newpassword
    Input Text   id:password_2  newpassword
    Click Element    name:save_change_password
    Wait Until Page Contains    Password changed successfully.  10s
    Page Should Contain    Password changed successfully.



*** Keywords ***
Genarate random data
	${rand_first_name} =  FakerLibrary.first_name
    ${rand_last_name} =  FakerLibrary.last_name
	${rand_num} =   FakerLibrary.random_number
	${random_text} =  FakerLibrary.text  max_nb_chars=${20}
	${web}=  FakerLibrary.url
	${sec_email}=  FakerLibrary.email
	Set Test Variable    ${rand_first_name}
	Set Test Variable    ${rand_last_name}
	Set Test Variable    ${rand_num}
	Set Test Variable    ${random_text}
	Set Test Variable    ${web}
	Set Test Variable    ${sec_email}



fill fields with random data
	[Arguments]    ${global_username}
#	Generate Username
	Genarate Random Data
	Input Text  ${username}   ${global_username}
	Input Text  ${user_password}  password
	Select Checkbox    xpath://input[@data-label='Privacy Policy']
	Input Text    ${user_email}  ${global_username}@mailinator.com
    Input Text    ${number}  ${rand_num}
    Input Text    ${textarea}  ${random_text}
    Input Text    ${secondary_email}  ${sec_email}
    Input Text    ${extra_password}  12345
    Input Text    ${field_input}  ${random_text}
    Input Text    ${description}  ${random_text}
    Input Text    ${display_name}  ${rand_last_name}
    Input Text    ${website}  ${web}
    Input Text    ${last_name}  ${rand_last_name}
    Input Text    ${first_name}  ${rand_first_name}
    Input Text    ${nickname}  ${rand_first_name}
    Input Text    ${confirm_password}  password
    Input Text    ${confirm_email}  ${global_username}@mailinator.com


Fill random data in edit profile
    Genarate Random Data
	Input Text    ${edit_profile_number}   ${rand_num}
	Input Text    ${edit_profile_textarea}   ${random_text}
	Input Text    ${edit_profile_sec_email}  ${sec_email}
	Input Text    ${edit_profile_input_field}  ${random_text}
	Input Text    ${edit_profile_user_bio}  ${random_text}
	Input Text    ${edit_profile_display_name}  ${rand_first_name}
	Input Text    ${edit_profile_website}  ${web}
	Input Text    ${edit_profile_lastname}  ${rand_last_name}
	Input Text    ${edit_profile_firstname}  ${rand_first_name}
	Input Text    ${edit_profile_nickname}  ${rand_first_name}
	Input Text    ${edit_profile_user_email}  ${rand_first_name}@mailinator.com

Verify whether profile details is changed or not
    Wait Until Page Contains  User profile updated successfully.  10s
    Page Should Contain    User profile updated successfully.
    ${value1}   Get Value    ${edit_profile_number}
    ${value_num}   Convert To Integer    ${value1}
    Should Be Equal    ${value_num}    ${rand_num}
    ${value2}   Get Value    ${edit_profile_textarea}
    Should Be Equal    ${value2}    ${random_text}
    ${value3}   Get Value   ${edit_profile_sec_email}
    Should Be Equal    ${value3}   ${sec_email}
    ${value4}   Get Value    ${edit_profile_website}
    Should Be Equal    ${value4}     ${web}
















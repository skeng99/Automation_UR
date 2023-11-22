*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py
Library    ../Resources/RandomDataGenerator.py
Variables    ../Resources/Credentials.py
Library    FakerLibrary

#*** Variables ***
#${url}  http://ur300.local/wp-login.php?loggedout=true&wp_lang=en_US
#${browser}  chrome

*** Keywords ***
Login to Wordpress
    Open Browser    ${url}/wp-admin  ${browser}  options=add_argument("--incognito")
#    ;add_argument("window-size=1400,600")
    Maximize Browser Window
    Input Text    ${username_id}    ${wp_username}
    Input Text    ${password_id}    ${wp_password}
    Click Button   ${submit_id}
    Wait Until Page Contains Element    ${user_registration_hover}

Edit form
    Wait Until Page Contains Element    ${user_registration_hover}
    Mouse Over  ${user_registration_hover}
    Click Element  ${view_all_forms}
    Click Element   ${edit_form}

Preview last created form
#    wait Until Page Contains Element    ${user_registration_hover}
    Mouse Over  ${user_registration_hover}
    Click Element  ${view_all_forms}
    Click Element   ${edit_form}
    Click Element    (//a[contains(text(),'Preview')])[1]
    Switch Window    new


Register a new user with username,email,password and confirm password field
    [Arguments]    ${user_name}  ${email}  ${password}
    Input Text    id:user_login   ${user_name}
    Input Text    id:user_email   ${email}
    Input Text    id:user_pass    password
    Input Text    id:user_confirm_password  password
    Click Button   xpath://button[@type='submit']
    Page Should Contain    User successfully registered.


Open browser in incognito mode
	Open Browser    ${url}/my-account/  ${browser}  options=add_argument("--incognito")
    Maximize Browser Window

My Account Page
    Go To    ${url}/my-account/

Register An User
    [Arguments]     ${first_name}   ${password1}    ${email}
    Input Text  id:user_login   ${first_name}
    Input Text  id:user_email   ${email}
    Input Text    id:user_pass  ${password1}
    Input Text    id:user_confirm_password  ${password1}
    Click Button  xpath://button[@type='submit']

Login To My Account Page
    [Arguments]    ${first_name}    ${password1}
    Input Text    id:username   ${first_name}
    Input Text    id:password   ${password1}
    Click Button    xpath://input[@name='login']

change password page
    [Arguments]    ${new password}
    Input Text  password_1  ${new password}
    Input Text    password_2    ${new password}
    Click Element    xpath://input[@value='Save']

Drag and Drop Field
    [Arguments]    ${field}
    Drag And Drop    ${field}  ${DragAndDrop_target}
    ${field name}=  Get Text    ${field}
    Log To Console    Succesfully dragged and dropped ${field name} field

Check Password Strength
    [Arguments]     ${first_name}   ${password1}    ${email}
    Input Text  id:user_login   ${first_name}
    Input Text  id:user_email   ${email}
    Input Text    id:user_pass  ${password1}
    Input Text    id:user_confirm_password  ${password1}

Input fields
   [Arguments]     ${first_name}   ${password1}
    Input Text    id:username   ${first_name}
    Input Text    id:password   ${password1}


Generate random data
	${rand_first_name} =  FakerLibrary.first_name
    ${rand_last_name} =  FakerLibrary.last_name
	${rand_num} =   FakerLibrary.random_number
	${random_text} =  FakerLibrary.text
	${web}=  FakerLibrary.url
	${sec_email}=  FakerLibrary.email
	Set Test Variable    ${rand_first_name}
	Set Test Variable    ${rand_last_name}
	Set Test Variable    ${rand_num}
	Set Test Variable    ${random_text}
	Set Test Variable    ${web}
	Set Test Variable    ${sec_email}

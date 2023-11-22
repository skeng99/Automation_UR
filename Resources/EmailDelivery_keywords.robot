*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py
Library    ../Resources/RandomDataGenerator.py
Library    FakerLibrary


*** Keywords ***
Register a new user
    [Arguments]    ${user_name}  ${email}  ${password}  ${successful_msg}
    Input Text    id:user_login   ${user_name}
    Input Text    id:user_email   ${email}
    Input Text    id:user_pass    ${password}
    Input Text    id:user_confirm_password  ${password}
    Click Button    xpath://button[@type='submit']
    Page Should Contain    ${successful_msg}
    Page Should Not Contain    Username already exists.



Email verification using mailinator
    [Arguments]    ${username}
    Go To    https://www.mailinator.com/
    Input Text    xpath://input[@id='search']    ${username}
    Click Element    xpath://button[normalize-space()='GO']
    Wait Until Page Contains    Public Messages

Verify Email Content
    [Arguments]    ${email_subject}
    Sleep    2
    Wait Until Page Contains    ${email_subject}
    Page Should Contain   ${email_subject}
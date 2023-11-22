#*** Settings ***
#Library    SeleniumLibrary
##Library    AutoItLibrary
##Library      AutoRecorder  mode=suite
#Resource    ../../Resources/common_keywords.robot
#Resource    ../../Resources/field_keywords.robot
##Library    Faker
#
#*** Test Cases ***
#test for file upload
# 	Upload File With Type
#
#
#
#
#
#*** Keywords ***
#Upload file with type
##	[Arguments]    ${type}
#	Login To Wordpress
#	${random_name}=  FakerLibrary.first_name
#    ${lowercase_name}=  Evaluate    "${random_name}".lower()
##    Mouse Over  ${user_registration_hover}
##    Click Element    link:Settings
##	Click Element    //p[normalize-space()='File Uploads']
##	Input Text    (//span[@class='select2-selection select2-selection--multiple'])  ${type}
##	Press Keys    None  enter
#	Add New Form  File upload test 1
#    Make Single Column Form
#    Sleep    2
#    Drag And Drop    //li[@id='user_registration_file_list ']  ${DragAndDrop_target}
#    Sleep    2
#    Click Element    ${update_form_btn}
#    Wait Until Page Contains Element    ${preview_form_btn}
#    Click Element    ${preview_form_btn}
#    Switch Window    new
#    Input Text    id:user_login  ${lowercase_name}
#    Input Text    id:user_pass  password
#    Input Text    id:user_email  ${lowercase_name}@mailinator.com
#    Input Text    id:user_confirm_password  password
##    Mouse Over     //div[@class='urfu-file-upload']
##    Mouse Over     //div[@class='urfu-file-upload']
##    Mouse Over     //div[@class='urfu-file-upload']
#    Log To Console    ${CURDIR}
#    ${locator}  Get Webelement   //span[@class='urfu-upload-node']
#    Execute Javascript    arguments[0].setAttribute('style','overflow:visible;');  ARGUMENTS  ${locator}
##    Scroll Element Into View    //span[@class='urfu-upload-node']//input[@type='file']
##    Wait Until Element Is Visible  //span[@class='urfu-upload-node']//input[@type='file']  10s
##    Sleep    5
##    Click Element    //div[@class='urfu-file-upload']
##    Click Element    //div/div/span/input[@type='file']
##    ${upload_locator}  Get Webelement    //div/div/span/input[@type='file']
##    Mouse Down    ${upload_locator}
##    Execute Async Javascript    arguments[0].click();  ARGUMENTS  ${upload_locator}
##    Wait Until Element Is Visible      (//input[@type='file'])[1]
##    Drag And Drop    file:${CURDIR}\\pic.jpg  (//input[@type='file'])[1]
#    Choose File      //span[@class='urfu-upload-node']//input[@type='file']  ${CURDIR}\\pic.jpg
##    Choose File      ${locator}  ${CURDIR}\\pic.jpg
#    Sleep    5s
#    Click Element    //button[normalize-space()='Submit']
#    Wait Until Page Contains    User successfully registered.  10s
##    Sleep    5
##    WinWaitActive  Open  ${SPACE}
##    AutoItLibrary.Wait  For Active Window    Open    ${SPACE} #Wait to "Open" window appear.
##    AutoItLibrary.Control  Set Text    Open    ${SPACE}    Edit1    C:\\Temp\\filetoupload.txt    #Sending filename (with path) to inputfield
##    AutoItLibrary.Control  Click    Open    &Open    Button1 #Click on OPEN Button (Submit)
###    Click Element    //h2[contains(text(),'General Settings')]
###    Click Element    //form[@id='ur-setting-form']//h2[@class='ur-toggle-heading closed'][normalize-space()='Advanced Settings']

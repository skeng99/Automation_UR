# WordPress Login form locators
username_id = "id:user_login"
password_id = "id:user_pass"
submit_id = "id:wp-submit"

# WordPress Dashboard locator
user_registration_hover = "xpath://div[normalize-space()='User Registration']"
view_all_forms = "xpath://a[normalize-space()='All Forms']"
edit_form = "xpath://tbody/tr[1]/td[1]/strong[1]/div[1]/a[1]"
add_new_form = "xpath://a[@href='admin.php?page=add-new-registration']"
Start_from_scratch = "link:Start From Scratch"
Form_name_textbox = "xpath://input[@placeholder='Untitled Form']"
continue_btn = "xpath://button[normalize-space()='Continue']"
cancel_popup = "xpath://div[normalize-space()='×']"
field_confirm_email = "xpath://span[@class='ur-icon ur-icon-email-confirm']"
field_nickname = "xpath://li[@id='user_registration_nickname_list ']"
field_firstname = "xpath://li[@id='user_registration_first_name_list ']"
field_lastname = "xpath://li[@id='user_registration_last_name_list ']"
field_website = "xpath://li[@id='user_registration_user_url_list ']"
field_display_name = "xpath://li[@id='user_registration_display_name_list ']"
field_user_bio = "xpath://li[@id='user_registration_description_list ']"
input_field = "xpath://li[@id='user_registration_text_list ']"
password_field = "xpath://li[@id='user_registration_password_list ']"
field_secondary_email = "xpath://li[@id='user_registration_email_list ']"
field_select = "xpath://li[@id='user_registration_select_list ']"
field_country = "xpath://li[@id='user_registration_country_list ']"
field_Textarea = "xpath://li[@id='user_registration_textarea_list ']"
field_number = "xpath://li[@id='user_registration_number_list ']"
field_date = "xpath://li[@id='user_registration_date_list ']"
field_Checkbox = "xpath://li[@id='user_registration_checkbox_list ']"
field_privacy_policy = "xpath://li[@id='user_registration_privacy_policy_list ']"
field_radio = "xpath://li[@id='user_registration_radio_list ']"
DragAndDrop_target = "xpath://div[@class='ur-grid-lists']"
update_form_btn = "xpath://button[@id='save_form_footer']"
preview_form_btn = "xpath://a[@title='Preview Form']"

# List Of Locators To Be Dragged
fields = [field_confirm_email, field_nickname, field_firstname, field_lastname, field_website, field_display_name,
          field_user_bio, input_field, password_field, field_secondary_email,
          field_Textarea, field_number, field_date, field_Checkbox, field_privacy_policy, field_radio]
field_list1 = [field_nickname, field_firstname, field_lastname, field_website, field_display_name,
               field_user_bio, input_field, field_number]

fieldOption_label = "xpath://form[@id='ur-setting-form']//input[@placeholder='Label'] "
fieldOption_description = "xpath://form[@id='ur-setting-form']//textarea[@placeholder='Description']"
fieldOption_hideLabel = "xpath://form[@id='ur-setting-form']//div[@class='ur-general-setting ur-setting-select ur-general-setting-hide-label']//select[@name='ur_general_setting[hide_label]']"
locators_edit_form = "xpath://div[starts-with(@class,'ur-selected-item')]"
locators_preview_form = "xpath://div[starts-with(@class,'ur-field-item')]"

# locators in preview form
username = "xpath://input[@id='user_login'] "
user_password = "xpath://input[@id='user_pass']"
user_email = "xpath://input[@id='user_email']"
confirm_password = "xpath://input[@id='user_confirm_password']"
confirm_email = "xpath://input[@id='user_confirm_email']"
nickname = "xpath://input[@id='nickname']"
first_name = "xpath://input[@id='first_name']"
last_name = "xpath://input[@id='last_name']"
website = "xpath://input[@id='user_url']"
display_name = "xpath://input[@id='display_name']"
description = "xpath://textarea[@id='description']"
field_input = "xpath://input[@data-label='Input Field']"
extra_password = "xpath://input[@data-label='Password Field']"
secondary_email = "xpath://input[@data-label='Secondary Email']"
textarea = "xpath://textarea[@data-label='Textarea']"
number = "xpath://input[@data-label='Number']"

preview_field_list = [username, user_password, user_email, confirm_password, confirm_email, nickname, first_name,
                      last_name, website, display_name, description, field_input, extra_password, secondary_email,
                      textarea, number]

edit_profile_user_email = "id:user_registration_user_email"
edit_profile_nickname = "id:user_registration_nickname"
edit_profile_firstname = "id:user_registration_first_name"
edit_profile_lastname = "id:user_registration_last_name"
edit_profile_website = "id:user_registration_user_url"
edit_profile_display_name = "id:user_registration_display_name"
edit_profile_user_bio = "id:user_registration_description"
edit_profile_input_field = "xpath://input[starts-with(@id,'user_registration_input_box')]"
edit_profile_password_field = "xpath://input[starts-with(@id,'user_registration_password')]"
edit_profile_sec_email = "xpath://input[starts-with(@id,'user_registration_email')]"
edit_profile_textarea = "xpath://textarea[starts-with(@id,'user_registration_textarea')]"
edit_profile_number = "xpath://input[starts-with(@id,'user_registration_number_box')]"

edit_profile_field_list = [edit_profile_user_email, edit_profile_nickname, edit_profile_firstname,
                           edit_profile_lastname, edit_profile_website,
                           edit_profile_display_name, edit_profile_user_bio, edit_profile_input_field,
                           edit_profile_password_field,
                           edit_profile_sec_email, edit_profile_textarea, edit_profile_number]

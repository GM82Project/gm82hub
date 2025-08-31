#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
panel=ui_create(ui_t_panel)
ui_set_style(panel,ui_integrated_styler)
ui_set_pos(panel,x,y)
ui_set_size(panel,184,ui_fit_contents,4,0)

label=ui_create(ui_t_label)
ui_set_style(label,ui_integrated_styler)
ui_set_size(label,24,24,0,4)
ui_set_text(label,"Preferred Git")
ui_append_child(panel,label)

ui_append_child(panel,ui_t_break)

radio=ui_create(ui_t_radio,git_radio_handler)
ui_set_style(radio,ui_integrated_styler)
ui_set_size(radio,24,24,0,4)
ui_set_text(radio,"Git GUI")
ui_set_alt(radio,"","Prefer using Git GUI when available.")
ui_set_variable(radio,"pref",0)
if (GITPREF==0) ui_set_state(radio,"checked")
ui_append_child(panel,radio)
radio0=radio

ui_append_child(panel,ui_t_break)

radio=ui_create(ui_t_radio,git_radio_handler)
ui_set_style(radio,ui_integrated_styler)
ui_set_size(radio,24,24,0,4)
ui_set_text(radio,"Github Desktop")
ui_set_alt(radio,"","Prefer using Github Desktop when available.")
ui_set_variable(radio,"pref",1)
if (GITPREF==1) ui_set_state(radio,"checked")
ui_append_child(panel,radio)
radio1=radio

ui_append_child(panel,ui_t_break)

radio=ui_create(ui_t_radio,git_radio_handler)
ui_set_style(radio,ui_integrated_styler)
ui_set_size(radio,24,24,0,4)
ui_set_text(radio,"GitExtensions")
ui_set_alt(radio,"","Prefer using GitExtensions when available.")
ui_set_variable(radio,"pref",2)
if (GITPREF==2) ui_set_state(radio,"checked")
ui_append_child(panel,radio)
radio2=radio

ui_append_child(panel,ui_t_break)

radio=ui_create(ui_t_radio,git_radio_handler)
ui_set_style(radio,ui_integrated_styler)
ui_set_size(radio,24,24,0,4)
ui_set_text(radio,"TortoiseGit")
ui_set_alt(radio,"","Prefer using TortoiseGit when available.")
ui_set_variable(radio,"pref",3)
if (GITPREF==3) ui_set_state(radio,"checked")
ui_append_child(panel,radio)
radio3=radio
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (TAB==2) {
    visible=1
    ui_push_default_messages()
    ui_process_messages(panel)
} else visible=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ui_draw(panel)

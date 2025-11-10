#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
down=0
type=0
mytab=-1
downcount=0
gray=0
focus=0
anchor=0
visibility=0
alt=""
spr=noone
status=""
check=0

w=32
h=32
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
focus=instance_position(MOUSE_X,MOUSE_Y,id)

if (down!=0) {
    //click button
    if (!focus) down=-1
    else down=abs(down)
    downcount+=1
    if (downcount>room_speed/3) button_held()
    if (!mouse_check_button(mb_left)) {
        if (down && !gray) button_actions()
        down=0
    }
} else downcount=0

if (action=="opengmk")    alt=pick(keyboard_check(vk_control),"Open Game Maker to edit the game","Open Game Maker and close Hub")
if (action=="rungmk")     alt=pick(keyboard_check(vk_control),"Run a test build of the game","Run a test build and close Hub")
if (action=="compilegmk") alt=pick(keyboard_check(vk_control),"Build the game","Build the game and close Hub")
if (action=="browsegmk")  alt=pick(keyboard_check(vk_control),"Open the folder containing the game","Open the folder and close Hub")
if (action=="gitgmk" and GIT!=undefined) {if (gray) alt="No repository found" else alt=pick(keyboard_check(vk_control),"Launch "+GITNAME,"Launch "+GITNAME+" and close Hub")}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (object_index==Button && type==1) {
    //checkbox
    w=24
    h=24
}

image_xscale=w
image_yscale=h

if (action="gitgmk" and is_undefined(GIT)) {
    gray=1
    alt="No known Git tools detected"
}

if (action="theme custom col mid") text=string(global.col_main)
if (action="theme custom col up") text=string(global.col_high)
if (action="theme custom col down") text=string(global.col_low)
if (action="theme custom col text") text=string(global.col_text)
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///click
down=(mytab==TAB || mytab==-1)

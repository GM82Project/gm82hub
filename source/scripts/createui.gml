i=instance_create(0,0,Button)
i.spr=5
i.w=120
i.action="lasttab"
i.text=" Recent"

i=instance_create(120,0,Button)
i.spr=6
i.w=120
i.action="uptab"
i.text=" Updates"

i=instance_create(240,0,Button)
i.spr=7
i.w=120
i.action="settab"
i.text=" Settings"

i=instance_create(360,0,Button)
i.spr=8
i.w=120
i.action="tooltab"
i.text=" Tools"

//recent tab
i=instance_create(0,32,Button)
i.w=80
i.spr=0
i.action="opengmk"
i.text=" Edit"
i.mytab=tab_recent
i.anchor=anc_width1
i.visibility=vis_open

i=instance_create(80,32,Button)
i.w=80
i.spr=1
i.action="rungmk"
i.text=" Test"
i.mytab=tab_recent
i.anchor=anc_width1
i.visibility=vis_open

i=instance_create(160,32,Button)
i.w=80
i.spr=2
i.action="compilegmk"
i.text=" Build"
i.mytab=tab_recent
i.anchor=anc_width1
i.visibility=vis_open

i=instance_create(240,32,Button)
i.w=80
i.spr=4
i.action="cleangmk"
i.text=" Clean"
i.mytab=tab_recent
i.anchor=anc_width1
i.visibility=vis_open

i=instance_create(320,32,Button)
i.w=96
i.spr=3
i.action="browsegmk"
i.text=" Browse"
i.mytab=tab_recent
i.anchor=anc_width1
i.visibility=vis_open

i=instance_create(416,32,Button)
i.w=64
i.spr=GITSPR
i.action="gitgmk"
i.text=" Git"
i.mytab=tab_recent
i.anchor=anc_width1
i.visibility=vis_open


//updates tab
i=instance_create(10,64,Button)
i.w=256
i.spr=9
i.action="website"
i.text=" 8.2 Project Website"
i.mytab=tab_updates
i.anchor=anc_width1


//settings tab
i=instance_create(8,64,Button)
i.type=1
i.action="theme dark"
i.text="Dark"
i.mytab=tab_settings
i.status="Default Game Maker 8.2 dark theme."

i=instance_create(8,92,Button)
i.type=1
i.action="theme light"
i.text="Light"
i.mytab=tab_settings
i.status="Windows 98-inspired light theme."

i=instance_create(8,120,Button)
i.type=1
i.action="theme custom"
i.text="Custom"
i.mytab=tab_settings
i.status="Make a custom theme of your liking using color and edge options."

i=instance_create(112,120,Button)
i.type=1
i.action="theme custom hard"
i.text=""
i.mytab=tab_settings
i.status="Hard, polygonal-looking 3D edges. Default GM 8.2 visual design."

i=instance_create(112+28,120,Button)
i.type=1
i.action="theme custom soft"
i.text=""
i.mytab=tab_settings
i.status="Rounded, smooth-shaded 3D edges."

i=instance_create(112+28*2,120,Button)
i.type=1
i.action="theme custom edge"
i.text=""
i.mytab=tab_settings
i.status="Rounded, smooth-shaded 3D edges, with an outline using the text color."

i=instance_create(40,148,TextField)
i.h=24
i.type=1
i.action="theme custom col mid"
i.text=""
i.mytab=tab_settings
i.status="Main color used for the surface of 3D buttons."

i=instance_create(80,148,TextField)
i.h=24
i.type=1
i.action="theme custom col up"
i.text=""
i.mytab=tab_settings
i.status="Shine color used for 3D buttons."

i=instance_create(120,148,TextField)
i.h=24
i.type=1
i.action="theme custom col down"
i.text=""
i.mytab=tab_settings
i.status="Shade color used for 3D buttons."

i=instance_create(160,148,TextField)
i.h=24
i.type=1
i.action="theme custom col text"
i.text=""
i.mytab=tab_settings
i.status="Text and outline color across the interface."

instance_create(200,32,PrefGit)


//initialize all buttons
with (Button) event_user(0)

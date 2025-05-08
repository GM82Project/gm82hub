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

i=instance_create(10,64,Button)
i.w=256
i.spr=9
i.action="website"
i.text=" 8.2 Project Website"
i.mytab=tab_updates
i.anchor=anc_width1


//initialize all buttons
with (Button) event_user(0)

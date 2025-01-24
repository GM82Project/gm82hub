i=instance_create(0,0,Button)
i.w=96
i.action="lasttab"
i.text="Recent"

i=instance_create(96,0,Button)
i.w=96
i.action="uptab"
i.text="Updates"

i=instance_create(192,0,Button)
i.w=96
i.action="settab"
i.text="Settings"

i=instance_create(288,0,Button)
i.w=96
i.action="tooltab"
i.text="Tools"

//recent tab
i=instance_create(0,32,Button)
i.w=64
i.action="opengmk"
i.text="Edit"
i.mytab=tab_recent
i.anchor=anc_width1
i.visibility=vis_open

i=instance_create(64,32,Button)
i.w=64
i.action="rungmk"
i.text="Test"
i.mytab=tab_recent
i.anchor=anc_width1
i.visibility=vis_open

i=instance_create(128,32,Button)
i.w=64
i.action="compilegmk"
i.text="Build"
i.mytab=tab_recent
i.anchor=anc_width1
i.visibility=vis_open

i=instance_create(192,32,Button)
i.w=144
i.action="browsegmk"
i.text="Browse files"
i.mytab=tab_recent
i.anchor=anc_width1
i.visibility=vis_open

i=instance_create(336,32,Button)
i.w=144
i.action="cleangmk"
i.text="Clean project"
i.mytab=tab_recent
i.anchor=anc_width1
i.visibility=vis_open

//initialize all buttons
with (Button) event_user(0)

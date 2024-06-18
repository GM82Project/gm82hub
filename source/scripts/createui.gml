i=instance_create(0,0,Button)
i.w=96
i.action="lasttab"
i.text="Recent"

/*i=instance_create(96,0,Button)
i.w=96
i.action="docstab"
i.text="Docs"

i=instance_create(192,0,Button)
i.w=96
i.action="newstab"
i.text="News"

i=instance_create(288,0,Button)
i.w=96
i.action="updatestab"
i.text="Updates"      */

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


//help tab
i=instance_create(4,36,TextField)
i.w=320-8
i.action="search"
i.dtext="Search..."
i.mytab=tab_help
i.anchor=anc_width1+anc_width2
i.visibility=vis_open

//initialize all buttons
with (Button) event_user(0)

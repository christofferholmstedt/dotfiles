Stuff that can't be fixed with scripts
======================================
### Remove sources from sources.list
Remove sources (deb-src) from sources.list to save bandwidth and time.
Change sources.list to use ftp.sunet.se instead of default

### Define Ubuntu shortcuts.

<!--
After setting correct bindings through GUI these values haven't been updated.
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down ['<Control><Alt>k']
org.gnome.desktop.wm.keybindings switch-to-workspace-left ['<Control><Alt>j']
org.gnome.desktop.wm.keybindings switch-to-workspace-right ['<Control><Alt>ö']
org.gnome.desktop.wm.keybindings switch-to-workspace-up ['<Control><Alt>l']

org.gnome.desktop.wm.keybindings move-to-workspace-down ['<Control><Shift><Alt>Down']
org.gnome.desktop.wm.keybindings move-to-workspace-left ['<Control><Shift><Alt>Left']
org.gnome.desktop.wm.keybindings move-to-workspace-right ['<Control><Shift><Alt>Right']
org.gnome.desktop.wm.keybindings move-to-workspace-up ['<Control><Shift><Alt>Up']
-->
´´´
Remap "Lock Screen" to ctrl+alt+o
Remap "Move to workspace left" to ctrl+alt+j
Remap "Move to workspace right" to ctrl+alt+ö
Remap "Move to workspace above" to ctrl+alt+l
Remap "Move to workspace below" to ctrl+alt+k

Remap "Move window one workspace to the left" to shift+ctrl+alt+j
Remap "Move window one workspace to the right" to shift+ctrl+alt+ö
Remap "Move window one workspace up" to shift+ctrl+alt+l
Remap "Move window one workspace down" to shift+ctrl+alt+k
´´´

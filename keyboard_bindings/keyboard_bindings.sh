# To map other keypresses use "xev" to find the keycode wanted
# and perhaps "man xkeyboard-config" to find available predefined
# xkboptions.

# Reset all XkbOptions (empty value)
setxkbmap -option

# Set the Caps Lock key to a left hand AltGr
# This is to make it easier to type {[]} characters on a
# keyboard with swedish layout.
setxkbmap -option "lv3:caps_switch"

# Set the menu key to Caps Lock
xmodmap -e "keycode 135 = Caps_Lock"

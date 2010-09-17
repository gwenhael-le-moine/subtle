# coding: utf-8
#
# Author::  Gwenhael Le Moine
# License:: GNU GPL
#

#Reference:
# * unexist's config @ http://hg.subforge.org/dotfiles/

require "socket"
require "/usr/share/subtle/subtle-contrib/ruby/launcher.rb"

hostname = Socket.gethostname

# == Options
set :border, 1
set :step, 5
set :snap, 10
set :gravity, :center
set :urgent, true
set :resize, true
set :randr, true
set :padding, [ 0, 0, 0, 0 ]
set :font, "xft:Mensch:pixelsize=12"
set :gap, 0

#
# == Panel
#
# The next configuration values determine the layout and placement of the panel.
# Generally, the panel in subtle consists of two independent bars, one on the
# top and one at the bottom of the screen. In Xinerama setups there will only
# be panels visible on the first screen.
#
# The top and bottom bar can contain different items and will be hidden when
# empty.
#
# Following items are available:
#
# [*:views*]     List of views with buttons
# [*:title*]     Title of the current active window
# [*:tray*]      Systray icons
# [*:sublets*]   Catch-all for installed sublets
# [*:spacer*]    Variable spacer
# [*:separator*] Insert separator
#
# Content of the top panel
set :top, [:tray, :views, :spacer, :title, :spacer, :sublets, :spacer, :scratchpad]

# Content of the bottom panel
set :bottom, [ ]

# Add stipple to panels
set :stipple, false

# Separator between sublets
set :separator, " "

# Outline border size in pixel of panel items
set :outline, 1

#
# == Colors
#
# Colors directly define the look of subtle, valid values are:
#
# [*hexadecimal*] #0000ff
# [*decimal*]     (0, 0, 255)
# [*names*]       blue
#
# Whenever there is no valid value for a color set - subtle will use a default
# one. There is only one exception to this: If no background color is given no
# color will be set. This will ensure a custom background pixmap won't be
# overwritten.
#
# Zenburn theme from http://subforge.org/wiki/subtle/Themes
# color :background,    "#3d3d3d"
# color :bg_focus,      "#1e2320"
# color :bg_panel,      "#3f3f3f"
# color :bg_sublets,    "#3f3f3f"
# color :bg_urgent,     "#3f3f3f"
# color :bg_views,      "#3f3f3f"
# color :border_focus,  "#6f6f6f"
# color :border_normal, "#3f3f3f"
# color :border_panel,  "#3f3f3f"
# color :fg_focus,      "#f0dfaf"
# color :fg_panel,      "#dcdccc"
# color :fg_sublets,    "#dcdccc"
# color :fg_urgent,     "#cc9393"
# color :fg_views,      "#dcdccc"

# 'merged'
color :background,    "#3d3d3d"
color :bg_focus,      "#202020"
color :bg_panel,      "#202020"
color :bg_sublets,    "#202020"
color :bg_views,      "#202020"
color :border_focus,  "#5fd7ff"
color :border_normal, "#202020"
color :fg_focus,      "#5fd7ff"
color :fg_panel,      "#5fd7ff"
color :fg_sublets,    "#6c6c6c"
color :fg_views,      "#6c6c6c"

#
# == Gravities
#
# Gravities are predefined sizes a window can be set to. There are several ways
# to set a certain gravity, most convenient is to define a gravity via a tag or
# change them during runtime via grab. Subtler and subtlext can also modify
# gravities.
#
# A gravity consists of four values which are a percentage value of the screen
# size. The first two values are x and y starting at the center of the screen
# and he last two values are the width and height.
#
# === Example
#
# Following defines a gravity for a window with 100% width and height:
#
#   gravity :example, [ 0, 0, 100, 100 ]
#
#
  # Top left
gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left66,     [   0,   0,  50,  66 ]
gravity :top_left33,     [   0,   0,  50,  34 ]

  # Top
gravity :top,            [   0,   0, 100,  50 ]
gravity :top66,          [   0,   0, 100,  66 ]
gravity :top33,          [   0,   0, 100,  34 ]

  # Top right
gravity :top_right,      [ 100,   0,  50,  50 ]
gravity :top_right66,    [ 100,   0,  50,  66 ]
gravity :top_right33,    [ 100,   0,  50,  34 ]

  # Left
gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,  50,  50,  34 ]
gravity :left33,         [   0,  50,  25,  34 ]

  # Center
gravity :center,         [   0,   0, 100, 100 ]
gravity :center66,       [   0,  50, 100,  34 ]
gravity :center33,       [  50,  50,  50,  34 ]

  # Right
gravity :right,          [ 100,   0,  50, 100 ]
gravity :right66,        [ 100,  50,  50,  34 ]
gravity :right33,        [ 100,  50,  25,  34 ]

  # Bottom left
gravity :bottom_left,    [   0, 100,  50,  50 ]
gravity :bottom_left66,  [   0, 100,  50,  66 ]
gravity :bottom_left33,  [   0, 100,  50,  34 ]

  # Bottom
gravity :bottom,         [   0, 100, 100,  50 ]
gravity :bottom66,       [   0, 100, 100,  66 ]
gravity :bottom33,       [   0, 100, 100,  34 ]

  # Bottom right
gravity :bottom_right,   [ 100, 100,  50,  50 ]
gravity :bottom_right66, [ 100, 100,  50,  66 ]
gravity :bottom_right33, [ 100, 100,  50,  34 ]

  # Gimp
gravity :gimp_image,     [  50,  50,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [ 100,   0,  10, 100 ]

#
# == Grabs
#
# Grabs are keyboard and mouse actions within subtle, every grab can be
# assigned either to a key and/or to a mouse button combination. A grab
# consists of a chain and an action.
#
# === Chain
#
# A chain is a string of modifiers, mouse buttons and normal keys separated by
# a hyphen.
#
# ==== Modifiers:
#
# [*S*] Shift key
# [*A*] Alt key
# [*C*] Control key
# [*W*] Super (Windows key)
# [*M*] Meta key
#
# ==== Mouse buttons:
#
# [*B1*] Button1
# [*B2*] Button2
# [*B3*] Button3
# [*B4*] Button4
# [*B5*] Button5
#
# === Action
#
# An action is something that happens when a grab is activated, this can be one
# of the following:
#
# [*symbol*] Run a subtle action
# [*string*] Start a certain program
# [*array*]  Cycle through gravities
# [*lambda*] Run a Ruby proc
#
# === Example
#
# This will create a grab that starts a urxvt when Alt+Enter are pressed:
#
#   grab "A-Return", "urxvt"
#

# Switch to view1, view2, ...
# grab "A-F1", :ViewJump1
# grab "A-F2", :ViewJump2
# grab "A-F3", :ViewJump3
# grab "A-F4", :ViewJump4
# grab "A-F5", :ViewJump5
# grab "A-F6", :ViewJump6
# grab "A-F7", :ViewJump7
# grab "A-F8", :ViewJump8
# grab "A-F9", :ViewJump9

# Select next and prev view */
# grab "KP_Add",      :ViewNext
# grab "KP_Subtract", :ViewPrev

# Move mouse to screen1, screen2, ...
grab "S-A-F1", :ScreenJump1
grab "S-A-F2", :ScreenJump2

# Move window to screen1, screen2, ...
grab "A-W-F1", :WindowScreen1
grab "A-W-F2", :WindowScreen2

# Force reload of sublets
grab "W-C-s", :SubletsReload

# Force reload of config
grab "W-C-r", :SubtleReload

# Force restart of subtle
grab "W-C-S-r", :SubtleRestart

# Quit subtle
grab "W-S-q", :SubtleQuit

# Move current window
grab "A-B1", :WindowMove

# Resize current window
grab "A-B3", :WindowResize

# Toggle floating mode of window
grab "W-A-space", :WindowFloat

# Toggle fullscreen mode of window
#grab "W-F12", :WindowFull

# Toggle sticky mode of window (will be visible on all views)
grab "C-W-s", :WindowStick

# Raise window
grab "C-W-r", :WindowRaise

# Lower window
grab "C-W-l", :WindowLower

# Select next windows
grab "A-Left",  :WindowLeft
grab "A-Down",  :WindowDown
grab "A-Up",    :WindowUp
grab "A-Right", :WindowRight

# Kill current window
#grab "W-C-q", :WindowKill

# Cycle between given gravities
grab "W-Up",    [ :top,          :top66,          :top33          ]
grab "W-Left",  [ :left,         :left66,         :left33         ]
grab "W-Right", [ :right,        :right66,        :right33        ]
grab "W-Down",  [ :bottom,       :bottom66,       :bottom33       ]
#grab "W-A-q", [ :top_left,     :top_left66,     :top_left33     ]
#grab "W-A-e", [ :top_right,    :top_right66,    :top_right33    ]
#grab "W-A-s", [ :center,       :center66,       :center33       ]
#grab "W-A-z", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
#grab "W-A-c", [ :bottom_right, :bottom_right66, :bottom_right33 ]

# Run Ruby lambdas
grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end

#Gwh
grab "A-Tab" do |c|
   sel     = 0
   clients = Subtlext::View[:current].clients

   clients.each_index do |idx|
      if( clients[idx].id == c.id )
         sel = idx + 1 if( idx < clients.size - 1 )
      end
   end

   clients[sel].focus
end

# Exec programs
# grab "W-Return"             , "Terminal"
# grab "W-e"                  , "/home/cycojesus/bin/emacs-dwim.sh"
# grab "W-m"                  , "uxterm -e mocp"
# grab "W-r"                  , "dmenu_run"
# grab "W-S-R" do # haven't fully understood how this launcher work...
#    Launcher::Launcher.instance.run
# end
# grab "W-t"                  , "Terminal"
# grab "W-x"                  , "ps aux | grep -v grep | grep xcompmgr -q && killall xcompmgr || xcompmgr -C -c"
# grab "C-W-x"                , "mocp -P; xlock -mode blank"

# grab "XF86AudioMute"        , "amixer set Master toggle"
# grab "XF86AudioRaiseVolume" , "amixer set Master 2dB+"
# grab "XF86AudioLowerVolume" , "amixer set Master 2dB-"
# grab "XF86AudioPlay"        , "mocp -G"
# grab "XF86AudioStop"        , "mocp -s"
# grab "XF86AudioPrev"        , "mocp -r"
# grab "XF86AudioNext"        , "mocp -f"

#
# == Tags
#
# Tags are generally used in subtle for placement of windows. This placement is
# strict, that means that - aside from other tiling window managers - windows
# must have a matching tag to be on a certain view. This also includes that
# windows that are started on a certain view will not automatically be placed
# there.
#
# There are to ways to define a tag:
#
# [*string*]  With a WM_CLASS/WM_NAME
# [*hash*]    With a hash of properties
#
# === Default
#
# Whenever a window has no tag it will get the default tag and be placed on the
# default view. The default view can either be set by the user with adding the
# default tag to a view by choice or otherwise the first defined view will be
# chosen automatically.
#
# === Properties
#
# Additionally tags can do a lot more then just control the placement - they
# also have properties than can define and control some aspects of a window
# like the default gravity or the default screen per view.
#
# [*:float*]   This property either sets the tagged client floating or prevents
#              it from being floating depending on the value.
#
#              Example: float true
#
# [*:full*]    This property either sets the tagged client to fullscreen or
#              prevents it from being set to fullscreen depending on the value.
#
#              Example: full true
#
# [*:gravity*] This property sets a certain to gravity to the tagged client,
#              but only on views that have this tag too.
#
#              Example: gravity :center
#
# [*:match*]   This property adds matching patterns to a tag, a tag can have
#              more than one. Matching works either via plaintext, regex
#              (see man regex(7)) or window id. Per default tags will only
#              match the WM_NAME and the WM_CLASS portion of a client, this
#              can be changed with following possible values:
#
#              [*:name*]      Match the WM_NAME
#              [*:instance*]  Match the first (instance) part from WM_CLASS
#              [*:class*]     Match the second (class) part from WM_CLASS
#              [*:role*]      Match the window role
#
#              Example: match :instance => "urxvt"
#                       match [:role, :class] => "test"
#                       match "[xa]+term"
#
# [*:resize*]  This property either enables or disables honoring of client
#              resize hints and is independent of the global option.
#
#              Example: resize true
#
# [*:screen*]  This property sets a certain to screen to the tagged client, but
#              only on views that have this tag too. Please keep in mind that
#              screen count starts with 0 for the first screen.
#
#              Example: screen 0
#
# [*:size*]    This property sets a certain to size as well as floating to the
#              tagged client, but only on views that have this tag too. It
#              expects an array with x, y, width and height values.
#
#              Example: size [100, 100, 50, 50]
#
# [*:stick*]   This property either sets the tagged client to stick or prevents
#              it from being set to stick depending on the value. Stick clients
#              are visible on every view.
#
#              Example: stick true
#
# [*:type*]    This property sets the [[Tagging|tagged]] client to be treated
#              as a specific window type though as the window sets the type
#              itself. Following types are possible:
#
#              [*:desktop*]  Treat as desktop window (_NET_WM_WINDOW_TYPE_DESKTOP)
#              [*:dock*]     Treat as dock window (_NET_WM_WINDOW_TYPE_DOCK)
#              [*:toolbar*]  Treat as toolbar windows (_NET_WM_WINDOW_TYPE_TOOLBAR)
#              [*:splash*]   Treat as splash window (_NET_WM_WINDOW_TYPE_SPLASH)
#              [*:dialog*]   Treat as dialog window (_NET_WM_WINDOW_TYPE_DIALOG)
#
#              Example: type :desktop
#
# [*:urgent*]  This property either sets the tagged client to be urgent or
#              prevents it from being urgent depending on the value. Urgent
#              clients will get keyboard and mouse focus automatically.
#
#              Example: urgent true
#

# == Tags
tag "terms" do
   match    "Terminal"
   # gravity  :center
   # screen   1
end

tag "browser" do
   match  "browser|navigator|midori|namoroka|firefox|chrome|chromium"
   screen 1

   # if("proteus" == host)
   #    gravity :top75
   # else
   #    gravity :center
   # end
end

tag "pdf" do
   match    "apvlv|evince"
   stick    true
   screen   0
end

tag "editor" do
   match   "emacs.*"
   screen  1
   resize  false

   # if("mockra" == host or "proteus" == host)
   #    gravity :top75
   # else
   #    gravity :center
   # end
end

tag "xephyr" do
   match    "xephyr"
   screen   0

   # if("mockra" == host)
   #    gravity  :center
   # else
   #    geometry [857, 96, 800, 800]
   # end
end

tag "android" do
   match    :name => "5554:AVD"
   screen   0
   geometry [ 873, 47, 791, 534 ]
end

tag "mplayer" do
   match   "mplayer"
   stick   true
   float   true
   urgent  true
   screen  1
end

tag "stick" do
   match  "dialog|subtly|python|gtk.rb|display|pychrom|xev"
   stick  true
   float  true
end

tag "void" do
   match   "jd-Main|Virtualbox"
   screen  1
end

tag "test" do
   match   "test"
   float   true
   resize  false
end

tag "one" do
   match    "urxvt2"
   gravity  :bottom_left
   screen   0
end

tag "two" do
   match    "urxvt2"
   gravity  :bottom
   screen   0
end

tag "six" do
   match    "navigator"
   gravity  :right
   screen   0
end

tag "seven" do
   match    "urxvt1"
   gravity  :top_left
   screen   0
end

tag "eight" do
   match    "urxvt1"
   gravity  :top
   screen   0
end

tag "one25" do
   match    "urxvt2"
   gravity  :bottom_left25
   screen   0
end

tag "three25" do
   match    "urxvt1"
   gravity  :bottom_right25
   screen   0
end

tag "xev" do
   match    :name => "Event Tester"
   geometry [ 1000, 100, 80, 80 ]
   float    true
   stick    true
end

tag "chrome-opts" do
   match :name => "chromium options"
   stick true
end

# Simple tags
tag "chat" do
   match [ :class, :name ] => "skype|pidgin"
end
tag "entertainement", "mocp"

# Placement
tag "editor" do
  match  "emacs"
  resize true
end

# Modes
tag "float" do
  match :class => "qemu|MPlayer|Wicd-client\.py|pinentry"
  float true
end

# Gimp
tag "gimp_image" do
  match   :role => "gimp-image-window"
  gravity :gimp_image
end

tag "gimp_toolbox" do
  match   :role => "gimp-toolbox"
  gravity :gimp_toolbox
end

tag "gimp_dock" do
  match   :role => "gimp-dock"
  gravity :gimp_dock
end

#
# == Views
#
# Views are the virtual desktops in subtle, they show all windows that share a
# tag with them. Windows that have no tag will be visible on the default view
# which is the view with the default tag or the first defined view when this
# tag isn't set.
#
# === Properties
#
# The same notation as in tags is possible for views, but currently only one
# additional property to regex is available.
#
# [*:regex*]   This property sets the matching pattern for a view.
# [*:dynamic*] This property enables dynamic mode of the view, that means it
#              will only be visible when there is a client on it.
#

terms  = "terms"
www    = "browser"
void   = "xephyr|default|void|gimp_.*"
editor = "android|editor"
chat   = "chat"
entertainement = "entertainement"

# # Host specific
# if("telas" == host) #< Multihead
#    terms  << "|eight|two"
#    www    << "|eight|two"
#    void   << "|eight|two"
#    editor << "|seven|one|six|xephyr"
# elsif("mockra" == host or "proteus" == host)
#    terms  << "|eight|two"
#    www    << "|one25|three25"
#    editor << "|one25|three25"
# end

# Simple views
view "T", terms
view "W", www
view "E", editor
view "C", chat
view "M", entertainement
view "V", void

# Dynamic views
view "temp" do
  dynamic true
end

#
# == Hooks
#
# And finally hooks are a way to bind Ruby scripts to a certain event.
#
# Following hooks exist so far:
#
# [*:client_create*]    Called whenever a window is created
# [*:client_configure*] Called whenever a window is configured
# [*:client_focus*]     Called whenever a window gets focus
# [*:client_kill*]      Called whenever a window is killed
#
# [*:tag_create*]       Called whenever a tag is created
# [*:tag_kill*]         Called whenever a tag is killed
#
# [*:view_create*]      Called whenever a view is created
# [*:view_configure*]   Called whenever a view is configured
# [*:view_jump*]        Called whenever the view is switched
# [*:view_kill*]        Called whenever a view is killed
#
# [*:tile*]             Called on whenever tiling would be needed
# [*:start*]            Called on start
# [*:exit*]             Called on exit
#
# === Example
#
# This hook will print the name of the window that gets the focus:
#
#   on :client_focus do |c|
#     puts c.name
#   end
#

# on :tile do
#    clients = Subtlext::View.current.clients
#    screen  = Subtlext::Screen.current
   
#    assoc = {}
   
#    clients.each do |c|
#       begin
#          assoc[c.gravity.id] << c rescue assoc[c.gravity.id] = [ c ]
#       rescue StandardError
#          # Startup errors
#       end
#    end
   
#    assoc.each do |k, v|
#       g      = Subtlext::Gravity[k]
#       border = 2 #< Currently hardcoded
      
#       # Calculate gravity
#       x, y, w, h = g.geometry_for(screen)
#       width      = w / v.size
#       pos        = x
      
#       v.each do |c|
#          c.resize   = false
#          c.geometry = [ pos, y, width - 2 * border, h - 2 * border ]
#          pos += width
#       end
#    end
# end

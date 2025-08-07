Opened 2024-06-22



# URLs

https://specifications.freedesktop.org/basedir-spec/latest/

Arch https://wiki.archlinux.org/title/XDG_Base_Directory


# Recommended XDG settings

XDG_CACHE_HOME          :: $HOME/.cache
XDG_CONFIG_HOME         :: $HOME/.config
XDG_RUNTIME_DIR         :: No default value required; warnings should be issued if not set or equivalents provided.  permissions access mode of 0700
XDG_SESSION_ID          :: 
XDG_CONFIG_DIRS         :: List of directories separated by : (analogous to PATH).  Should default to /etc/xdg. 
XDB_DATA_HOME           :: $HOME/.local/share
XDG_DATA_DIRS           :: default to this list --▷ /usr/local/share:/usr/share
XDG_SESSION_CLASS       :: 
XDG_SESSION_TYPE        :: 
XDB_STATE_HOME          :: $HOME/.local/state


# Sample output on 2024-06-22

->%   echo $XDG_CONFIG_HOME
/home/donagh/.config


->% echo $XDG_CONFIG_DIRS
(output)
/etc/xdg:/usr/share/manjaro-kde-settings/xdg:/usr/share/manjaro-kde-settings/xdg 


->% echo $XDG_SESSION_ID
(sample output)
2942


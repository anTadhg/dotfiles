export PATH="$PATH:$HOME/.local/bin"
# Default Programmes
export TERMINAL="footclient"
export BROWSER="firefox"
export READER="zathura"
export EDITOR="nvim"
export TERMCMD='footclient -T "terminal filechooser"'

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x Hyprland || dbus-run-session start-hyprland
#	pgrep -x niri || dbus-run-session niri
fi

### .profile
# Inspired by Steffan Lippens
#   http://stefaanlippens.net/my_bashrc_aliases_profile_and_other_stuff/

### Language Defaults
# When a language is not set, we'll go ahead and set a preferred default.
[ -z "$LANG" ] && export LANG="en_US.UTF-8"

### TMUX Reconnection
# Reconnect to the nearest-available TMUX session that has no connection. Only do this if not already in a TMUX session.
# This allows us to immediately drop into an active, already-initialized session.
# We do this first before any other initialization, but after LANG has been verified as set.
# We verify LANG has been set first to resolve an issue with tmux on macOS and Powerline characters.
[ -z "$TMUX" ] && for session in $(tmux ls 2>/dev/null | grep -vi "attached" | cut -d: -f1); do
	# If we successfully attach to a session, break this loop afterwards.
	tmux attach -t ${session} && exit 0
done

### XDG Config Home Directory
# On machines where this isn't set, set it to $HOME/.config
[ -z "$XDG_CONFIG_HOME" ] && export XDG_CONFIG_HOME="$HOME/.config"
# This directory -should- exist.
mkdir -p "$XDG_CONFIG_HOME"

### Path Setup
# Path setup is deferred to by a custom .pathrc file. This is to make sure that paths are only included once.
[ -s "$HOME/.pathrc" ] && source "$HOME/.pathrc"

### RVM
# Add RVM to the PATH.
if [[ ! "$PATH" == *$HOME/.rvm/bin* ]]; then
	export PATH="$PATH:$HOME/.rvm/bin"
fi
# Load RVM into a shell session. RVM is loaded as a function.
RVM_LOCATION="$HOME/.rvm/scripts/rvm"
[[ -s "$RVM_LOCATION" ]] && source "$RVM_LOCATION"


### LESS
# Test for tput; if available, then we'll make less ~pretty~.
if tput setaf 1 &>/dev/null; then
  export LESS_TERMCAP_mb=$(tput bold; tput setaf 1)  # begin bold
  export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # begin blink
  export LESS_TERMCAP_me=$(tput sgr0)  # reset bold/blink
  export LESS_TERMCAP_so=$(tput rev)   # begin reverse video
  export LESS_TERMCAP_se=$(tput sgr0)  # reset reverse video
  export LESS_TERMCAP_us=$(tput smul)  # begin underline
  export LESS_TERMCAP_ue=$(tput sgr0)  # reset underline
fi

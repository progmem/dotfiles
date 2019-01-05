### .profile
# Inspired by Steffan Lippens
#   http://stefaanlippens.net/my_bashrc_aliases_profile_and_other_stuff/

### Terminal - Italics Availability
# If italics are available and our current TERM is screen-256color, upgrade it to allow tput to recognize italics.
if [[ "$TERM" == "screen-256color"* ]] && infocmp screen-256color-italic &>/dev/null; then
	export TERM=screen-256color-italic
fi

### Language Defaults
# When a language is not set, we'll go ahead and set a preferred default.
[ -z "$LANG" ] && export LANG="en_US.UTF-8"

### MOSH Cleanup
# When a mosh connection is terminated abnormally without any running processes, we should clean it up.
for pid in $(pidof mosh-server); do
  # MOSH will usually have a shell process underneath it.
  # We'll check this child process for any children. If it has any children of its own, we move to the next PID.
  pgrep -P ${pid} | xargs -I{} pgrep -P {} &>/dev/null && continue
  # If this child process has no children of its own, we kill it.
  echo "Mosh ${pid} appears abandoned, cleaning up..."
  kill ${pid}
done

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
# TODO: Make this POSIX-compliant?
# RVM's path can go to .pathrc.
# However, I need to look at RVM_LOCATION to make sure these are as well.
# The original syntax was rvm's, so this might be bash-only.

# Add RVM to the PATH.
if [[ ! "$PATH" == *$HOME/.rvm/bin* ]]; then
  export PATH="$PATH:$HOME/.rvm/bin"
fi
# Load RVM into a shell session. RVM is loaded as a function.
RVM_LOCATION="$HOME/.rvm/scripts/rvm"
[[ -s "$RVM_LOCATION" ]] && source "$RVM_LOCATION"

### Less
# Make less's search case-insensitive.
export LESS="$LESS -i "

# Test for tput; if available, then we'll give less the ability to prettify output.
if tput setaf 1 &>/dev/null; then
  export LESS_TERMCAP_mb=$(tput bold; tput setaf 1)  # begin bold
  export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # begin blink
  export LESS_TERMCAP_me=$(tput sgr0)  # reset bold/blink
  export LESS_TERMCAP_so=$(tput rev)   # begin reverse video
  export LESS_TERMCAP_se=$(tput sgr0)  # reset reverse video
  export LESS_TERMCAP_us=$(tput smul)  # begin underline
  export LESS_TERMCAP_ue=$(tput sgr0)  # reset underline
fi

### .bash_profile
# Inspired by Steffan Lippens
#   http://stefaanlippens.net/my_bashrc_aliases_profile_and_other_stuff/

# .profile contains all login-related, non-bash related initializations.
[[ -s ~/.profile ]] && source ~/.profile

# .bashrc contains all non-login, bash-related initializations.
[[ -s ~/.bashrc  ]] && source ~/.bashrc

# Lastly, if I'm not already in a tmux session, I would like to be.
if [ -z "$TMUX" ]; then
	# .profile has a component that performs an early tmux attach without initializing the rest of the shell.
	# While we should never hit this for loop, if a tmux session isn't available I want to make sure we attach to an existing one before creating a new one.
	for session in $(tmux ls 2>/dev/null | grep -vi "attached" | cut -d: -f1); do
  	# If we successfully attach to a session, exit 0 will prevent us from going any further.
  	tmux attach -t ${session} && exit 0
	done
	# If we didn't have a session to attach to, start a new one.
	tmux
	exit 0
fi

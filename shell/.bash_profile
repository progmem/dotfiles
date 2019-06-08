### .bash_profile
# Inspired by Steffan Lippens
#   http://stefaanlippens.net/my_bashrc_aliases_profile_and_other_stuff/

# .pathrc sets up all custom paths first.
[[ -s ~/.pathrc ]] && source ~/.pathrc

# With pathing setup, we'll check if a tmux session already exists.
# If it does, we'll attach to it, skipping the rest of the initialization process.
if [[ -t 1 && -z "$TMUX" ]]; then
	for session in $(tmux ls 2>/dev/null | grep -vi "attached" | cut -d: -f1); do
		tmux attach -t ${session} && exit 0
	done
fi

# .profile contains all login-related, non-bash related initializations.
[[ -s ~/.profile ]] && source ~/.profile

# .bashrc contains all non-login, bash-related initializations.
[[ -s ~/.bashrc  ]] && source ~/.bashrc

# Lastly, if I'm not already in a tmux session, I would like to be.
[[ -t 1 && -z "$TMUX" ]] && tmux && exit 0

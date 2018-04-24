### .bashrc
# Inspired by Steffan Lippens
#   http://stefaanlippens.net/my_bashrc_aliases_profile_and_other_stuff/

### EDITOR
# We'll start with some good ol' defaults.
EDITOR=ed
VISUAL=vi

# We'll use micro if it's available.
if command -v micro >/dev/null; then
	VISUAL=micro
# Otherwise, we'll use nano if it's available.
elif command -v nano >/dev/null; then
	VISUAL=nano
fi
export EDITOR VISUAL

### PROMPT & HISTORY
# Source .bash_prompt, which builds our PS1.
[[ -s ~/.bash_prompt ]] && source ~/.bash_prompt
# Trim the displayed directory down to something reasonable.
export PROMPT_DIRTRIM=3
# When recording history, avoid successive duplicates.
export HISTCONTROL=ignoredups
# Append commands to the history every time a prompt is shown.
export PROMPT_COMMAND='history -a'
# Append commands to the history file instead of overwriting.
shopt -s histappend

### AUTOCOMPLETE
# Source bash_completion, if it's installed and we're on OSX.
# In most Linux distros, this will be sourced automatically.
[[ -s $(brew --prefix)/etc/bash_completion ]] && source $(brew --prefix)/etc/bash_completion

### ALIASES
# We'll hold these in a separate file.
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

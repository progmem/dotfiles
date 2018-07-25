### .bashrc
# Inspired by Steffan Lippens
#   http://stefaanlippens.net/my_bashrc_aliases_profile_and_other_stuff/

### Path Setup
# Path setup is deferred to by a custom .pathrc file. This is to make sure that paths are only included once.
[[ -s "$HOME/.pathrc" ]] && source "$HOME/.pathrc"

### Prompt & History
# Source .bash_prompt, which builds our PS1.
[[ -s "$HOME/.bash_prompt" ]] && source "$HOME/.bash_prompt"
# Trim the displayed directory down to something reasonable.
export PROMPT_DIRTRIM=3
# Append commands to the history every time a prompt is shown.
export PROMPT_COMMAND='history -a'
# When recording history, avoid successive duplicates.
export HISTCONTROL=ignoredups
# Append commands to the history file instead of overwriting.
shopt -s histappend

### Bash Completion
# Source Homebrew/Linuxbrew's bash_completion, if it's installed.
[[ -s "$(brew --prefix)/etc/bash_completion" ]] && source "$(brew --prefix)/etc/bash_completion"

### Bash Aliases
# We'll hold these in a separate file.
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

### Application-Specific
### FZF
# Allow for auto-completion by typing "**" and hitting tab.
[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.bash" 2>/dev/null
# Allow fzf to add keybindings to bash.
[[ -s "$(brew --prefix)/opt/fzf/shell/key-bindings.bash" ]] && source "$(brew --prefix)/opt/fzf/shell/key-bindings.bash"

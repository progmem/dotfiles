### .bash_aliases
# Inspired by Steffan Lippens
#   http://stefaanlippens.net/my_bashrc_aliases_profile_and_other_stuff/

### HUMAN-ERROR PREVENTION ###
# Destructive commands should be interactive.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'


### COLOR ###
# ls shortcuts are useful, especially when colorful.
ALIAS_LS_COLOR="--color=auto"
# BSD ls, however, is a pain. We'll check for it and use -G.
case "$OSTYPE" in
	darwin*|bsd*|freebsd*) ALIAS_LS_COLOR="-G" ;;
esac
# Now we'll set up aliases to make our ls output ~*pretty*~
alias ls="ls     ${ALIAS_LS_COLOR}"
alias ll="ls -l  ${ALIAS_LS_COLOR}"
alias la="ls -al ${ALIAS_LS_COLOR}"

# grep is also useful with color.
# BSD ls is much nicer here, thankfully.
alias grep='grep --color=auto'


### RUBY ###
# Use pry instead of irb, since pry works really well when you add fzf to it.
alias irb="pry"

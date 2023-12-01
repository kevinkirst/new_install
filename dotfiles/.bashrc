# ~/.bashrc: executed by bash(1) for non-login shells.
# author: kevinkirst
  # modified the linux mint original .bashrc and added my own flavours and spices

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

# custom $PS1 'faces' terminal prompt
	# \(^ヮ^)/ for successful commands
	# (￢_￢;) for errors
if [ "$color_prompt" = yes ]; then
	PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]'\(^ヮ^)/'\[\e[0m\]; else echo \[\e[31m\]'(￢_￢;)'\[\e[0m\]; fi\` ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
else
	PS1="\`if [ \$? = 0 ]; then echo '\(^ヮ^)/'; else echo '(￢_￢;)'; fi\` ${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
fi
unset color_prompt force_color_prompt

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# defining aliases with ~/.bash_aliases, instead of adding them here directly
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features
# you don't need to enable this, if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc)
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# creating $HOME/bin if it doesn't exist
if [ ! -d "$HOME/bin" ]; then
	mkdir "$HOME/bin"
fi

# adding $HOME/bin to $PATH if it hasn't been added yet
if [[ $(cut -d '/' -f 2 <<< $PATH) != "home" ]]; then
	PATH="$HOME/bin:$PATH"
fi

# =-= COLOURS =-= #
# to interpret colours use 'echo -e [colour] text $CLR_DEFAULT
# always use $CLR_DEFAULT at the end of the line
CLR_DEFAULT='\e[0m'
CLR_BLACK='\e[0;30m'
CLR_GREY='\e[1;30m'
CLR_LIGHT_GREY='\e[0;37m'
CLR_WHITE='\e[1;37m'
CLR_BROWN='\e[0;33m'
CLR_RED='\e[0;31m'
CLR_LIGHT_RED='\e[1;31m'
CLR_YELLOW='\e[1;33m'
CLR_GREEN='\e[0;32m'
CLR_LIGHT_GREEN='\e[1;32m'
CLR_CYAN='\e[0;36m'
CLR_LIGHT_CYAN='\e[1;36m'
CLR_BLUE='\e[0;34m'
CLR_LIGHT_BLUE='\e[1;34m'
CLR_PURPLE='\e[0;35m'
CLR_LIGHT_PURPLE='\e[1;35m'
#
# ~/.bashrc
#


# TeXLive 2025
PATH=$PATH:/usr/local/texlive/2025/bin/x86_64-linux
export PATH=$PATH:/usr/local/texlive/2025/bin/x86_64-linux

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#######################################################=




# Expand the history size
export HISTFILESIZE=2000
export HISTSIZE=500
export HISTTIMEFORMAT="%F %T" # add timestamp to history

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Seeing as other scripts will use it might as well export it
export LINUXTOOLBOXDIR="$HOME/linuxtoolbox"

# Allow ctrl-S for history navigation (with ctrl-R)
[[ $- == *i* ]] && stty -ixon




#######################################################=


# prompt
#PS1='┌──[\u\e[1;35m@\e[0m\h \e[0;36m$PWD\e[0m] \e[2;37m\t\e[0m \n│\n└─\$~> '

PS1='┌──[\u\e[1;35m@\e[0m\h \e[0;36m\W\e[0m] \e[2;37m\t\e[0m \n│\n└─\$~> '
PS2='└─\$~> '

# alies
alias ls='eza --color=auto --icons=auto' # --group-directories-first'
alias grep='grep --color=auto'
alias ll='ls -la'
alias gvim='gamemoderun nvim'
alias home='cd ~'
alias cd..='cd ..'

[ -f "/home/martipares/.ghcup/env" ] && . "/home/martipares/.ghcup/env" # ghcup-env

#######################################################
# SPECIAL FUNCTIONS
#######################################################
# Extracts any archive(s) (if unp isn't installed)
extract() {
	for archive in "$@"; do
		if [ -f "$archive" ]; then
			case $archive in
			*.tar.bz2) tar xvjf $archive ;;
			*.tar.gz) tar xvzf $archive ;;
			*.bz2) bunzip2 $archive ;;
			*.rar) rar x $archive ;;
			*.gz) gunzip $archive ;;
			*.tar) tar xvf $archive ;;
			*.tbz2) tar xvjf $archive ;;
			*.tgz) tar xvzf $archive ;;
			*.zip) unzip $archive ;;
			*.Z) uncompress $archive ;;
			*.7z) 7z x $archive ;;
			*) echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}



# Copy and go to the directory
cpg() {
	if [ -d "$2" ]; then
		cp "$1" "$2" && cd "$2"
	else
		cp "$1" "$2"
	fi
}

# Move and go to the directory
mvg() {
	if [ -d "$2" ]; then
		mv "$1" "$2" && cd "$2"
	else
		mv "$1" "$2"
	fi
}

# Create and go to the directory
mkdirg() {
	mkdir -p "$1"
	cd "$1"
}

# Goes up a specified number of directories  (i.e. up 4)
up() {
	local d=""
	limit=$1
	for ((i = 1; i <= limit; i++)); do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

# Automatically do an ls after each cd, z, or zoxide
cd ()
{
	if [ -n "$1" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}




#######################################################

eval "$(zoxide init bash)"

#eval "$(starship init bash)"

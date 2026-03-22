


# TeXLive 2026
PATH=$PATH:/usr/local/texlive/2026/bin/x86_64-linux
export PATH=$PATH:/usr/local/texlive/2026/bin/x86_64-linux


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-you-should-use

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
#zinit snippet OMZP::aws
#zinit snippet OMZP::kubectl
#zinit snippet OMZP::kubectx
#zinit snippet OMZP::command-not-found
#zinit snippet OMZP::web-search

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey '^f' autosuggest-accept
# bindkey -e # emacs mode
# bindkey -v # vim mode
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always --icons=always --oneline $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color=always --icons=always --oneline $realpath'

# Aliases
#alias ls='ls --color'
alias ls='eza --color=auto --icons=auto --group-directories-first '
#alias vim='nvim'
alias c='clear'
alias grep='grep --color=auto'
alias ll='ls --all --long'
#alias ll='ls -la'
alias home='cd ~'
alias cd..='cd ..'
alias lib='cd run/media/martipares/library'
alias briss2='/home/martipares/projects/xi/briss_2_0/build/scriptsShadow/briss_2_0'

# Neovim
alias nvimr='/home/martipares/projects/xi/nvim-r/bin/nvim'
alias nvimd='/home/martipares/projects/xi/nvim-d/bin/nvim'
alias gvim='gamemoderun nvim'
alias gvimr='gamemoderun /home/martipares/projects/xi/nvim-r/bin/nvim'
alias gvimd='gamemoderun /home/martipares/projects/xi/nvim-d/bin/nvim'
alias nvimu='/home/martipares/projects/linux/scripts/neovim_update.sh'

[ -f "/home/martipares/.ghcup/env" ] && . "/home/martipares/.ghcup/env" # ghcup-env


# SPECIAL FUNCTIONS

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

# # Automatically do an ls after each cd, z, or zoxide
# cd ()
# {
# 	if [ -n "$1" ]; then
# 		builtin cd "$@" && ls
# 	else
# 		builtin cd ~ && ls
# 	fi
# }



# Shell integrations
eval "$(fzf --zsh)"

# eval "$(zoxide init --cmd cd zsh)"

eval "$(zoxide init zsh)"


# starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# oh-my-posh
#eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"


# prompt
# PS1='┌──[%n%F{magenta}@%f%M %F{cyan}%~%f] %*
# │
# └─ %# ~> '
# PS2='└─ %# ~> '




# PATH="/home/martipares/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/martipares/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/martipares/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/martipares/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/martipares/perl5"; export PERL_MM_OPT;

## ZSH-specific shell environment flags only relvant to interactive shells
# Variable behaviors
setopt NO_ALL_EXPORT		# Don't export all variables to environment

# Directory changing
setopt AUTO_CD			# cd to a directory if it's given without a command
setopt CDABLE_VARS		# Try to cd to variable value from ~ if no leading slash
setopt NO_AUTO_PUSHD      	# Prevent all directories from being automatically pushed onto the stack
setopt PUSHD_IGNORE_DUPS	# Directory only appears once on the stack
#setopt PUSHD_SILENT		# No non-error messages from pushd
setopt PUSHD_TO_HOME		# pushd with no arguments goes to ~

# Completion
#setopt AUTO_LIST         # (Default) Automatically list ambiguous completion choices
#setopt AUTO_MENU         # (Default) Automatically use menu completion after second completion request
#setopt AUTO_REMOVE_SLASH # (Default) Trailing / in completion is removed
setopt MENU_COMPLETE	  # Cycle through completions by completing in place
setopt NO_LIST_BEEP       # Prevent beeping on ambiguous completion

# Globbing
setopt EXTENDED_GLOB	# Allow globbing qualifiers and other extensions
# cd /a/b/c --> cd /a???/b???/c???
setopt COMPLETE_IN_WORD
setopt GLOB_DOTS	# Patterns may match without leading periods
setopt NOMATCH		# Throw error if a glob fails to match

# History behavior
export HISTSIZE=10000		# number of lines kept in history
export SAVEHIST=10000 		# number of lines saved in the history after logout
setopt INC_APPEND_HISTORY 	# append command to history file once executed
setopt HIST_IGNORE_DUPS
setopt NO_HIST_BEEP       	# Don't beep on failed history lookups
setopt HIST_IGNORE_SPACE	# Do not store lines starting with space
setopt HIST_REDUCE_BLANKS	# Trim multiple insignificant blanks
setopt NO_HIST_VERIFY		# Don't show expanded line for editing
setopt BANG_HIST		# ! style history is allowed
setopt INTERACTIVE_COMMENTS  	# Allow comments to be added; Helpful for history lookups

# Background jobs
setopt AUTO_CONTINUE    # Ensure a stopped job is continued when disowned
setopt NO_BG_NICE	# Don't lower priority of background jobs
setopt CHECK_JOBS       # Report status of background jobs when exitting a shell
setopt LONG_LIST_JOBS	# More verbose listing of jobs
setopt NOTIFY		# Notify of background job changes as soon as they happen

# Miscellaneous
setopt NO_BEEP		# Do not beep on line editor errors
setopt NO_CORRECT	# Don't suggest corrections for misspelled commands
bindkey -e          # Emacs key bindings

# Disable core dumps
limit coredumpsize 0

# Clever dot expansion
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

# antigen
source "$HOME/.antigen/antigen.zsh"

antigen use oh-my-zsh

antigen bundle common-aliases
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle command-not-found
antigen bundle history
antigen bundle history-substring-search
antigen bundle osx
antigen bundle vagrant
antigen bundle docker
antigen bundle brew
antigen bundle brew-cask
antigen bundle git
antigen bundle git-extras
antigen bundle pip
antigen bundle rsync
antigen bundle python
antigen bundle virtualenv
# unset VIRTUAL_ENV_DISABLE_PROMPT
antigen bundle lein
antigen bundle node
antigen bundle golang
antigen bundle sudo
antigen bundle npm
antigen bundle httpie
antigen bundle tmux
antigen bundle fasd
antigen bundle zsh_reload

antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle zsh-users/fizsh

#antigen theme jreese
#antigen theme pygmalion
antigen theme xueruini/oh-my-zsh-seeker-theme seeker

antigen-apply

# add brew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# auto completions
source $(brew --prefix)/share/zsh/site-functions/_aws

# GOPATH
export GOPATH=$HOME/Documents/gocode

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

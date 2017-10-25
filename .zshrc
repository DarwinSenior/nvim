# Plugins
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zstyle ':prezto:module:*' color 'yes'
zstyle ':prezto:module:*' case-sensitive 'no'
zstyle ':prezto:module:prompt' theme sorin
zstyle ':prezto:module:editor' key-bindings 'vi'

zplug "modules/bundler", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/git", from:prezto
zplug "modules/history", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/homebrew", from:prezto
zplug "modules/node", from:prezto
zplug "modules/homebrew", from:prezto

zplug "modules/prompt", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto, defer:1

zplug "modules/syntax-highlighting", from:prezto, defer:2
zplug "modules/history-substring-search", from:prezto, defer:3

zplug "b4b4r07/enhancd", use:init.sh
zplug "supercrabtree/k"

if ! zplug check; then
    zplug install
fi

zplug load

# alias and other things

[ -x "$(command -v fasd)" ] && eval "$(fasd --init auto)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias v='f -e nvim'
alias vim="nvim"
[ -x "$(command -v xdg-open)" ] && alias open="xdg-open"
alias tmux="tmux -2"

alias usbexec="sudo mount -o remount,exec"

export LANG=en_US.UTF-8
export PATH=/usr/local/opt/llvm/bin:$PATH:/usr/local/texlive/2017/bin/:$HOME/.local/bin:$HOME/workspace/flutter/bin:$HOME/.pub-cache/bin:$HOME/.luarocks/bin
export VISUAL=nvim
export EDITOR='vi'
export TERM="xterm-256color"
export PAGER='less'
export BREW_EDITOR='nvim'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export GTAGSLABEL=pygments

# use pure theme
bindkey '^ ' autosuggest-accept


###-tns-completion-start-###
if [ -f /Users/darwinsenior/.tnsrc ]; then
    source /Users/darwinsenior/.tnsrc
fi
###-tns-completion-end-###

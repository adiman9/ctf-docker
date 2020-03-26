# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export VISUAL="vim"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_CUSTOM=~/customZsh
ZSH_THEME="adrian"
DEFAULT_USER="adrian"

if [ "$TERM" = "xterm" ]; then
  export TERM=xterm-256color
fi

alias tmux='tmux -2'
alias zshrc='vim ~/.zshrc'
alias sz='. ~/.zshrc'
alias workoff='deactivate'
alias c="cd ~/code"
alias i="cd ~/infosec"
alias ctf="cd ~/ctf"

alias jtags="ctags -R . && sed -i '' -E '/^(if|switch|function|module\.exports|it|describe).+language:js$/d' tags"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export PATH=$HOME/.pyenv:$HOME/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$HOME/.rbenv/bin:$PATH"
export VIRTUALENVWRAPPER_PYTHON=~/.pyenv/shims/python
export WORKON_HOME=$HOME/.virtualenvs

export PYTHON_CONFIGURE_OPTS="--enable-shared"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

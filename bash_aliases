#!/bin/bash
alias cde='cd ~/Projects/Corndog'
alias etl='cd ~/Projects/cde-etl'
alias ios='cd ~/Projects/dealermatch_ios'
alias kbb='cd ~/Projects/kbb_service'

# Git Aliases
alias gs='git status'
alias gc='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gfpt='git fetch --prune && git fetch --tags'
alias gft='git fetch --tags'
alias gfp='git fetch --prune'
alias gdc='git diff --cached'
alias gb='git branch'
alias gl='git log'
alias gpr='git pull --rebase'
alias gp='git push'
alias gci='git commit'
alias gco='git checkout'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gac='git commit -a'
alias gca='git commit -a'
alias h='history'
alias be='bundle exec'
alias gmim='mvim'
alias pairme='sh ~/User\ Scripts/pair_me_up.sh'
alias tmux='tmuxinator start corndog'
alias bec='bundle exec cucumber'
alias ber='bundle exec rspec'
alias unhitch='hitch -u'
alias jaz="phantomjs spec/javascripts/runner.coffee http://localhost:5555/jasmine | grep -h -B3 -A1 '\(failures\|\"passed\": false\|messages\)'"
alias l='ls -ltr'
alias z='zeus'
growl() { growlnotify -n 'Terminal' -m $1; }

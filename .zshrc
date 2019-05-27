# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


source ~/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
#antigen bundle lein
#antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply


eval $(thefuck --alias)

# Aliases

alias ciproduct="docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_products lbo_engine composer install && docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_orders lbo_engine chmod -R 777 /var/www/html/lbo_symfony/lbo_services/lbo_orders/var/ /var/www/html/lbo_symfony/lbo_services/lbo_orders/vendor/ && docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_orders lbo_engine git checkout var/"
alias ciorder="docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_orders lbo_engine composer install && docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_orders chmod -R 777 /var/www/html/lbo_symfony/lbo_services/lbo_orders /var/ /var/www/html/lbo_symfony/lbo_services/lbo_orders /vendor/ && docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_orders git checkout var/"
alias ciutility="docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_utilities lbo_engine composer install && docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_utilities chmod -R 777 /var/www/html/lbo_symfony/lbo_services/lbo_utilities /var/ /var/www/html/lbo_symfony/lbo_services/lbo_utilities /vendor/ && docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_utilities git checkout var/"
alias ciuser="docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_users lbo_engine composer install && docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_users chmod -R 777 /var/www/html/lbo_symfony/lbo_services/lbo_users /var/ /var/www/html/lbo_symfony/lbo_services/lbo_users /vendor/ && docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_users git checkout var/"
alias cimailer="docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_mailer lbo_engine composer install && docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_mailer chmod -R 777 /var/www/html/lbo_symfony/lbo_services/lbo_mailer/var/ /var/www/html/lbo_symfony/lbo_services/lbo_mailer/vendor/ && docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_mailer git checkout var/"
alias cifront="docker exec -ti -w /var/www/html/lbo_symfony/lbo_apifront lbo_engine composer install && docker exec -ti -w /var/www/html/lbo_symfony/lbo_apifront lbo_engine chmod -R 777 /var/www/html/lbo_symfony/lbo_apifront/var/ /var/www/html/lbo_symfony/lbo_apifront/vendor/ && docker exec -ti -w /var/www/html/lbo_symfony/lbo_apifront lbo_engine git checkout var/"
alias ciback="docker exec -ti -w /var/www/html/lbo_symfony/lbo_apiback lbo_engine composer install && docker exec -ti -w /var/www/html/lbo_symfony/lbo_apiback lbo_engine chmod -R 777 /var/www/html/lbo_symfony/lbo_apiback/var/ /var/www/html/lbo_symfony/lbo_apiback/vendor/ && docker exec -ti -w /var/www/html/lbo_symfony/lbo_apiback lbo_engine git checkout var/"

alias puproduct="docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_products lbo_engine vendor/bin/phpunit"
alias puorder="docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_orders lbo_engine vendor/bin/phpunit"
alias puutility="docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_utilities lbo_engine vendor/bin/phpunit"
alias puuser="docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_users lbo_engine vendor/bin/phpunit"
alias pumailer="docker exec -ti -w /var/www/html/lbo_symfony/lbo_services/lbo_mailer lbo_engine vendor/bin/phpunit"
alias pufront="docker exec -ti -w /var/www/html/lbo_symfony/lbo_apifront lbo_engine vendor/bin/phpunit"
alias puback="docker exec -ti -w /var/www/html/lbo_symfony/lbo_apiback lbo_engine vendor/bin/phpunit"

alias dock="docker exec -ti -w /var/www/html/lbo_symfony$(pwd | awk -F 'lbo_symfony' '{print $2}' | awk -F 'vendor' '{print $1}') lbo_engine bash"
alias newman="./tests/newman/run.sh"
alias redoc="docker exec -ti lbo_engine sh -c '/bin/bash /home/engine/scripts/generateSwaggerJson.sh'"

alias redisFix=$'sudo docker ps -a | awk \'{ print $1,$2 }\' | grep bitnami/redis:5.0-debian-9 | awk \'{print $1 }\' | xargs -I {} docker stop {} | xargs -I {} docker rm {} && cd /var/www/docker-dev && sudo docker-compose up -d'


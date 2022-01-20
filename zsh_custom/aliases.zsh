alias ll="ls -lah"
alias tp="tapis"
alias t="task"
alias bfg="java -jar ~/.local/bin/bfg-1.13.0.jar"
alias dk="docker"
alias dkc="docker-compose"
alias c="code -r"
alias vim="nvim"
alias open="xdg-open"

# apt
alias install="sudo apt install"
alias update="sudo apt update && sudo apt upgrade"
alias remove="sudo autoremove"

md2pdf() {
  pandoc $1 -o `basename $1 .md`.pdf
}


search() {
  apt search $1 | rg $1
}


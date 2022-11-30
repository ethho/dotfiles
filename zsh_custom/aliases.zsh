alias b="bat"
alias bp="bat -p"
alias tf="terraform"
alias bfg="java -jar ~/.local/bin/bfg-1.13.0.jar"
alias dk="docker"
alias dkc="docker compose"
alias c="code -r"
alias vim="nvim"
alias open="xdg-open"
alias ls="exa --group-directories-first --header --icons --git"
alias ll="exa --long -a --group-directories-first --header --icons --git"
alias lt="exa --tree -a --group-directories-first --header --icons --git --level=3"
alias llt="exa --tree -a --group-directories-first --header --icons --git"
alias jqb="jq | bat -l json"


# apt
alias install="sudo apt install"
alias update="sudo apt update && sudo apt upgrade"
alias remove="sudo autoremove"

md2pdf() {
  dir="$(dirname ${1})"
  fname="$(basename ${1} .md).pdf"
  fp="${dir}/${fname}"
  echo ${fp}
  pandoc ${1} -o ${fp}
}


search() {
  apt search ${1} | rg -A 2 -B 2 ${1}
}

rgfs () {
  rg -B 2 -A 2 --fixed-strings -- ${1} ${PWD} 
}


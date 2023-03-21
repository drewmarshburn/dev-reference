if [[ -z $ZSH_THEME_CLOUD_PREFIX ]]; then
    ZSH_THEME_CLOUD_PREFIX='☁'
fi

function get_cluster() {
  local cluster=$(kubectl config current-context)
  echo ${cluster#*\/}
}

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

function get_spacing() {
  local gitoffset=$(git_prompt_info)
  if [ ${#gitoffset} != 0 ]; then
    ((gitoffset = ${#gitoffset} - 36))
  else
  gitoffset=0
  fi

  local dirlen=$(get_pwd)
  ((dirlen = ${#dirlen}))

  local termwidth
  ((termwidth = ${COLUMNS} - ${#$(get_cluster)} - ${#$(get_pwd)} - ${gitoffset} - 10))

  local spacing=""
  for i in {1..$termwidth}; do
    spacing="${spacing} "
  done
  echo $spacing
}

PROMPT='%F{cyan}$ZSH_THEME_CLOUD_PREFIX %F{green}$(get_pwd) %F{cyan}$(git_prompt_info) $(get_spacing)  %F{black}%K{#CC6600}$(get_cluster)%k %{$reset_color%}
➤  '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[yellow]%}⚡ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"

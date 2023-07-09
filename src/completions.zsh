_nr() {
  _arguments -C '*:: :->verbs'

  if (( CURRENT == 1 )); then
    compadd `ni-completions -s` 
    return
  fi

  parts=("${(@f)$(ni-completions -a $words[1])}")
  for i ("$parts[@]") _arguments $i
  return
}

_nun() {
  compadd `ni-completions -d`
}
 
compdef _nr nr
compdef _nun nun

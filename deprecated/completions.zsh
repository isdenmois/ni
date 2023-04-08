_nr() {
  _arguments -C '*:: :->verbs'

  if (( CURRENT == 1 )); then
    compadd `jshon -F package.json -e scripts -k` 
    return
  fi

  case "$words[1]" in
    test)
      _arguments \
        "--help[Shows a help message for this command in the console.]"
      ;;
  esac

  return 1
}

_nun() {
  compadd `jshon -F package.json -e dependencies -k -p -e devDependencies -k`
}
 
compdef _nr nr
compdef _nun nun

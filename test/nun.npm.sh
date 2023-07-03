#! /bin/sh

source ./mock/npm.sh
alias nun="../deprecated/nun.sh"

testSingleUninstall() {
  assertEquals "npm uninstall axios" "$(nun axios)"
}

testMultiple() {
  assertEquals "npm uninstall eslint @types/node" "$(nun eslint @types/node)"
}

testD() {
  assertEquals "npm uninstall eslint @types/node -D" "$(nun eslint @types/node -D)"
}

testGlobal() {
  assertEquals "npm uninstall -g eslint" "$(nun eslint -g)"
}

. /usr/share/shunit2/shunit2

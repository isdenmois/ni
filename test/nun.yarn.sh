#! /bin/sh

source ./mock/yarn.sh
alias nun="../deprecated/nun.sh"

testSingleUninstall() {
  assertEquals "yarn remove axios" "$(nun axios)"
}

testMultiple() {
  assertEquals "yarn remove eslint @types/node" "$(nun eslint @types/node)"
}

testD() {
  assertEquals "yarn remove eslint @types/node -D" "$(nun eslint @types/node -D)"
}

testGlobal() {
  assertEquals "yarn global remove eslint" "$(nun eslint -g)"
}

. /usr/share/shunit2/shunit2

#! /bin/sh

source ./mock/pnpm.sh
alias nun="../deprecated/nun.sh"

testSingleUninstall() {
  assertEquals "pnpm remove axios" "$(nun axios)"
}

testMultiple() {
  assertEquals "pnpm remove eslint @types/node" "$(nun eslint @types/node)"
}

testD() {
  assertEquals "pnpm remove -D eslint @types/node" "$(nun -D eslint @types/node)"
}

testGlobal() {
  assertEquals "pnpm remove --global eslint" "$(nun eslint -g)"
}

. /usr/share/shunit2/shunit2

#! /bin/sh

source ./mock/bun.sh
alias nun="../deprecated/nun.sh"

testSingleUninstall() {
  assertEquals "bun remove axios" "$(nun axios)"
}

testMultiple() {
  assertEquals "bun remove eslint @types/node" "$(nun eslint @types/node)"
}

testSingleUninstall() {
  assertEquals "bun remove -g eslint ni" "$(nun eslint ni -g)"
}

. /usr/share/shunit2/shunit2

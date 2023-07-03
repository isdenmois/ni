#! /bin/sh

source ./mock/pnpm.sh
alias ni="../target/release/ni"

testEmpty() {
  assertEquals "pnpm install" "$(ni)"
}

testSingleAdd() {
  assertEquals "pnpm add lodash" "$(ni lodash)"
}

testAddDev() {
  assertEquals "pnpm add -D vite" "$(ni -D vite)"
}

testMultiple() {
  assertEquals "pnpm add eslint @types/node" "$(ni eslint @types/node)"
}

. /usr/share/shunit2/shunit2

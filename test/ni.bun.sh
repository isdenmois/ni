#! /bin/sh

source ./mock/bun.sh
alias ni="../target/release/ni"

testEmpty() {
  assertEquals "bun install" "$(ni)"
}

testSingleAdd() {
  assertEquals "bun add lodash" "$(ni lodash)"
}

testAddDev() {
  assertEquals "bun add vite -d" "$(ni vite -D)"
}

testMultiple() {
  assertEquals "bun add eslint @types/node" "$(ni eslint @types/node)"
}

. /usr/share/shunit2/shunit2

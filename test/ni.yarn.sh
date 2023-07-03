#! /bin/sh

source ./mock/yarn.sh
alias ni="../target/release/ni"

testEmpty() {
  assertEquals "yarn install" "$(ni)"
}

testSingleAdd() {
  assertEquals "yarn add lodash" "$(ni lodash)"
}

testAddDev() {
  assertEquals "yarn add -D vite" "$(ni -D vite)"
}

testMultiple() {
  assertEquals "yarn add eslint @types/node" "$(ni eslint @types/node)"
}

. /usr/share/shunit2/shunit2

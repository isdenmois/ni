#! /bin/sh

source ./mock/npm.sh
alias ni="../target/release/ni"

testEmpty() {
  assertEquals "npm install" "$(ni)"
}

testSingleAdd() {
  assertEquals "npm install lodash" "$(ni lodash)"
}

testAddDev() {
  assertEquals "npm install -D vite" "$(ni -D vite)"
}

testMultiple() {
  assertEquals "npm install eslint @types/node" "$(ni eslint @types/node)"
}

testForward1() {
  assertEquals "npm install --anything" "$(ni --anything)"
}

testForward2() {
  assertEquals "npm install -a" "$(ni -a)"
}

. /usr/share/shunit2/shunit2

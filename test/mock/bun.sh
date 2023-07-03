function bun() {
    echo bun $@
}
export -f bun

oneTimeSetUp() {
    touch bun.lockb
}

oneTimeTearDown() {
    rm bun.lockb
}

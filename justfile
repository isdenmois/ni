build:
  cargo build -r

release:
  just build
  cp target/release/ni target/ni
  cp target/release/nr target/nr
  cp target/release/ni-completions target/ni-completions
  cp deprecated/nun.sh target/nun
  cp src/nit.sh target/nit
  tar -C target -czvf target/ni.tar.gz ni nr ni-completions nun nit
  rm target/ni target/nr target/ni-completions target/nun target/nit

deploy-local:
  just build
  cp target/release/ni $NI_HOME/ni
  cp target/release/nr $NI_HOME/nr
  cp target/release/ni-completions $NI_HOME/ni-completions
  cp deprecated/nun.sh $NI_HOME/nun
  cp src/nit.sh $NI_HOME/nit
  chmod +x $NI_HOME/nr $NI_HOME/ni $NI_HOME/ni-completions $NI_HOME/nun $NI_HOME/nit

benchmark:
  just build
  hyperfine "nr deploy" "./target/release/nr deploy" --warmup 10

test:
  RUSTFLAGS='--cfg simulation' cargo build -r
  cd test; ./test.sh

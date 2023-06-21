build:
  cargo build -r

release:
  just build
  cp target/release/ni target/ni
  cp target/release/nr target/nr
  cp deprecated/nun.sh target/nun
  cp src/nit.sh target/nit
  tar -C target -czvf target/ni.tar.gz ni nr nun nit
  rm target/ni target/nr target/nun target/nit

deploy-local:
  just build
  sudo cp target/release/ni /usr/local/bin/ni
  sudo cp target/release/nr /usr/local/bin/nr
  sudo cp deprecated/nun.sh /usr/local/bin/nun
  sudo cp src/nit.sh /usr/local/bin/nit
  sudo chmod +x /usr/local/bin/nr /usr/local/bin/ni /usr/local/bin/nun /usr/local/bin/nit

build:
  cargo build -r

release:
  just build
  cp target/release/ni target/ni
  cp target/release/nr target/nr
  cp deprecated/nun.sh target/nun
  tar -C target -czvf target/ni.tar.gz ni nr nun
  rm target/ni target/nr target/nun

deploy-local:
  sudo cp target/release/ni /usr/local/bin/ni
  sudo cp target/release/nr /usr/local/bin/nr
  sudo cp deprecated/nun.sh /usr/local/bin/nun
  sudo chmod +x /usr/local/bin/nr /usr/local/bin/ni /usr/local/bin/nun

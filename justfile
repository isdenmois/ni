build:
  cargo build -r

release:
  just build
  cp target/release/ni target/nr
  cp deprecated/ni.sh target/ni
  cp deprecated/nun.sh target/nun
  tar -C target -czvf target/ni.tar.gz nr ni nun
  rm target/ni target/nr target/nun

deploy-local:
  sudo cp target/release/ni /usr/local/bin/nr
  sudo cp deprecated/ni.sh /usr/local/bin/ni
  sudo cp deprecated/nun.sh /usr/local/bin/nun
  sudo chmod +x /usr/local/bin/nr /usr/local/bin/ni /usr/local/bin/nun

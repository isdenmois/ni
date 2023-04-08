build:
  cargo build -r

deploy:
  sudo cp target/release/ni /usr/local/bin/nr
  sudo cp deprecated/ni.sh /usr/local/bin/ni
  sudo cp deprecated/nun.sh /usr/local/bin/nun
  sudo chmod +x /usr/local/bin/nr /usr/local/bin/ni /usr/local/bin/nun

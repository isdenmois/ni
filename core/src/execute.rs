use std::{collections::HashMap, process::Command};

use ansi_term::{Color::Purple, Style};

pub fn execute_command(command: String, envs: HashMap<String, String>) -> i32 {
    println!(
        "{} {}",
        Purple.dimmed().paint(">"),
        Style::new().bold().dimmed().paint(&command),
    );

    let status = Command::new("sh")
        .arg("-c")
        .arg(command)
        .envs(envs)
        .status()
        .expect("failed to execute the command");

    return status.code().unwrap_or(1);
}

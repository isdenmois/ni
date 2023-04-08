use std::collections::HashMap;
use std::env;
use std::fs::read_to_string;
use std::path::PathBuf;
use std::process::{exit, Command};

use ansi_term::{
    Color::{Purple, Red},
    Style,
};
use serde_json::{Map, Value};

fn get_path_env() -> String {
    let path = PathBuf::from(env::var("PATH").unwrap_or_default());
    env::join_paths(
        [PathBuf::from("node_modules/.bin")]
            .iter()
            .chain(env::split_paths(&path).collect::<Vec<PathBuf>>().iter()),
    )
    .ok()
    .unwrap()
    .into_string()
    .unwrap()
}

fn get_command() -> (String, String) {
    let args_vec: Vec<String> = env::args().collect();
    let args: Vec<String> = args_vec[1..].to_vec();

    if args.len() > 0 {
        return (args.first().unwrap().to_owned(), args[1..].join(""));
    };

    return (String::from("start"), String::from(""));
}

struct PackageJson {
    scripts: Map<String, Value>,
    version: String,
}

fn get_package_json() -> PackageJson {
    let contents = read_to_string("package.json").expect("failed to read package.json");
    let v: Value = serde_json::from_str(&contents).expect("failed to parse package.json");

    let scripts = v["scripts"].as_object();
    let version = v["version"].as_str().unwrap_or_default();

    return PackageJson {
        scripts: scripts.unwrap_or(&Map::new()).to_owned(),
        version: version.to_string(),
    };
}

fn get_script(scripts: Map<String, Value>) -> Option<String> {
    let (command, forward) = get_command();
    let npm_script = scripts.get(command.as_str()).map(|script| {
        let script = script.as_str().map(|script| script.to_string());
        script.unwrap_or_default()
    });

    if let Some(script) = npm_script {
        let mut script = script.replace("npm run", "nr");

        if forward.len() > 0 {
            script.push_str(" ");
            script.push_str(&forward);
        }

        return Some(script);
    }

    return None;
}

fn main() {
    let package = get_package_json();

    let envs = HashMap::from([
        (String::from("PATH"), get_path_env()),
        (String::from("npm_package_version"), package.version),
    ]);

    let npm_script = get_script(package.scripts);

    if let Some(script) = npm_script {
        println!(
            "{} {}",
            Purple.dimmed().paint(">"),
            Style::new().bold().dimmed().paint(&script),
        );

        let status = Command::new("sh")
            .arg("-c")
            .arg(script)
            .envs(envs)
            .status()
            .expect("failed to execute the command");

        exit(status.code().unwrap_or(1));
    }

    println!("{}", Red.normal().paint("No script found."));
    exit(1);
}

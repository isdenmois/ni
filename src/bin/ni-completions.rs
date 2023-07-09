use std::{env, fs::read_to_string};

use serde_json::{Map, Value};

fn print_usage() {
    println!(
        "Usage: ni-completions OPTION\n\
Options: \n\
-s\t\tprints scripts keys of package.json\n\
-d\t\tprints dependencies of package.json"
    );
}

fn print_scripts(v: Value) {
    let scripts = v["scripts"].as_object().unwrap_or(&Map::new()).to_owned();

    for key in scripts.keys() {
        println!("{}", key);
    }
}

fn print_dependencies(v: Value) {
    let deps = v["dependencies"]
        .as_object()
        .unwrap_or(&Map::new())
        .to_owned();

    for key in deps.keys() {
        println!("{}", key);
    }

    let deps = v["devDependencies"]
        .as_object()
        .unwrap_or(&Map::new())
        .to_owned();

    for key in deps.keys() {
        println!("{}", key);
    }
}

fn print_arguments(script: String) {
    let contents = read_to_string(".ni.json").unwrap_or_default();
    if contents.len() == 0 {
        return;
    }

    let v: Value = serde_json::from_str(&contents).expect("failed to parse package.json");
    let scripts = v["scripts"].as_object().unwrap_or(&Map::new()).to_owned();

    if scripts.contains_key(&script) {
        let args = scripts[&script]
            .as_array()
            .unwrap_or(&Vec::new())
            .to_owned();

        for line in args {
            println!("{}", line.as_str().unwrap_or_default());
        }
    }
}

fn main() {
    let contents = read_to_string("package.json").expect("failed to read package.json");
    let v: Value = serde_json::from_str(&contents).expect("failed to parse package.json");
    let args_vec: Vec<String> = env::args().collect();

    if args_vec.len() <= 1 {
        print_usage();
        return;
    }

    match args_vec[1].as_str() {
        "-s" => print_scripts(v),
        "-d" => print_dependencies(v),
        "-a" => print_arguments(args_vec[2].to_owned()),
        _ => print_usage(),
    }
}

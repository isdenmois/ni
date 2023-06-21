use std::{collections::HashMap, env, process::exit};

use ni_core::{
    agent::get_agent,
    commands::{get_add_command, get_install_command},
    execute::execute_command,
};

fn get_args() -> Option<String> {
    let args_vec: Vec<String> = env::args().collect();
    let args: Vec<String> = args_vec[1..].to_vec();

    if args.len() > 0 {
        return Some(args.join(" "));
    };

    return None;
}

fn main() {
    let agent = get_agent();
    let args = get_args();

    let command = match args {
        Some(args) => get_add_command(agent, args),
        None => get_install_command(agent),
    };

    let code = execute_command(command, HashMap::from([]));

    exit(code);
}

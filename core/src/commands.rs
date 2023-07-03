use crate::agent::Agent;

pub fn get_install_command(agent: Agent) -> String {
    match agent {
        Agent::PNPM => String::from("pnpm install"),
        Agent::Bun => String::from("bun install"),
        Agent::Yarn => String::from("yarn install"),
        Agent::NPM => String::from("npm install"),
    }
}

pub fn get_add_command(agent: Agent, args: String) -> String {
    let mut command = match agent {
        Agent::PNPM => String::from("pnpm add"),
        Agent::Bun => String::from("bun add"),
        Agent::Yarn => String::from("yarn add"),
        Agent::NPM => String::from("npm install"),
    };
    let mut args = args;

    if agent == Agent::Bun {
        args = args.replace("-D", "-d");
    }

    command.push(' ');
    command.push_str(&args);

    return command;
}

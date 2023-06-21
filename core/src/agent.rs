use std::path::Path;

#[derive(PartialEq)]
pub enum Agent {
    Bun,
    NPM,
    PNPM,
    Yarn,
}

pub fn get_agent() -> Agent {
    if Path::new("pnpm-lock.yaml").exists() {
        return Agent::PNPM;
    }

    if Path::new("bun.lockb").exists() {
        return Agent::Bun;
    }

    if Path::new("yarn.lock").exists() {
        return Agent::Yarn;
    }

    return Agent::NPM;
}

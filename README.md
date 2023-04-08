# ni
Uses the package manager used in the project


## Installation

[Download a release](https://github.com/isdenmois/ni/releases) and copy it to `/usr/local/bin`

## `ni`

Installs packages using the right package manager.

```bash
ni

# npm install
# yarn install
# pnpm install
# bun install
```

```bash
ni vitest

# npm i vitest
# yarn add vitest
# pnpm add vitest
# bun add vitest
```

```bash
ni @types/node -D

# npm i -D @types/node
# yarn add -D @types/node
# pnpm add -D @types/node
# bun add -d @types/node
```

## `nr`
Runs the script from package.json.

Instead of waiting 200ms for your npm client to start, it will start immediately.

Benchmark (`hyperfine "nr deploy" "npm run deploy" --warmup 10`):

| Command       |   Mean [ms] | Min [ms] | Max [ms] |    Relative |
| :------------ | ----------: | -------: | -------: | ----------: |
| `nr deploy`     |  4.1 ± 0.2 |     3.8 |     4.9 |        1.00 |
| `npm run deploy` | 1160.0 ± 4.0 |    1155.0 |    1168.0 | 281.68 ± 14.02 |


### Usage
```bash
nr dev --port=3000 # runs the "dev" script and forwards the port to the command
```

```bash
nr # runs the "start" script
```

## `nun`
Unistalls packages using the right package manager.

```bash
nun webpack

# npm uninstall webpack
# yarn remove webpack
# pnpm remove webpack
# bun remove webpack
```

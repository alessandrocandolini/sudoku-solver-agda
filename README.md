[![CI](https://github.com/alessandrocandolini/sudoku-solver-agda/actions/workflows/ci.yml/badge.svg)](https://github.com/alessandrocandolini/sudoku-solver-agda/actions/workflows/ci.yml)

# sudoku-solver-agda

Agda implementation of a simple Sudoku solver using equational reasoning in the spirit of [Richard Bird](https://en.wikipedia.org/wiki/Richard_Bird_(computer_scientist)) see
* https://www.cs.tufts.edu/~nr/cs257/archive/richard-bird/sudoku.pdf)

## Compile

Assuming Agda is available (see Installation section),
```bash
agda --compile sudoku-solver-agda.agda
```

The `--compile` flag creates via the GHC backend a binary file in the top-level folder that can be executed:
```bash
./sudoku-solver-agda
```

## Install Agda

If using [nix](https://nixos.org/), a [shell.nix](shell.nix) file is provided as part of the repo that will make Agda and it's standard library available in a ephemeral nix shell. Just `cd` into the project and type
```bash
nix-shell
```
(The same can be automated using `direnv`.)

It's also possible to compile directly through nix
```bash 
nix-shell --pure --run "agda --compile sudoku-solver-agda.agda"
```

The latter is exactly the command executed on the CI (see CI/CD section).

See the [Agda official guide](https://agda.readthedocs.io/en/latest/getting-started/installation.html) for other installation options.

## CI/CD

This project uses github actions to ensure at every commit the agda files are compiled.

While Github Actions to work with Agda are available --- see [setup-agda](https://github.com/wenkokke/setup-agda) for example ---  in order to make local and remote compilation more consistent and aligned, nix has been used for the CI

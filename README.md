[![CI](https://github.com/alessandrocandolini/sudoku-solver-agda/actions/workflows/ci.yml/badge.svg)](https://github.com/alessandrocandolini/sudoku-solver-agda/actions/workflows/ci.yml)

# sudoku-solver-agda

Agda implementation of a simple Sudoku solver using equational reasoning in the spirit of Richard Bird. See Bird's original paper for an Haskell implementation: 
* https://www.cs.tufts.edu/~nr/cs257/archive/richard-bird/sudoku.pdf

## Why Agda

My personal interest in exploring how to port Bird's ideas to Agda steams from two main reasons:
* I've always been dissatisfied with the unprecise signatures and type modelling used in the original solution. For example, Bird's solution in Haskell uses generic lists of lists `[[a]]` to represent the grid (leaving room for inconsistent number of lines and columns), it employs `Char` to represent the content (leaving open the possibility to have all sort of alphanumeric content in each cell), the signature of the method to solve the Sudoku is `sudoku :: Grid -> [Grid]` which does not even convey the fact that the resulting solution should at least be without blank spaces, etc.
* Agda gives the opportunity to formally verify all the equational reasoning that Bird uses to optimise the solution

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

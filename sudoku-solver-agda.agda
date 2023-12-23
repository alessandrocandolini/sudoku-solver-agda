{-# OPTIONS --guardedness #-}

module sudoku-solver-agda where

open import IO
open import Agda.Builtin.String
open import Logic

name : Greeting -> String
name _ = "hello, Agda"

main : Main
main = run (putStrLn (name greet))

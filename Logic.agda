module Logic where

data Greeting : Set where
  hello : Greeting

greet : Greeting
greet = hello

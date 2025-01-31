module Nat where

data Nat : Set where
  zero : Nat
  suc : Nat → Nat

plus : Nat → Nat → Nat
plus zero n = n
plus (suc m) n = suc (plus m n)

times : Nat → Nat → Nat
times zero n = zero
times (suc m) n = plus n (times m n)
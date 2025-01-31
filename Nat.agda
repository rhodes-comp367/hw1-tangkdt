module Nat where

data Nat : Set where
  zero : Nat
  suc : Nat → Nat

plus : Nat → Nat → Nat
-- 0 + n = n 
plus zero n = n
-- m + 1 + n = (m + n) + 1
plus (suc m) n = suc (plus m n)

times : Nat → Nat → Nat
-- 0 * n = 0
times zero n = zero
-- (m + 1) * n = n + (m * n)
times (suc m) n = plus n (times m n)
module Int2 where

-- import `plus` & `times` on Nats;
-- use these functions where appropriate below.
open import Nat

data Int : Set where
  -- (+ n) represents positive n.
  + : Nat → Int
  -- (- n) represents negative n.
  - : Nat → Int
  -- 0 can be represented as (+ zero) or (- zero).

-- given i, return i + 1.
isuc : Int → Int
isuc (+ n) = + (suc n)
isuc (- zero) = + (suc zero)
isuc (- (suc n)) = - n

-- given i, return i - 1.
ipred : Int → Int
ipred (+ zero) = + zero
ipred (+ (suc x)) = + x
ipred (- x) = - (suc x)

-- given i, return -i.
ineg : Int → Int
ineg (+ x) = - x
ineg (- x) = + x

-- given i & j, return i + j.
iplus : Int → Int → Int
iplus (+ a) (+ zero) = + a
iplus (- a) (+ zero) = - a
iplus (+ zero) (+ a) = + a
iplus (+ zero) (- a) = - a
iplus (+ a) (+ b) = + (plus a b)
iplus (- a) (- b) = - (plus a b)
iplus (- a) (+ (suc b)) = isuc(iplus (- a) (+ b))
iplus (+ (suc a)) (- b) = isuc(iplus (+ a) (- b))

-- given i & j, return i - j.
iminus : Int → Int → Int
iminus (- a) (+ b) = iplus (- a) (- b)
iminus (+ a) (- b) = iplus (+ a) (+ b)
iminus (+ a) (+ b) = iplus (+ a) (- b)
iminus (- a) (- b) = iplus (- a) (+ b)

-- given i & j, return i * j.
itimes : Int → Int → Int
itimes (+ zero) x = + zero
itimes x (+ zero) = + zero
itimes (+ a) (+ b) = + (times a b)
itimes (- a) (- b) = + (times a b)
itimes (- a) (+ b) = - (times a b)
itimes (+ a) (- b) = - (times a b)
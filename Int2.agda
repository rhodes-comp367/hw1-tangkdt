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

-- Given i, return i + 1
isuc : Int → Int
-- i + 1 = + (n + 1)
isuc (+ n) = + (suc n)
-- i + 1 = - 0 + 1 = + 1 
isuc (- zero) = + (suc zero)
-- i + 1 = - (n + 1) + 1 = - n - 1 + 1 = - n
isuc (- (suc n)) = - n

-- Given i, return i - 1
ipred : Int → Int
-- i - 1 = + 0 - 1 = - 1
ipred (+ zero) = - (suc zero)
-- i - 1 = + (x + 1) - 1 = + x
ipred (+ (suc x)) = + x
-- i - 1 = - x - 1 = - (x + 1)
ipred (- x) = - (suc x)

-- Given i, return -i
ineg : Int → Int
-- - i = - (+ x) = - x
ineg (+ x) = - x
-- - i = - (- x) = + x 
ineg (- x) = + x

-- Given i & j, return i + j
iplus : Int → Int → Int
-- i + j = + a + 0 = + a 
iplus (+ a) (+ zero) = + a
-- i + j = - a + 0 = - a
iplus (- a) (+ zero) = - a
-- i + j = 0 + b = + b
iplus (+ zero) (+ b) = + b
-- i + j = 0 - b = - b
iplus (+ zero) (- b) = - b
-- i + j = + a + b = + (a + b)
iplus (+ a) (+ b) = + (plus a b)
-- i + j = - a + - b = - (a + b)
iplus (- a) (- b) = - (plus a b)
-- i is added j times recursively
iplus (- a) (+ (suc b)) = isuc(iplus (- a) (+ b))
-- j is added i times recursively
iplus (+ (suc a)) (- b) = isuc(iplus (+ a) (- b))

-- Given i & j, return i - j
iminus : Int → Int → Int
-- i - j = - a - b 
iminus (- a) (+ b) = iplus (- a) (- b)
-- i - j = a - - b = a + b 
iminus (+ a) (- b) = iplus (+ a) (+ b)
-- i - j = a - b
iminus (+ a) (+ b) = iplus (+ a) (- b)
-- i - j = - a - - b = - a + b 
iminus (- a) (- b) = iplus (- a) (+ b)

-- Given i & j, return i * j
itimes : Int → Int → Int
-- i * j = 0 * x = 0 
itimes (+ zero) x = + zero
-- i * j = x * 0 = 0
itimes x (+ zero) = + zero
-- i * j = a * b = a * b
itimes (+ a) (+ b) = + (times a b)
-- i * j = - a * - b = a * b 
itimes (- a) (- b) = + (times a b)
-- i * j = - a * b = - (a * b)
itimes (- a) (+ b) = - (times a b)
-- i * j = a * - b = - (a * b) 
itimes (+ a) (- b) = - (times a b) 
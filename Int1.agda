module Int1 where

-- imports `plus` & `times` from Nats
open import Nat

data Int : Set where
  -- int a b represents (a - b)
  int : Nat → Nat → Int

-- Given i, return i + 1
isuc : Int → Int
-- i + 1 = (a - b) + 1 = (a + 1) - b
isuc (int a b) = int (suc a) b 

-- Given i, return i - 1
ipred : Int → Int
-- i - 1 = (a - b) - 1 = a - (b + 1)
ipred (int a b) = int a (suc b) 

-- Given i, return -i
ineg : Int → Int
-- -i = -(a - b) = -a + b = b - a 
ineg (int a b) = int b a 

-- Given i & j, return i + j
iplus : Int → Int → Int
-- i + j = (a - b) + (c - d) = (a + c) - b - d = (a + c) - (b + d)
iplus (int a b) (int c d) = int (plus a c) (plus c d) 

-- Given i & j, return i - j
iminus : Int → Int → Int
-- i - j = (a - b) - (c - d) = a - b - c + d = (a + d) - b - c = (a + d) - (b + c)
iminus (int a b) (int c d) = int (plus a d) (plus b c) 

-- Given i & j, return i * j
itimes : Int → Int → Int
-- i * j = (a - b) (c - d) = ac - ad - bc + bd = (ac + bd) - ad - bc = (ac + bd) - (ad + bc) 
itimes (int a b) (int c d) = int (plus (times a c) (times b d)) (plus (times a d) (times b c))


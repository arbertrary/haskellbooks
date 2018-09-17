module Learn where

import Data.Char
import Data.List.Split

test x = x ++ "1"

rvrs :: String -> String
rvrs x = concat $ zipWith (++) [" ", " ", " "] (reverse $ splitOn " " x)

data DayOfWeek
  = Mon
  | Tue
  | Weds
  deriving (Ord, Show)

data Date =
  Date DayOfWeek
       Int

instance Eq DayOfWeek where
  (==) Mon Mon = True
  (==) Tue Tue = True
  (==) Weds Weds = True
  (==) _ _ = False

data TisAnInteger =
  TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn a) (TisAn b) = (==) a b

data Tuple a b =
  Tuple a
        b

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple a b) (Tuple c d) = a == c && b == d

data EitherOr a b
  = Hello a
  | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello a) (Hello b) = a == b
  (==) (Goodbye a) (Goodbye b) = a == b
  (==) _ _ = False

isItTwo :: Integer -> Bool
isItTwo 2 = True

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib x = fib (x - 1) + fib (x - 2)

f :: String -> Char
f = toUpper . head

data Id a =
  MkId a
  deriving (Eq, Show)

data Product a b =
  Product a
          b
  deriving (Eq, Show)

data Sum a b
  = First a
  | Second b
  deriving (Eq, Show)

data RecordProduct a b = RecordProduct
  { pfirst :: a
  , psecond :: b
  } deriving (Eq, Show)

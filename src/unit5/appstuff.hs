module Appstuff where

doorPrize :: [Int]
doorPrize = [1000, 2000, 3000]

boxPrize :: [Int -> Int]
boxPrize = [(10 *), (50 *)]

totalPrize :: [Int]
totalPrize = boxPrize <*> doorPrize

primesToN :: Integer -> [Integer]
primesToN n = filter isNotComposite twoThroughN
  where
    twoThroughN = [2 .. n]
    composite = pure (*) <*> twoThroughN <*> twoThroughN
    isNotComposite = not . (`elem` composite)

data User = User
  { name :: String
  , gamerID :: Int
  , score :: Int
  } deriving (Show)

testNames :: [String]
testNames =
  [ "John Smith"
  , "Robert'); DROP TABLE Students;--"
  , "Christina NULL"
  , "Randall Munroe"
  ]

testIds :: [Int]
testIds = [1337, 0123, 999999]

testScores :: [Int]
testScores = [0, 100000, -99999]

testData :: [User]
testData = pure User <*> testNames <*> testIds <*> testScores

allFmap :: Applicative f => (a -> b) -> f a -> f b
allFmap func app = pure func <*> app

example :: Int
example = (*) ((+) 2 4) 6

exampleMaybe :: Maybe Int
exampleMaybe = pure (*) <*> (pure (+) <*> pure 2 <*> pure 4) <*> pure 6

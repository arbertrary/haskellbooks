module Lazy_sum where

import Data.List.Split
import qualified Data.Text as T

-- main :: IO ()
-- main = do
--   userInput <- getContents
--   let numbers = toInts userInput
--   print (sum $ map (^ 2) numbers)
myLines = splitOn "\n"

toInts :: String -> [Int]
toInts = map read . lines

quotes :: [String]
quotes = ["quote 1", "quote 2", "quote 3", "quote 4", "quote 5"]

lookupQuote :: [String] -> [String]
lookupQuote [] = []
lookupQuote ("n":xs) = []
lookupQuote (x:xs) = quote : (lookupQuote xs)
  where
    quote = quotes !! (read x - 1)

main :: IO ()
main = do
  putStrLn "Which quote"
  userInput <- getContents
  mapM_
    (putStrLn . (++ "\nAnother one? [number/n]"))
    (lookupQuote (lines userInput))

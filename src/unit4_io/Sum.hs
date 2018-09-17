module Sum where

import Control.Monad
import System.Environment

exampleMain :: IO ()
exampleMain = do
  vals <- mapM (\_ -> getLine) [1 .. 3]
  mapM_ putStrLn vals

main :: IO ()
main = do
  args <- getArgs
  let linesToRead =
        if length args > 0
          then read (head args)
          else 0 :: Int
  numbers <- replicateM linesToRead getLine
  let ints = map read numbers :: [Int]
  print (sum ints)

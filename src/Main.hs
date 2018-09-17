module Main where

import           Control.Monad (forever)
import           Data.Char     (toLower)
import           Data.List     (intersperse)
import           Data.Maybe    (isJust)
import           Learn
import           System.Exit   (exitSuccess)
import           System.Random (randomRIO)

main :: IO ()
main = do
  putStrLn "hello world"
  putStrLn "test"
  putStrLn  $ test "asdf"

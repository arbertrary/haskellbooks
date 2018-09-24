-- {-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Monad (forever)
import Data.Char (toLower)
import Data.List (intersperse)
import Data.Maybe (isJust)
import Data.Text as T
import Data.Text.IO as TIO
import Palindrome
import System.Exit (exitSuccess)
import System.Random (randomRIO)

main :: IO ()
main = do
  print "Enter a word and I'll let you know if it's a palindrome!"
  text <- TIO.getLine
  let response =
        if isPalindrome text
          then "it is!"
          else "it's not!"
  TIO.putStrLn response

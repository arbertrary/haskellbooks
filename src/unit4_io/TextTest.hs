{-# LANGUAGE OverloadedStrings #-}

module TextTest where

import Data.Semigroup
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import System.Environment
import System.IO

aWord :: T.Text
aWord = "Cheese"

main :: IO ()
main = do
  print $ aWord <> "test"
  print $ T.unlines ["Test", "test"]
  print $ T.intercalate "a" ["Test", "test"]

-- unlines: list of text to \n-separated Text 
unlineify :: [T.Text] -> T.Text
unlineify = T.intercalate "\n"

-- lines: \n separated text to list
lineify :: T.Text -> [T.Text]
lineify = T.splitOn "\n"

helloPerson :: T.Text -> T.Text
helloPerson name = "Hello " <> name <> "!"

hello :: IO ()
hello = do
  TIO.putStrLn "Give name"
  name <- TIO.getLine
  TIO.putStrLn $ helloPerson name

-- 24.4 strict I/O
getCounts :: T.Text -> (Int, Int, Int)
getCounts input = (charCount, wordCount, lineCount)
  where
    charCount = T.length input
    wordCount = (length . T.words) input
    lineCount = (length . T.lines) input

countsText :: (Int, Int, Int) -> T.Text
countsText (cc, wc, lc) =
  T.pack
    (unwords ["chars: ", show cc, " words: ", show wc, " lines: ", show lc])

mainT :: IO ()
mainT = do
  args <- getArgs
  let fileName = head args
  input <- TIO.readFile fileName
  let summary = (countsText . getCounts) input
  TIO.appendFile "stats.dat" (mconcat [(T.pack fileName), " ", summary, "\n"])
  TIO.putStrLn summary

cp :: FilePath -> FilePath -> IO ()
cp src dest = do
  input <- TIO.readFile src
  TIO.writeFile dest input

capitalize :: FilePath -> IO ()
capitalize fileName = do
  input <- TIO.readFile fileName
  TIO.writeFile fileName (T.toUpper input)

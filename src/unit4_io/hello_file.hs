module Hello_file where

import qualified Data.Char as Char
import System.IO

main :: IO ()
main = do
  helloFile <- openFile "hello.txt" ReadMode
  firstLine <- hGetLine helloFile
  putStrLn firstLine
  secondLine <- hGetLine helloFile
  goodbyeFile <- openFile "goodbye.txt" WriteMode
  hPutStrLn goodbyeFile secondLine
  hClose goodbyeFile
  hClose helloFile
  putStrLn "done!"

cp :: String -> String -> IO ()
cp src dest = do
  file <- openFile src ReadMode
  input <- hGetContents file
  appendFile dest input
  hClose file

capitalize :: String -> IO ()
capitalize fname = do
  file <- openFile fname ReadMode
  input <- hGetContents file
  let cap = map Char.toUpper input
  putStrLn cap
  hClose file
  writeFile fname cap

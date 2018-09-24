import Data.Char (isPunctuation)
import qualified Data.Text as T
import Palindrome
import Test.QuickCheck
import Test.QuickCheck.Instances

main :: IO ()
main = do
  quickCheckWith stdArgs {maxSuccess = 1000} prop_punctuationInvariant
  putStrLn "done!"
  -- putStrLn "Running tests..."
  -- assert (isPalindrome "racecar") "passed 'racecar'" "FAIL: 'racecar'"
  -- assert (isPalindrome "racecar!") "passed 'racecar!'" "FAIL: 'racecar!'"
  -- assert ((not . isPalindrome) "cat") "passed 'cat'" "FAIL: 'cat'"
  -- assert (isPalindrome "racecar.") "passed 'racecar.'" "FAIL: 'racecar.'"
  -- putStrLn "done!"

assert :: Bool -> String -> String -> IO ()
assert test passStatement failStatement =
  if test
    then putStrLn passStatement
    else putStrLn failStatement

prop_punctuationInvariant text = preprocess text == preprocess noPuncText
  where
    noPuncText = T.filter (not . isPunctuation) text

prop_reverseInvariant text =
  isPalindrome text == (isPalindrome (T.reverse text))

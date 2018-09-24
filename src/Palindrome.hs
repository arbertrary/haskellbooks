-- {-# LANGUAGE OverloadedStrings #-}
module Palindrome
  ( isPalindrome
  , preprocess
  ) where

import Data.Char (isPunctuation, isSpace, toLower)
import qualified Data.Text as T

stripWhiteSpace :: T.Text -> T.Text
stripWhiteSpace text = T.filter (not . isSpace) text

stripPunctuation :: T.Text -> T.Text
stripPunctuation text = T.filter (not . isPunctuation) text

-- toLowerCase :: T.Text -> T.Text
-- toLowerCase text = map toLower text
preprocess :: T.Text -> T.Text
preprocess = stripWhiteSpace . stripPunctuation . T.toLower

isPalindrome :: T.Text -> Bool
isPalindrome text = cleanText == T.reverse cleanText
  where
    cleanText = preprocess text

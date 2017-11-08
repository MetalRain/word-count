module Lib
    ( wordCount
    ) where

import Prelude hiding (words)
import Data.Text.Lazy (Text, words)
import Data.Map.Lazy (Map, insertWith, toList, fromList)
import Data.List (sortBy)

accWord :: Map Text Integer -> Text -> Map Text Integer
accWord map word = insertWith (+) word 1 map

swap :: (a,b) -> (b,a)
swap (a,b) = (b,a)

wordCount :: Text -> [(Integer, Text)]
wordCount text = sorted where
  splits  = words text
  wordMap = foldl accWord (fromList []) splits
  counts  = map swap $ toList wordMap
  sorted  = sortBy (\(a,_) (b,_) -> (flip compare) a b) counts
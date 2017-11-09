module Lib
    ( wordCount
    ) where

import Prelude hiding (words)
import Data.Text.Lazy (Text, words)
import Data.Map.Lazy (Map, insertWith, toList, fromList)
import Data.List (sortBy)
import Data.Tuple (swap)

accWord :: Map Text Integer -> Text -> Map Text Integer
accWord map word = insertWith (+) word 1 map

wordCount :: Text -> [(Integer, Text)]
wordCount text = sorted where
  wordMap = foldl accWord (fromList []) $  words text
  counts  = map swap $ toList wordMap
  sorted  = sortBy (\(a,_) (b,_) -> (flip compare) a b) counts
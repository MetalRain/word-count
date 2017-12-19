module Main where

import Prelude hiding (readFile, words)
import Data.Text.Lazy (Text, words)
import Data.Text.Lazy.IO (readFile)
import Data.Map.Lazy (Map, insertWith, toList, fromList)
import Data.List (sortBy)
import Data.Tuple (swap)

file :: FilePath
file = "../data/t8.shakespeare.txt"

accWord :: Map Text Integer -> Text -> Map Text Integer
accWord map word = insertWith (+) word 1 map

wordCount :: Text -> [(Integer, Text)]
wordCount text = sorted where
  wordMap = foldl accWord (fromList []) $  words text
  counts  = map swap $ toList wordMap
  sorted  = sortBy (\(a,_) (b,_) -> (flip compare) a b) counts

printResult :: (Integer, Text) -> String
printResult (c, w) = show c ++ ": " ++ show w

main :: IO ()
main = do
  t <- readFile file
  mapM_ (putStrLn . printResult) $ take 100 $ wordCount t

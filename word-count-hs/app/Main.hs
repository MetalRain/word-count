module Main where

import Prelude
import Data.Map.Lazy (Map, insertWith, toList, fromList)
import Data.List (sortBy)
import Data.Tuple (swap)

file :: FilePath
file = "../data/t8.shakespeare.txt"

accWord :: Map String Integer -> String -> Map String Integer
accWord map word = insertWith (+) word 1 map

wordCount :: String -> [(Integer, String)]
wordCount text = sorted where
  wordMap = foldl accWord (fromList []) $  words text
  counts  = map swap $ toList wordMap
  sorted  = sortBy (\(a,_) (b,_) -> (flip compare) a b) counts

printResult :: (Integer, String) -> String
printResult (c, w) = show c ++ ": " ++ w

main :: IO ()
main = do
  t <- readFile file
  mapM_ (putStrLn . printResult) $ take 100 $ wordCount t

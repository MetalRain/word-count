module Main where

import Prelude hiding (readFile)
import Lib (wordCount)
import Data.Text.Lazy.IO (readFile)

file :: FilePath
file = "../data/t8.shakespeare.txt"

main :: IO ()
main = do
  t <- readFile file
  putStrLn $ show $ take 100 $ wordCount t

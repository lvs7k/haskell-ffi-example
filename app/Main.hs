module Main where

import Control.Monad
import Foreign.Marshal.Utils

import Person

main :: IO ()
main = do
  with (Person "lvs7k" 30) $ \p -> c_showPerson p

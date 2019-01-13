{-# LANGUAGE ForeignFunctionInterface #-}

module Person where

import Foreign
import Foreign.C

#include "person.h"

data Person = Person
  { name :: !String
  , age  :: !Int
  } deriving (Eq, Show)

instance Storable Person where
  sizeOf _ = #{size Person}
  alignment _ = #{alignment Person}
  peek ptr = do
    cname <- #{peek Person, name} ptr
    cage <- #{peek Person, age} ptr
    name <- peekCString cname
    return (Person name cage)
  poke ptr (Person n a) = do
    withCString n $ \cname -> do
      #{poke Person, name} ptr cname
      #{poke Person, age} ptr a

foreign import ccall unsafe "showPerson"
  c_showPerson :: Ptr Person -> IO ()
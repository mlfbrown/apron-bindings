{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE ForeignFunctionInterface #-}
module Apron.Var where
import           Foreign
import           Foreign.C
import Foreign.Ptr
import Foreign.C.String
import Foreign.Marshal.Alloc
import Foreign.Marshal.Array    

#include "ap_var.h"

{#pointer *ap_var_t as Var foreign newtype#}

{#pointer *ap_var_operations_t as VarOps foreign newtype#}

-- https://stackoverflow.com/questions/43561936/convert-a-list-of-strings-to-a-c-array-in-haskell
makeVarArray :: [String] -> IO (Ptr CString)
makeVarArray arr = newArray =<< traverse newCString arr
                       
freeVarArray :: Int -> Ptr CString -> IO ()
freeVarArray n ptr = do
  strs <- peekArray n ptr
  traverse free strs
  free ptr


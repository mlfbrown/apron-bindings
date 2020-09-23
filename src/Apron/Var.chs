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
#include "wrappers.h" 

{#pointer *ap_var_t as Var foreign newtype#}

{#pointer *ap_var_operations_t as VarOps foreign newtype#}

{#fun make_var as ^ { `CString' } -> `Var' #}

{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE ForeignFunctionInterface #-}
module Apron.Var where
import Foreign.C.String

#include "ap_var.h"
#include "wrappers.h" 

{#pointer *ap_var_t as Var foreign newtype#}

{#pointer *ap_var_operations_t as VarOps foreign newtype#}

{#fun make_var as ^ { `CString' } -> `Var' #}

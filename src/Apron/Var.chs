{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE ForeignFunctionInterface #-}
module Apron.Var where
import           Foreign
import           Foreign.C

#include "ap_var.h"

{#pointer *ap_var_t as Var foreign newtype#}

{#pointer *ap_var_operations_t as VarOps foreign newtype#}


    

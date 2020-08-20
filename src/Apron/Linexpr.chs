{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE StandaloneDeriving       #-}
module Apron.Linexpr where
import           Foreign.C

{# import Apron.Environment #}
{# import Apron.Coeff #}
    
#include "ap_linexpr1.h"
#include "ap_linexpr0.h" 
#include "wrappers.h"

{# enum define LinexprDescrip {
  AP_LINEXPR_DENSE as LINEXPR_DENSE,
  AP_LINEXPR_SPARSE as LINEXPR_SPARSE
} deriving (Eq, Ord, Show) #}

 
{#pointer *ap_linexpr1_t as Linexpr foreign newtype#}

-- Memory management and printing

{#fun ap_linexpr1_make_wrapper as ^ { `Environment', `LinexprDescrip', `CULong' } -> `Linexpr' #}

{# fun ap_linexpr1_free as ^ { `Linexpr' } -> `()' #}

{#fun ap_linexpr1_minimize as ^ { `Linexpr' } -> `()' #}

{#fun ap_linexpr1_clear as ^ { `Linexpr' } -> `()' #}

-- Tests

{#fun ap_linexpr1_is_integer as ^ { `Linexpr' } -> `Bool' #}

{#fun ap_linexpr1_is_real as ^ { `Linexpr' } -> `Bool' #}

{#fun ap_linexpr1_is_linear as ^ { `Linexpr' } -> `Bool' #}

{#fun ap_linexpr1_is_quasilinear as ^ { `Linexpr' } -> `Bool' #}

-- Access

{#fun ap_linexpr1_envref as ^ { `Linexpr' } -> `Environment' #}

{#fun ap_linexpr1_cstref as ^ { `Linexpr' } -> `Coeff' #}

{#fun ap_linexpr1_get_cst as ^ { `Coeff', `Linexpr' } -> `()' #}








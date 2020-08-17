{-# LANGUAGE StandaloneDeriving #-}
module Apron.Scalar where
import           Foreign
import           Foreign.C
import           Foreign.Ptr

#include "ap_scalar.h"

{#pointer *ap_scalar_t as Scalar foreign newtype#}

{# enum define ScalarDisc {
  AP_SCALAR_DOUBLE as SCALAR_DOUBLE,
  AP_SCALAR_MPQ as SCALAR_MPQ,
  AP_SCALAR_MPFR as SCALAR_MPFR    
} deriving (Eq, Ord, Show) #}

-- Basics

{#fun ap_scalar_alloc as ^ { } -> `Scalar' #}

{#fun ap_scalar_free as ^ { `Scalar' } -> `()' #}

{#fun ap_scalar_print as ^ { `Scalar' } -> `()' #}

{#fun ap_scalar_swap as ^ { `Scalar', `Scalar' } -> `()' #}  

-- Assignments 
           
{#fun ap_scalar_set as ^ { `Scalar', `Scalar' } -> `()' #}

{#fun ap_scalar_set_int as ^ { `Scalar', `CLong' } -> `()' #}

{#fun ap_scalar_set_double as ^ { `Scalar', `CDouble' } -> `()' #}
 
{#fun ap_scalar_set_infty as ^ { `Scalar', `CInt' } -> `()' #}

                                                       
-- Combined allocations and assignments

{#fun ap_scalar_alloc_set as ^ { `Scalar' } -> `Scalar' #}

{#fun ap_scalar_alloc_set_double as ^ { `CDouble' } -> `Scalar' #}

-- Conversions



-- Other operations 

{#fun ap_scalar_neg as ^ { `Scalar', `Scalar' } -> `()' #}

{#fun ap_scalar_inv as ^ { `Scalar', `Scalar' } -> `()' #}

{#fun ap_scalar_hash as ^ { `Scalar' } -> `CLong' #}
 

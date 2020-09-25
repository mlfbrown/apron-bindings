{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE StandaloneDeriving       #-}
module Apron.Coeff where
import Foreign.C

{# import Apron.Scalar #}
{# import Apron.Interval #}    
    
#include "ap_coeff.h"

{#pointer *ap_coeff_t as Coeff foreign newtype#}

{# enum define CoeffDiscr {
  AP_COEFF_SCALAR as COEFF_SCALAR,
  AP_COEFF_INTERVAL as COEFF_INTERVAL 
} deriving (Eq, Ord, Show) #}

-- Basics

{#fun ap_coeff_alloc as ^ { `CoeffDiscr' } -> `Coeff' #}

{#fun ap_coeff_free as ^ { `Coeff' } -> `()' #}

{#fun ap_coeff_print as ^ { `Coeff' } -> `()' #} 

{#fun ap_coeff_reduce as ^ { `Coeff' } -> `()' #}

-- Combined allocation and assignment

{#fun ap_coeff_alloc_set_scalar as ^ { `Scalar' } -> `Coeff' #}

{#fun ap_coeff_alloc_set_interval as ^ { `Interval' } -> `Coeff' #}

{#fun ap_coeff_alloc_set as ^ { `Coeff' } -> `Coeff' #}

-- Assignments

{#fun ap_coeff_set as ^ { `Coeff', `Coeff' } -> `()' #}

{#fun ap_coeff_set_scalar as ^ { `Coeff', `Scalar' } -> `()' #}

{#fun ap_coeff_set_scalar_int as ^ { `Coeff', `CLong' } -> `()' #}

{#fun ap_coeff_set_scalar_frac as ^ { `Coeff', `CLong', `CULong' } -> `()' #}
                                                        
{#fun ap_coeff_set_scalar_double as ^ { `Coeff', `Double' } -> `()' #}

{#fun ap_coeff_set_interval as ^ { `Coeff', `Interval' } -> `()' #}

{#fun ap_coeff_set_interval_scalar as ^ { `Coeff', `Scalar', `Scalar' } -> `()' #}

{#fun ap_coeff_set_interval_int as ^ { `Coeff', `CLong', `CLong' } -> `()' #}

{#fun ap_coeff_set_interval_frac as ^ { `Coeff', `CLong', `CULong', `CLong', `CULong' } -> `()' #}

{#fun ap_coeff_set_interval_double as ^ { `Coeff', `Double', `Double' } -> `()' #}

{#fun ap_coeff_set_interval_top as ^ { `Coeff' } -> `()' #}

-- Tests

{#fun ap_coeff_cmp as ^ { `Coeff', `Coeff' } -> `CInt' #}

{#fun ap_coeff_equal as ^ { `Coeff', `Coeff' } -> `Bool' #}

{#fun ap_coeff_zero as ^ { `Coeff' } -> `Bool' #}

{#fun ap_coeff_equal_int as ^ { `Coeff', `CInt' } -> `Bool' #}

-- Other

{#fun ap_coeff_neg as ^ { `Coeff', `Coeff' } -> `()' #}

{#fun ap_coeff_hash as ^ { `Coeff' } -> `CLong' #} 
 

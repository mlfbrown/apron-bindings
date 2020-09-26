{-# LANGUAGE StandaloneDeriving #-}
module Apron.Scalar where
import           Foreign.C

#include "ap_scalar.h"
#include "wrappers.h" 

{#pointer *ap_scalar_t as Scalar foreign newtype#}

{# enum define ScalarDisc {
  AP_SCALAR_DOUBLE as SCALAR_DOUBLE,
  AP_SCALAR_MPQ as SCALAR_MPQ,
  AP_SCALAR_MPFR as SCALAR_MPFR    
} deriving (Eq, Ord, Show) #}

-- Basics

{#fun ap_scalar_alloc as ^ { } -> `Scalar' #}

{#fun ap_scalar_free as ^ { `Scalar' } -> `()' #}

{#fun ap_scalar_print_wrapper as ^ { `Scalar' } -> `()' #}

{#fun ap_scalar_reinit as ^ { `Scalar', `ScalarDisc' } -> `()' #} 

{#fun ap_scalar_swap_wrapper as ^ { `Scalar', `Scalar' } -> `()' #}  

-- Assignments 
           
{#fun ap_scalar_set as ^ { `Scalar', `Scalar' } -> `()' #}

-- void ap_scalar_set_mpq(ap_scalar_t* scalar, mpq_t mpq);
                                                   
{#fun ap_scalar_set_int as ^ { `Scalar', `CLong' } -> `()' #}

{#fun ap_scalar_set_frac as ^ { `Scalar', `CLong', `CULong' } -> `()' #}

{#fun ap_scalar_set_double as ^ { `Scalar', `CDouble' } -> `()' #}

-- void ap_scalar_set_mpfr(ap_scalar_t* scalar, mpfr_t mpfr);
                                                           
{#fun ap_scalar_set_infty as ^ { `Scalar', `CInt' } -> `()' #}
                                                       
-- Combined allocations and assignments

{#fun ap_scalar_alloc_set as ^ { `Scalar' } -> `Scalar' #}

-- ap_scalar_t* ap_scalar_alloc_set_mpq(mpq_t mpq);

{#fun ap_scalar_alloc_set_double as ^ { `CDouble' } -> `Scalar' #}

-- ap_scalar_t* ap_scalar_alloc_set_mpfr(mpfr_t mpfr);

-- Conversions

-- int ap_mpq_set_scalar(mpq_t mpq, ap_scalar_t* scalar, mp_rnd_t round);

-- int ap_double_set_scalar(double* k, ap_scalar_t* scalar, mp_rnd_t round);

-- int ap_mpfr_set_scalar(mpfr_t mpfr, ap_scalar_t* scalar, mp_rnd_t round);

-- Tests

{#fun ap_scalar_infty as ^ { `Scalar' } -> `Int' #}

{#fun ap_scalar_cmp as ^ { `Scalar', `Scalar' } -> `Int' #}

{#fun ap_scalar_cmp_int as ^ { `Scalar', `Int' } -> `Int' #}

{#fun ap_scalar_equal as ^ { `Scalar', `Scalar' } -> `Bool' #}

{#fun ap_scalar_equal_int as ^ { `Scalar', `Int' } -> `Bool' #}

{#fun ap_scalar_sgn as ^ { `Scalar' } -> `Int' #}

-- Other operations 

{#fun ap_scalar_neg as ^ { `Scalar', `Scalar' } -> `()' #}

{#fun ap_scalar_inv as ^ { `Scalar', `Scalar' } -> `()' #}

{#fun ap_scalar_hash as ^ { `Scalar' } -> `CLong' #}
 

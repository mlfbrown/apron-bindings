{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE StandaloneDeriving       #-}
module Apron.Interval where
import Foreign.C

{# import Apron.Scalar #}
    
#include "ap_interval.h"    

{#pointer *ap_interval_t as Interval foreign newtype#}

-- Basics

{#fun ap_interval_alloc as ^ { } -> `Interval' #}

{#fun ap_interval_reinit as ^ { `Interval', `ScalarDisc' } -> `()' #}

{#fun ap_interval_free as ^ { `Interval' } -> `()' #}

{#fun ap_interval_print as ^ { `Interval' } -> `()' #} 

 -- Assignments

{# fun ap_interval_set as ^ { `Interval', `Interval' } -> `()' #}

{# fun ap_interval_set_scalar as ^ { `Interval', `Scalar', `Scalar' } -> `()' #}

-- void ap_interval_set_mpq(ap_interval_t* interval, mpq_t inf, mpq_t sup);

{# fun ap_interval_set_int as ^ { `Interval', `CLong', `CLong' } -> `()' #}

{#fun ap_interval_set_frac as ^ { `Interval', `CLong', `CULong', `CLong', `CULong' } -> `()' #}  

{#fun ap_interval_set_double as ^ { `Interval', `Double', `Double' } -> `()' #}

-- void ap_interval_set_mpfr(ap_interval_t* interval, mpfr_t inf, mpfr_t sup);
 
{#fun ap_interval_set_top as ^ { `Interval' } -> `()' #}
 
{#fun ap_interval_set_bottom as ^ { `Interval' } -> `()' #}
 
-- Combined allocation and assignments 

{#fun ap_interval_alloc_set as ^ { `Interval' } -> `Interval' #}

-- Tests  

{#fun ap_interval_is_top as ^ { `Interval' } -> `Bool' #}

{#fun ap_interval_is_bottom as ^ { `Interval' } -> `Bool' #}

{#fun ap_interval_is_leq as ^ { `Interval', `Interval' } -> `Bool' #}

{#fun ap_interval_cmp as ^ { `Interval', `Interval' } -> `CInt' #}

{#fun ap_interval_equal as ^ { `Interval', `Interval' } -> `Bool' #}

{#fun ap_interval_equal_int as ^ { `Interval', `CInt' } -> `Bool' #}

-- Other operations

{#fun ap_interval_neg as ^ { `Interval', `Interval' } -> `()' #}

{#fun ap_interval_hash as ^ { `Interval' } -> `CLong' #}

-- Array of intervals

-- ap_interval_t** ap_interval_array_alloc(size_t size);

-- void ap_interval_array_free(ap_interval_t** array, size_t size);

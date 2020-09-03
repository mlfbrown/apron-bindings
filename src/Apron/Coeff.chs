{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE StandaloneDeriving       #-}
module Apron.Coeff where
import           Foreign

{# import Apron.Scalar #}
{# import Apron.Interval #}    
    
#include "ap_coeff.h"

{#pointer *ap_coeff_t as Coeff foreign newtype#}
{#pointer *ap_coeff_discr_t as CoeffDiscr foreign newtype#}

-- Basics

{#fun ap_coeff_alloc as ^ { %`CoeffDiscr' } -> `Coeff' #}

{#fun ap_coeff_free as ^ { `Coeff' } -> `()' #}

{#fun ap_coeff_reduce as ^ { `Coeff' } -> `()' #}

-- Combined allocation and assignment

{#fun ap_coeff_alloc_set_scalar as ^ { `Scalar' } -> `Coeff' #}

{#fun ap_coeff_alloc_set_interval as ^ { `Interval' } -> `Coeff' #}

{#fun ap_coeff_alloc_set as ^ { `Coeff' } -> `Coeff' #}


 





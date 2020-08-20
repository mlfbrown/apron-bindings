{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE StandaloneDeriving       #-}
module Apron.Coeff where
import           Foreign

#include "ap_coeff.h"

{#pointer *ap_coeff_t as Coeff foreign newtype#}
{#pointer *ap_coeff_discr_t as CoeffDiscr foreign newtype#}

-- Basics

{#fun ap_coeff_free as ^ { `Coeff' } -> `()' #}

{#fun ap_coeff_reduce as ^ { `Coeff' } -> `()' #}

 





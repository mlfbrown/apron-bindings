module Apron.Lincons1 where
{# import Apron.Scalar #}
    
#include "ap_lincons1.h"

{#pointer *ap_lincons1_t as Lincons1 foreign newtype#}

{#pointer *ap_lincons1_array_t as Lincons1Array foreign newtype#}

-- I. Memory management and printing

{#fun ap_lincons1_clear as ^ { `Lincons1' } -> `()' #}

-- I. Access 

{#fun ap_lincons1_scalarref as ^ { `Lincons1' } -> `Scalar' #}

-- I. Change of dimensions and permutations

-- II. Memory mangagement and printing

-- II. Access

-- II. Change of dimensions and permutations 

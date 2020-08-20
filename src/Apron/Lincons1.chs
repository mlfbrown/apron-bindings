{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE ForeignFunctionInterface #-}
module Apron.Lincons1 where
import Foreign.C

{# import Apron.Environment #}
    
#include "ap_lincons1.h"

------ 
------ Lincons1
------

--- Allocation etc
 
{#pointer *ap_lincons1_t as Lincons1 foreign newtype#}

--{#fun ap_lincons1_clear as ^ { `Licons1' } -> `()' #}

--- Tests

--{#fun ap_lincons1_is_unsat as ^ { `Licons1' } -> `Bool' #}
 

-- Lincons1 arrays

-- {#pointer *ap_lincons1_array_t as Lincons1Array foreign newtype#}    


{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE ForeignFunctionInterface #-}
module Apron.Environment where
import Apron.Var
import           Foreign
import           Foreign.C

{# import Apron.Var #}
    
#include "ap_environment.h"

{#pointer *ap_environment_t as Environment foreign newtype#} 

-- Allocation

{#fun ap_environment_alloc_empty as ^ { } -> `Environment' #}

{#fun ap_environment_alloc as ^ { `Var', `CULong', `Var', `CULong' } -> `Environment' #}

{#fun ap_environment_add as ^ { `Environment', `Var', `CULong', `Var', `CULong' } -> `Environment' #}

{#fun ap_environment_remove as ^ { `Environment', `Var', `CULong' } -> `Environment' #}

{#fun ap_environment_copy as ^ { `Environment' } -> `Environment' #}

{#fun ap_environment_free as ^ { `Environment' } -> `()' #}

{#fun ap_environment_free2 as ^ { `Environment' } -> `()' #}   

-- Queries

-- Tests

{#fun ap_environment_is_eq as ^ { `Environment', `Environment' } -> `Bool' #}

{#fun ap_environment_is_leq as ^ { `Environment', `Environment' } -> `Bool' #}

{#fun ap_environment_compare as ^ { `Environment', `Environment' } -> `CInt' #}

{#fun ap_environment_hash as ^ { `Environment' } -> `CInt' #}   



{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE ForeignFunctionInterface #-}
module Apron.Environment where
import Apron.Var
import           Foreign
import           Foreign.C

{# import Apron.Var #}
{# import Apron.Dimension #}
    
#include "ap_environment.h"
#include "wrappers.h" 

{#pointer *ap_environment_t as Environment foreign newtype#}

-- Memory management, constructors, destructors

{#fun ap_environment_free2 as ^ { `Environment' } -> `()' #}
 
{#fun ap_environment_free_wrapper as ^ { `Environment' } -> `()' #}

{#fun ap_environment_copy_wrapper as ^ { `Environment' } -> `Environment' #}

------ name_of_dim_alloc: not allowing, unsized array in struct
------ name_of_dim_free: not allowing, unsized array in struct
 
{#fun ap_environment_alloc_empty as ^ { } -> `Environment' #}

{#fun ap_environment_alloc as ^ { `Var', `CULong', `Var', `CULong' } -> `Environment' #}

{#fun ap_environment_add as ^ { `Environment', `Var', `CULong', `Var', `CULong' } -> `Environment' #}

{#fun ap_environment_add_perm as ^ { `Environment', `Var', `CULong', `Var', `CULong', `DimPerm' } -> `Environment' #}

{#fun ap_environment_remove as ^ { `Environment', `Var', `CULong' } -> `Environment' #}

-- Tests

{#fun ap_environment_is_eq as ^ { `Environment', `Environment' } -> `Bool' #}

{#fun ap_environment_is_leq as ^ { `Environment', `Environment' } -> `Bool' #}

{#fun ap_environment_compare as ^ { `Environment', `Environment' } -> `CInt' #}

{#fun ap_environment_hash as ^ { `Environment' } -> `CInt' #}   

-- skipping mem var, var of dim, gcc is very upset

-- Least common enviroments and conversion permutations (NOT DOING)

-- Variable renaming

{#fun ap_environment_rename as ^ { `Environment', `Var', `Var', `CULong', `DimPerm' } -> `Environment' #}

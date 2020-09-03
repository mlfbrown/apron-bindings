{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE ForeignFunctionInterface #-}
module Apron.Environment where
import Apron.Var
import           Foreign
import           Foreign.C

{# import Apron.Var #}
{# import Apron.Dimension #}
    
#include "ap_environment.h"

{#pointer *ap_environment_t as Environment foreign newtype#} 

-- Memory management, constructors, destructors

{#fun ap_environment_free2 as ^ { `Environment' } -> `()' #}
 
{#fun ap_environment_free as ^ { `Environment' } -> `()' #}

{#fun ap_environment_copy as ^ { `Environment' } -> `Environment' #}

------ name_of_dim_alloc
------ name_of_dim_free
 
{#fun ap_environment_alloc_empty as ^ { } -> `Environment' #}

{#fun ap_environment_alloc as ^ { `Var', `CULong', `Var', `CULong' } -> `Environment' #}

{#fun ap_environment_add as ^ { `Environment', `Var', `CULong', `Var', `CULong' } -> `Environment' #}

{#fun ap_environment_add_perm as ^ { `Environment', `Var', `CULong', `Var', `CULong', `DimPerm' } -> `Environment' #}

{#fun ap_environment_remove as ^ { `Environment', `Var', `CULong' } -> `Environment' #}

-- THIS FUNCTION IS VERY UPSETTING TO GCC
--{#fun ap_environment_mem_var as ^ { `Environment', %`Var' } -> `Bool' #}

-- need wrapper: ap_environment_dim_of_var
-- need wrapper: ap_environment_var_of_dim

-- Tests

{#fun ap_environment_is_eq as ^ { `Environment', `Environment' } -> `Bool' #}

{#fun ap_environment_is_leq as ^ { `Environment', `Environment' } -> `Bool' #}

{#fun ap_environment_compare as ^ { `Environment', `Environment' } -> `CInt' #}

{#fun ap_environment_hash as ^ { `Environment' } -> `CInt' #}   

-- Least common enviroments and conversion permutations (NOT DOING)

-- Variable renaming

{#fun ap_environment_rename as ^ { `Environment', `Var', `Var', `CULong', `DimPerm' } -> `Environment' #}

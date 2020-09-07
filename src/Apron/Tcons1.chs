{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE StandaloneDeriving       #-}
module Apron.Tcons1 where
import Foreign.C
    
#include "ap_tcons1.h"    

{# import Apron.Environment #}
 
---- Tcons1
 
{#pointer *ap_tcons1_t as Tcons1 foreign newtype#}

-- ap_tcons1_t ap_tcons1_make(ap_constyp_t constyp

-- ap_tcons1_t ap_tcons1_from_lincons1(ap_lincons1_t* cons);

-- ap_tcons1_t ap_tcons1_copy(ap_tcons1_t* cons);

{# fun ap_tcons1_clear as ^ { `Tcons1' } -> `()' #}

-- Access

-- ap_environment_t* ap_tcons1_envref(ap_tcons1_t* cons);

-- ap_constyp_t* ap_tcons1_constypref(ap_tcons1_t* cons);

-- ap_scalar_t* ap_tcons1_scalarref(ap_tcons1_t* cons);

-- ap_texpr1_t ap_tcons1_texpr1ref(ap_tcons1_t* cons);

-- Change of dimensions and permutations

{# fun ap_tcons1_extend_environment as ^ { `Tcons1', `Tcons1', `Environment' } -> `Bool' #}

{# fun ap_tcons1_extend_environment_with as ^ { `Tcons1', `Environment' } -> `Bool' #}

---- Tcons1 array

{#pointer *ap_tcons1_array_t as Tcons1Array foreign newtype#} 

-- Memory management

-- ap_tcons1_array_t ap_tcons1_array_make(ap_environment_t* env, size_t size);

{# fun ap_tcons1_array_clear as ^ { `Tcons1Array' } -> `()' #}

-- Access

-- size_t ap_tcons1_array_size(ap_tcons1_array_t* array);

-- ap_environment_t* ap_tcons1_array_envref(ap_tcons1_array_t* array);

-- void ap_tcons1_array_clear_index(ap_tcons1_array_t* array, size_t index);

-- ap_tcons1_t ap_tcons1_array_get(ap_tcons1_array_t* array,

{# fun ap_tcons1_array_set as ^ { `Tcons1Array', `CULong', `Tcons1' } -> `Bool' #}

-- Change of dimensions and permutations

{# fun ap_tcons1_array_extend_environment as ^ { `Tcons1Array', `Tcons1Array', `Environment' } -> `Bool' #}

{# fun ap_tcons1_array_extend_environment_with as ^ { `Tcons1Array', `Environment' } -> `Bool' #}

{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE StandaloneDeriving       #-}
module Apron.Tcons1 where
import Foreign.C
    
#include "ap_tcons1.h"
#include "wrappers.h"     

{# import Apron.Environment #}
{# import Apron.Lincons1 #}
{# import Apron.Scalar #}
{# import Apron.Texpr1 #}
 
---- Tcons1
 
{#pointer *ap_tcons1_t as Tcons1 foreign newtype#}

{# fun ap_tcons1_make_wrapper as ^ { `Constyp', `Texpr1', `Scalar' } -> `Tcons1' #}

{# fun ap_tcons1_from_lincons1_wrapper as ^ { `Lincons1' } -> `Tcons1' #}

{# fun ap_tcons1_copy_wrapper as ^ { `Tcons1' } -> `Tcons1' #}

{# fun ap_tcons1_clear as ^ { `Tcons1' } -> `()' #}

{# fun ap_tcons1_print as ^ { `Tcons1' } -> `()' #} 

-- Access

{# fun ap_tcons1_envref_wrapper as ^ { `Tcons1' } -> `Environment' #}

-- ap_constyp_t* ap_tcons1_constypref(ap_tcons1_t* cons);

{# fun ap_tcons1_scalarref_wrapper as ^ { `Tcons1' } -> `Scalar' #}

{# fun ap_tcons1_texpr1ref_wrapper as ^ { `Tcons1' } -> `Texpr1' #}

-- Change of dimensions and permutations

{# fun ap_tcons1_extend_environment as ^ { `Tcons1', `Tcons1', `Environment' } -> `Bool' #}

{# fun ap_tcons1_extend_environment_with as ^ { `Tcons1', `Environment' } -> `Bool' #}

---- Tcons1 array

{#pointer *ap_tcons1_array_t as Tcons1Array foreign newtype#} 

-- Memory management

{# fun ap_tcons1_array_make_wrapper as ^ { `Environment', `Int' } -> `Tcons1Array' #}

{# fun ap_tcons1_array_clear as ^ { `Tcons1Array' } -> `()' #}

-- Access

{# fun ap_tcons1_array_size_wrapper as ^ { `Tcons1Array' } -> `CULong' #}

{# fun ap_tcons1_array_envref_wrapper as ^ { `Tcons1Array' } -> `Environment' #}

{# fun ap_tcons1_array_clear_index_wrapper as ^ { `Tcons1Array', `CULong' } -> `()' #}

{# fun ap_tcons1_array_get_wrapper as ^ { `Tcons1Array', `CULong' } -> `Tcons1' #}

{# fun ap_tcons1_array_set as ^ { `Tcons1Array', `CULong', `Tcons1' } -> `Bool' #}

-- Change of dimensions and permutations

{# fun ap_tcons1_array_extend_environment as ^ { `Tcons1Array', `Tcons1Array', `Environment' } -> `Bool' #}

{# fun ap_tcons1_array_extend_environment_with as ^ { `Tcons1Array', `Environment' } -> `Bool' #}

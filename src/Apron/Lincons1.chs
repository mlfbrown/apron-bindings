{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE ForeignFunctionInterface #-}
module Apron.Lincons1 where
import Foreign.C

{# import Apron.Environment #}
{# import Apron.Scalar #}
{# import Apron.Linexpr1 #}
{# import Apron.Var #}
{# import Apron.Coeff #}
    
#include "ap_lincons1.h"
#include "ap_lincons0.h"
#include "wrappers.h"

---- Lincons1

{# enum define Constyp {
  AP_CONS_EQ as CONS_EQ,       -- /* equality constraint */        
  AP_CONS_SUPEQ as CONS_SUPEQ, -- /* >= constraint */
  AP_CONS_SUP as CONS_SUP,     -- /* > constraint */
  AP_CONS_EQMOD as CONS_EQMOD, -- /* congruence equality constraint */
  AP_CONS_DISEQ as CONS_DISEQ  -- /* disequality constraint */
} deriving (Eq, Ord, Show) #}

{#pointer *ap_lincons1_t as Lincons1 foreign newtype#}

-- Memory management and printing

{#fun ap_lincons1_make_wrapper as ^ { `Constyp', `Linexpr1', `Scalar' } -> `Lincons1' #}

{#fun ap_lincons1_make_wrapper_two as ^ { `Constyp', `Linexpr1' } -> `Lincons1' #}

{#fun ap_lincons1_copy_wrapper as ^ { `Lincons1' } -> `Lincons1' #}


{#fun ap_lincons1_clear as ^ { `Lincons1' } -> `()' #}

{#fun ap_lincons1_free as ^ { `Lincons1' } -> `()' #}

{#fun print_lincons1 as ^ { `Lincons1' } -> `()' #} 
 
-- Tests

{#fun ap_lincons1_is_unsat_wrapper as ^ { `Lincons1' } -> `Bool' #}

-- Access

{#fun ap_lincons1_envref_wrapper as ^ { `Lincons1' } -> `Environment' #}

--{#fun ap_lincons1_constypref_wrapper as ^ { `Lincons1' } -> `Constyp' #}
-- ap_constyp_t* ap_lincons1_constypref(ap_lincons1_t* cons);

{#fun ap_lincons1_scalarref_wrapper as ^ { `Lincons1' } -> `Scalar' #}

{#fun ap_lincons1_linexpr1ref_wrapper as ^ { `Lincons1' } -> `Linexpr1' #}

{#fun ap_lincons1_get_cst_wrapper as ^ { `Coeff', `Lincons1' } -> `()' #}

{#fun ap_lincons1_get_coeff as ^ { `Coeff', `Lincons1', %`Var' } -> `Bool' #}

{#fun ap_lincons1_set_cst_wrapper as ^ { `Lincons1', `Coeff' } -> `()' #}

{#fun ap_lincons1_set_coeff_wrapper as ^ { `Lincons1', %`Var', `Coeff' } -> `Bool' #}

{#fun ap_lincons1_cstref_wrapper as ^ { `Lincons1' } -> `Coeff' #}

{#fun ap_lincons1_coeffref as ^ { `Lincons1', %`Var' } -> `Coeff' #}

---- Lincons1 Array

{#pointer *ap_lincons1_array_t as Lincons1Array foreign newtype#}    

{#fun ap_lincons1_array_make_wrapper as ^ { `Environment', `CULong' } -> `Lincons1Array' #}

{#fun ap_lincons1_array_clear as ^ { `Lincons1Array' } -> `()' #}

-- Access

{#fun ap_lincons1_array_size_wrapper as ^ { `Lincons1Array' } -> `CULong' #}

{#fun ap_lincons1_array_envref_wrapper as ^ { `Lincons1Array' } -> `Environment' #}

{#fun ap_lincons1_array_clear_index_wrapper as ^ { `Lincons1Array', `CULong' } -> `()' #}

{#fun ap_lincons1_array_get_wrapper as ^ { `Lincons1Array', `CULong' } -> `Lincons1' #}

{#fun ap_lincons1_array_set as ^ { `Lincons1Array', `CULong', `Lincons1' } -> `()' #}

-- Change of dimensions and permutations

{#fun ap_lincons1_array_extend_environment_with as ^ { `Lincons1Array', `Environment' } -> `Bool' #} 

{#fun ap_lincons1_array_extend_environment as ^ { `Lincons1Array', `Lincons1Array', `Environment' } -> `Bool' #} 

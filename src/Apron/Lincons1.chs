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
  AP_CONS_EQ as CONS_EQ,
  AP_CONS_SUPEQ as CONS_SUPEQ,
  AP_CONS_SUP as CONS_SUP,
  AP_CONS_EQMOD as CONS_EQMOD,
  AP_CONS_DISEQ as CONS_DISEQ
} deriving (Eq, Ord, Show) #}

{#pointer *ap_lincons1_t as Lincons1 foreign newtype#}

-- Memory management and printing

{#fun ap_lincons1_make_wrapper as ^ { `Constyp', `Linexpr', `Scalar' } -> `Lincons1' #}

-- ap_lincons1_t ap_lincons1_make_unsat(ap_environment_t* env);

-- ap_lincons1_t ap_lincons1_copy(ap_lincons1_t* cons);

{#fun ap_lincons1_clear as ^ { `Lincons1' } -> `()' #}

{#fun ap_lincons1_free as ^ { `Lincons1' } -> `()' #}

-- Tests

{#fun ap_lincons1_is_unsat as ^ { `Lincons1' } -> `Bool' #}

-- Access

-- ap_environment_t* ap_lincons1_envref(ap_lincons1_t* cons);

-- ap_constyp_t* ap_lincons1_constypref(ap_lincons1_t* cons);

-- ap_scalar_t* ap_lincons1_scalarref(ap_lincons1_t* cons);

-- ap_linexpr1_t ap_lincons1_linexpr1ref(ap_lincons1_t* cons);

-- static inline void ap_lincons1_get_cst(ap_coeff_t* coeff, ap_lincons1_t* cons);

{#fun ap_lincons1_get_coeff as ^ { `Coeff', `Lincons1', %`Var' } -> `Bool' #}

-- static inline void ap_lincons1_set_cst(ap_lincons1_t* cons, ap_coeff_t* cst);

-- static inline bool ap_lincons1_set_coeff(ap_lincons1_t* cons, ap_var_t var, ap_coeff_t* coeff);

-- ap_coeff_t* ap_lincons1_cstref(ap_lincons1_t* cons);

{#fun ap_lincons1_coeffref as ^ { `Lincons1', %`Var' } -> `Coeff' #}

---- Lincons1 Array

{#pointer *ap_lincons1_array_t as Lincons1Array foreign newtype#}    

-- ap_lincons1_array_t ap_lincons1_array_make(ap_environment_t* env, size_t size);

{#fun ap_lincons1_array_clear as ^ { `Lincons1Array' } -> `()' #}

-- Access

-- size_t ap_lincons1_array_size(ap_lincons1_array_t* array);

-- ap_environment_t* ap_lincons1_array_envref(ap_lincons1_array_t* array);

-- ap_lincons1_t ap_lincons1_array_get(ap_lincons1_array_t* array,
--      size_t index);

{#fun ap_lincons1_array_set as ^ { `Lincons1Array', `CULong', `Lincons1' } -> `()' #}

-- Change of dimensions and permutations

{#fun ap_lincons1_array_extend_environment_with as ^ { `Lincons1Array', `Environment' } -> `Bool' #} 

{#fun ap_lincons1_array_extend_environment as ^ { `Lincons1Array', `Lincons1Array', `Environment' } -> `Bool' #} 

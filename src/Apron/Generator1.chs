{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE StandaloneDeriving       #-}
module Apron.Generator1 where
import           Foreign.C

{# import Apron.Environment #}
{# import Apron.Coeff #}
{# import Apron.Var #}
    
#include "ap_generator1.h"

---- Generators
 
{#pointer *ap_generator1_t as Generator1 foreign newtype#}

-- Memory management

-- ap_generator1_t ap_generator1_make(ap_gentyp_t gentyp, ap_linexpr1_t* expr);

-- ap_generator1_t ap_generator1_copy(ap_generator1_t* gen);

{#fun ap_generator1_clear as ^ { `Generator1' } -> `()' #}

-- Access

{#fun ap_generator1_envref as ^ { `Generator1' } -> `Environment' #}

-- ap_gentyp_t* ap_generator1_gentypref(ap_generator1_t* gen);

-- ap_linexpr1_t ap_generator1_linexpr1ref(ap_generator1_t* gen);

-- static inline void ap_generator1_get_cst(ap_coeff_t* coeff, ap_generator1_t* gen);

{#fun ap_generator1_get_coeff as ^ { `Coeff', `Generator1', %`Var' } -> `Bool' #}

-- static inline void ap_generator1_set_cst(ap_generator1_t* gen, ap_coeff_t* cst);

-- static inline bool ap_generator1_set_coeff(ap_generator1_t* gen, ap_var_t var, ap_coeff_t* coeff);

{#fun ap_generator1_cstref as ^ { `Generator1' } -> `Coeff' #}

{#fun ap_generator1_coeffref as ^ { `Generator1', %`Var' } -> `Coeff' #}

-- Change of dimension and permutations

{#fun ap_generator1_extend_environment as ^ { `Generator1', `Generator1', `Environment' } -> `Bool' #}

{#fun ap_generator1_extend_environment_with as ^ { `Generator1', `Environment' } -> `Bool' #}

---- Generator arrays

{#pointer *ap_generator1_array_t as Generator1Array foreign newtype#} 

-- Memory management

-- ap_generator1_array_t ap_generator1_array_make(ap_environment_t* env, size_t size);

{#fun ap_generator1_array_clear as ^ { `Generator1Array' } -> `()' #}

-- Access

{#fun ap_generator1_array_size as ^ { `Generator1Array' } -> `CULong' #}

{#fun ap_generator1_array_envref as ^ { `Generator1Array' } -> `Environment' #}

-- ap_generator1_t ap_generator1_array_get(ap_generator1_array_t* array,
--      size_t index);

{#fun ap_generator1_array_set as ^ { `Generator1Array', `CULong', `Generator1' } -> `Bool' #}

-- Change of dimensions and permutations

{#fun ap_generator1_array_extend_environment_with as ^ { `Generator1Array', `Environment' } -> `Bool' #}

{#fun ap_generator1_array_extend_environment as ^ { `Generator1Array', `Generator1Array', `Environment' } -> `Bool' #}


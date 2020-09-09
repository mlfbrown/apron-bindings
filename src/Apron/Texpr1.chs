{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE StandaloneDeriving       #-}
module Apron.Texpr1 where

import Foreign.C
    
{# import Apron.Environment #}
{# import Apron.Coeff #}
{# import Apron.Scalar #}
{# import Apron.Interval #}
{# import Apron.Var #}
{# import Apron.Linexpr1 #}
    
#include "ap_texpr1.h"
#include "wrappers.h"     

{#pointer *ap_texpr1_t as Texpr1 foreign newtype#}

-- Constructors and destructors

{#fun ap_texpr1_cst as ^ { `Environment', `Coeff' } -> `Texpr1' #}

{#fun ap_texpr1_cst_scalar as ^ { `Environment', `Scalar' } -> `Texpr1' #}

-- ap_texpr1_t* ap_texpr1_cst_scalar_mpq      (ap_environment_t* env, mpq_t mpq);

-- ap_texpr1_t* ap_texpr1_cst_scalar_mpfr     (ap_environment_t* env, mpfr_t mpfr);

{#fun ap_texpr1_cst_scalar_int as ^ { `Environment', `CLong' } -> `Texpr1' #}

{#fun ap_texpr1_cst_scalar_frac as ^ { `Environment', `CLong', `CULong' } -> `Texpr1' #}

{#fun ap_texpr1_cst_scalar_double as ^ { `Environment', `Double' } -> `Texpr1' #}

{#fun ap_texpr1_cst_interval as ^ { `Environment', `Interval' } -> `Texpr1' #}

{#fun ap_texpr1_cst_interval_scalar as ^ { `Environment', `Scalar', `Scalar' } -> `Texpr1' #}

-- ap_texpr1_t* ap_texpr1_cst_interval_mpq    (ap_environment_t* env, mpq_t inf, mpq_t sup);

-- ap_texpr1_t* ap_texpr1_cst_interval_mpfr   (ap_environment_t* env, mpfr_t inf, mpfr_t sup);

{#fun ap_texpr1_cst_interval_int as ^ { `Environment', `CLong', `CLong' } -> `Texpr1' #}

{#fun ap_texpr1_cst_interval_frac as ^ { `Environment', `CLong', `CULong', `CLong', `CULong' } -> `Texpr1' #}

{#fun ap_texpr1_cst_interval_double as ^ { `Environment', `Double', `Double' } -> `Texpr1' #}

{#fun ap_texpr1_cst_interval_top as ^ { `Environment' } -> `Texpr1' #}

{#fun ap_texpr1_var as ^ { `Environment', %`Var' } -> `Texpr1' #}

-- ap_texpr1_t* ap_texpr1_unop(ap_texpr_op_t op,

-- ap_texpr1_t* ap_texpr1_binop(ap_texpr_op_t op,

{#fun ap_texpr1_copy as ^ { `Texpr1' } -> `Texpr1' #}

{#fun ap_texpr1_free as ^ { `Texpr1' } -> `()' #}

{#fun ap_texpr1_from_linexpr1 as ^ { `Linexpr1' } -> `Texpr1' #} 

-- Tests, size

{#fun ap_texpr1_has_var as ^ { `Texpr1',  %`Var' } -> `Bool' #}

{#fun ap_texpr1_is_interval_cst_wrapper as ^ { `Texpr1' } -> `Bool' #}

{#fun ap_texpr1_is_interval_linear_wrapper as ^ { `Texpr1' } -> `Bool' #}

{#fun ap_texpr1_is_interval_polynomial_wrapper as ^ { `Texpr1' } -> `Bool' #}

{#fun ap_texpr1_is_interval_polyfrac_wrapper as ^ { `Texpr1' } -> `Bool' #}

{#fun ap_texpr1_is_scalar_wrapper as ^ { `Texpr1' } -> `Bool' #}

-- Operations

{#fun ap_texpr1_substitute as ^ { `Texpr1',  %`Var', `Texpr1' } -> `Texpr1' #}

{#fun ap_texpr1_substitute_with as ^ { `Texpr1',  %`Var', `Texpr1' } -> `Bool' #}

-- Change of environment

{#fun ap_texpr1_extend_environment as ^ { `Texpr1',  `Environment' } -> `Texpr1' #}

{#fun ap_texpr1_extend_environment_with as ^ { `Texpr1',  `Environment' } -> `Bool' #}

-- Hashing and comparisons

{#fun ap_texpr1_equal as ^ { `Texpr1',  `Texpr1' } -> `Bool' #}

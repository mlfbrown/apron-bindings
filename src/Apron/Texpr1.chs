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
#include "ap_texpr0.h" 
#include "wrappers.h"     

{#pointer *ap_texpr1_t as Texpr1 foreign newtype#}

{# enum define OpType {
   AP_TEXPR_ADD as ADD_OP,
   AP_TEXPR_SUB as SUB_OP,
   AP_TEXPR_MUL as MUL_OP,
   AP_TEXPR_DIV as DIV_OP,
   AP_TEXPR_MOD as MOD_OP, -- either integer or real, no rounding
   AP_TEXPR_POW as POW_OP,
   AP_TEXPR_NEG as NEG_OP, -- no rounding
   AP_TEXPR_CAST as CAST_OP,
   AP_TEXPR_SQRT as SQRT_OP     
} deriving (Eq, Ord, Show)
#}

{# enum define RoundingType {
   AP_RTYPE_REAL as ROUND_REAL,         -- real (no rounding)
   AP_RTYPE_INT as ROUND_INT,           -- integer
   AP_RTYPE_SINGLE as ROUND_SINGLE,     -- IEEE 754 32-bit single precision, e.g.: C's float
   AP_RTYPE_DOUBLE as ROUND_DOUBLE,     -- IEEE 754 64-bit double precision, e.g.: C's double
   AP_RTYPE_EXTENDED as ROUND_EXTENDED, -- non-standard 80-bit double extended, e.g.: Intel's long double
   AP_RTYPE_QUAD as ROUND_QUAD,         -- non-standard 128-bit quadruple precision, e.g.: Motorola's long double
   AP_RTYPE_SIZE as ROUND_DO_NOT_USE_0  -- Not to be used
} deriving (Eq, Ord, Show)
#}

{# enum define RoundingDir {
   AP_RDIR_NEAREST as ROUND_NEAREST,  -- Nearest
   AP_RDIR_ZERO as ROUND_ZERO,        -- Zero (truncation for integers)
   AP_RDIR_UP as ROUND_UP,            -- + Infinity
   AP_RDIR_DOWN as ROUND_DOWN,        -- - Infinity 
   AP_RDIR_RND as ROUND_ALL,          -- All possible mode, non deterministically
   AP_RDIR_SIZE as ROUND_DO_NOT_USE_1 -- Not to be used
} deriving (Eq, Ord, Show)
#}

-- Constructors and destructors

{#fun ap_texpr1_print as ^ { `Texpr1' } -> `()' #}

{#fun ap_texpr1_cst as ^ { `Environment', `Coeff' } -> `Texpr1' #}

{#fun ap_texpr1_cst_scalar as ^ { `Environment', `Scalar' } -> `Texpr1' #}

{#fun ap_texpr1_cst_scalar_int as ^ { `Environment', `CLong' } -> `Texpr1' #}

{#fun ap_texpr1_cst_scalar_frac as ^ { `Environment', `CLong', `CULong' } -> `Texpr1' #}

{#fun ap_texpr1_cst_scalar_double as ^ { `Environment', `Double' } -> `Texpr1' #}

{#fun ap_texpr1_cst_interval as ^ { `Environment', `Interval' } -> `Texpr1' #}

{#fun ap_texpr1_cst_interval_scalar as ^ { `Environment', `Scalar', `Scalar' } -> `Texpr1' #}

{#fun ap_texpr1_cst_interval_int as ^ { `Environment', `CLong', `CLong' } -> `Texpr1' #}

{#fun ap_texpr1_cst_interval_frac as ^ { `Environment', `CLong', `CULong', `CLong', `CULong' } -> `Texpr1' #}

{#fun ap_texpr1_cst_interval_double as ^ { `Environment', `Double', `Double' } -> `Texpr1' #}

{#fun ap_texpr1_cst_interval_top as ^ { `Environment' } -> `Texpr1' #}

{#fun ap_texpr1_var as ^ { `Environment', %`Var' } -> `Texpr1' #}

{#fun ap_texpr1_unop as ^ { `OpType', `Texpr1', `RoundingType', `RoundingDir' } -> `Texpr1' #}

{#fun ap_texpr1_binop as ^ { `OpType', `Texpr1', `Texpr1', `RoundingType', `RoundingDir' } -> `Texpr1' #}

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

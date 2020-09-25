{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE StandaloneDeriving       #-}
module Apron.Linexpr1 where
import           Foreign.C

{# import Apron.Environment #}
{# import Apron.Coeff #}
{# import Apron.Var #}
{# import Apron.Scalar #}
{# import Apron.Interval #}
    
#include "ap_linexpr1.h"
#include "ap_linexpr0.h" 
#include "wrappers.h"

{# enum define LinexprDescrip {
  AP_LINEXPR_DENSE as LINEXPR_DENSE,
  AP_LINEXPR_SPARSE as LINEXPR_SPARSE
} deriving (Eq, Ord, Show) #}

{# enum define LinexprType {
  AP_LINEXPR_INTLINEAR as LINEXPR_INTLINEAR,
  AP_LINEXPR_QUASILINEAR as LINEXPR_QUASILINEAR,
  AP_LINEXPR_LINEAR as LINEXPR_LINEAR
} deriving (Eq, Ord, Show) #}
 
{#pointer *ap_linexpr1_t as Linexpr1 foreign newtype#}

-- Helpers

isDense :: LinexprDescrip -> Bool
isDense LINEXPR_DENSE = True
isDense _             = False

isSparse :: LinexprDescrip -> Bool
isSparse = not . isDense 

-- Memory management and printing

{#fun ap_linexpr1_make_wrapper as ^ { `Environment', `LinexprDescrip', `CULong' } -> `Linexpr1' #}

{# fun print_linexpr1 as ^ { `Linexpr1' } -> `()' #}

-- This will go away
{# fun ap_linexpr1_free as ^ { `Linexpr1' } -> `()' #}

{# fun ap_linexpr1_minimize_wrapper as ^ { `Linexpr1' } -> `()' #}

{# fun ap_linexpr1_copy_wrapper as ^ { `Linexpr1' } -> `Linexpr1' #}

{# fun ap_linexpr1_is_integer_wrapper as ^ { `Linexpr1' } -> `Bool' #}

{# fun ap_linexpr1_is_real_wrapper as ^ { `Linexpr1' } -> `Bool' #}

-- {# fun ap_linexpr1_type_wrapper as ^ { `Linexpr1' } -> `Int' #}
 
{# fun ap_linexpr1_is_linear_wrapper as ^ { `Linexpr1' } -> `Bool' #}

{# fun ap_linexpr1_is_quasilinear_wrapper as ^ { `Linexpr1' } -> `Bool' #}

{# fun ap_linexpr1_envref_wrapper as ^ { `Linexpr1' } -> `Environment' #}

{# fun ap_linexpr1_cstref_wrapper as ^ { `Linexpr1' } -> `Coeff' #}

{# fun ap_linexpr1_coeffref_wrapper as ^ { `Linexpr1', %`Var' } -> `Coeff' #}

{# fun ap_linexpr1_get_cst_wrapper as ^ { `Coeff', `Linexpr1' } -> `()' #}

{# fun ap_linexpr1_get_coeff_wrapper as ^ { `Coeff', `Linexpr1', %`Var' } -> `Bool' #}

{# fun ap_linexpr1_set_cst_wrapper as ^ { `Linexpr1', `Coeff' } -> `()' #}

{# fun ap_linexpr1_set_cst_scalar_wrapper as ^ { `Linexpr1', `Scalar' } -> `()' #}
                                                                   
{# fun ap_linexpr1_set_cst_scalar_int_wrapper as ^ { `Linexpr1', `Int' } -> `()' #}

{# fun ap_linexpr1_set_cst_scalar_frac_wrapper as ^ { `Linexpr1', `Int', `CUInt' } -> `()' #}

{# fun ap_linexpr1_set_cst_scalar_double_wrapper as ^ { `Linexpr1', `Double' } -> `()' #}

{# fun ap_linexpr1_set_cst_interval_wrapper as ^ { `Linexpr1', `Interval' } -> `()' #}
                                                                                  
{# fun ap_linexpr1_set_cst_interval_scalar_wrapper as ^ { `Linexpr1', `Scalar', `Scalar' } -> `()' #}

{# fun ap_linexpr1_set_cst_interval_int_wrapper as ^ { `Linexpr1', `Int', `Int' } -> `()' #}
  
{# fun ap_linexpr1_set_cst_interval_frac_wrapper as ^ { `Linexpr1', `Int', `CUInt', `Int', `CUInt' } -> `()' #}
 
{# fun ap_linexpr1_set_cst_interval_double_wrapper as ^ { `Linexpr1', `Double', `Double' } -> `()' #}

{# fun ap_linexpr1_set_coeff_wrapper as ^ { `Linexpr1', %`Var', `Coeff' } -> `Bool' #}

{# fun ap_linexpr1_set_coeff_scalar_wrapper as ^ { `Linexpr1', %`Var', `Scalar' } -> `Bool' #}

{# fun ap_linexpr1_set_coeff_scalar_int_wrapper as ^ { `Linexpr1', %`Var', `Int' } -> `Bool' #}

{# fun ap_linexpr1_set_coeff_scalar_frac_wrapper as ^ { `Linexpr1', %`Var', `Int', `CUInt' } -> `Bool' #}

{# fun ap_linexpr1_set_coeff_scalar_double_wrapper as ^ { `Linexpr1', %`Var', `Double' } -> `Bool' #}

{# fun ap_linexpr1_set_coeff_interval_wrapper as ^ { `Linexpr1', %`Var', `Interval' } -> `Bool' #}

{# fun ap_linexpr1_set_coeff_interval_scalar_wrapper as ^ { `Linexpr1', %`Var', `Scalar', `Scalar' } -> `Bool' #}

{# fun ap_linexpr1_set_coeff_interval_int_wrapper as ^ { `Linexpr1', %`Var', `Int', `Int' } -> `Bool' #}

{# fun ap_linexpr1_set_coeff_interval_frac_wrapper as ^ { `Linexpr1', %`Var', `Int', `CUInt', `Int', `CUInt' } -> `Bool' #}

{# fun ap_linexpr1_set_coeff_interval_double_wrapper as ^ { `Linexpr1', %`Var', `Double', `Double' } -> `Bool' #}

{# fun ap_linexpr1_coeffref as ^ { `Linexpr1', %`Var' } -> `Coeff' #}

-- {#fun ap_linexpr1_get_cst as ^ { `Coeff', `Linexpr' } -> `()' #}

{# fun ap_linexpr1_get_coeff as ^ { `Coeff', `Linexpr1', %`Var' } -> `Bool' #}

-- Change of dimensions and permutations

{# fun ap_linexpr1_extend_environment as ^ { `Linexpr1', `Linexpr1', `Environment' } -> `Bool' #}

{# fun ap_linexpr1_extend_environment_with as ^ { `Linexpr1', `Environment' } -> `Bool' #}








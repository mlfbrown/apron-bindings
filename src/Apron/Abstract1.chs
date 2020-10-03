{-# LANGUAGE StandaloneDeriving #-}
module Apron.Abstract1 where
import           Foreign.C
    
#include "ap_abstract1.h"
#include "wrappers.h" 

{# import Apron.Manager #}
{# import Apron.Environment #}
{# import Apron.Lincons1 #}
{# import Apron.Linexpr1 #}
{# import Apron.Texpr1 #}
{# import Apron.Tcons1 #}
{# import Apron.Interval #}
{# import Apron.Var #}
 
{#pointer *ap_abstract1_t as Abstract1 foreign newtype#}

{#pointer *ap_box1_t as Box1 foreign newtype#}

-- Memory

-- ap_abstract1_t ap_abstract1_copy(ap_manager_t* man, ap_abstract1_t* a);

{#fun ap_abstract1_bottom_wrapper as ^ { `Manager', `Environment' } -> `Abstract1' #}

{#fun ap_abstract1_top_wrapper as ^ { `Manager', `Environment' } -> `Abstract1' #}

{#fun ap_abstract1_clear as ^ { `Manager', `Abstract1' } -> `()' #}

{#fun ap_abstract1_size as ^ { `Manager', `Abstract1' } -> `CULong' #}

{#fun print_abstract1 as ^ { `Manager', `Abstract1' } -> `()' #}

-- Control of internal representation

{#fun ap_abstract1_minimize as ^ { `Manager', `Abstract1' } -> `()' #}

{#fun ap_abstract1_canonicalize as ^ { `Manager', `Abstract1' } -> `()' #}

{#fun ap_abstract1_hash as ^ { `Manager', `Abstract1' } -> `Int' #}

{#fun ap_abstract1_approximate as ^ { `Manager', `Abstract1', `Int' } -> `()' #}

-- Basic constructors ALL NEED WRAPPERS

-- Accessors

{#fun ap_abstract1_environment as ^ { `Manager', `Abstract1' } -> `Environment' #}

-- Tests

{#fun ap_abstract1_is_bottom as ^ { `Manager', `Abstract1' } -> `Bool' #}

{#fun ap_abstract1_is_top as ^ { `Manager', `Abstract1' } -> `Bool' #}

{#fun ap_abstract1_is_leq as ^ { `Manager', `Abstract1', `Abstract1' } -> `Bool' #}

{#fun ap_abstract1_is_eq as ^ { `Manager', `Abstract1', `Abstract1' } -> `Bool' #}

{#fun ap_abstract1_sat_lincons as ^ { `Manager', `Abstract1', `Lincons1' } -> `Bool' #}

{#fun ap_abstract1_sat_tcons as ^ { `Manager', `Abstract1', `Tcons1' } -> `Bool' #}

{#fun ap_abstract1_sat_interval as ^ { `Manager', `Abstract1', %`Var', `Interval' } -> `Bool' #}

{#fun ap_abstract1_is_variable_unconstrained as ^ { `Manager', `Abstract1', %`Var' } -> `Bool' #}
                                                                   
-- Extraction of properties

{#fun ap_abstract1_bound_linexpr as ^ { `Manager', `Abstract1', `Linexpr1' } -> `Interval' #}

{#fun ap_abstract1_bound_texpr as ^ { `Manager', `Abstract1', `Texpr1' } -> `Interval' #}

{#fun ap_abstract1_bound_variable as ^ { `Manager', `Abstract1', %`Var' } -> `Interval' #}

{#fun ap_abstract1_to_lincons_array_wrapper as ^ { `Manager', `Abstract1' } -> `Lincons1Array' #}

{#fun ap_abstract1_to_tcons_array_wrapper as ^ { `Manager', `Abstract1' } -> `Tcons1Array' #}

-- ap_lincons1_array_t ap_abstract1_to_lincons_array(ap_manager_t* man, ap_abstract1_t* a);

-- ap_tcons1_array_t ap_abstract1_to_tcons_array(ap_manager_t* man, ap_abstract1_t* a);

-- ap_box1_t ap_abstract1_to_box(ap_manager_t* man, ap_abstract1_t* a);

-- Operations

{#fun ap_abstract1_meet_wrapper as ^ { `Manager', `Bool', `Abstract1', `Abstract1' } -> `Abstract1' #}

{#fun ap_abstract1_join_wrapper as ^ { `Manager', `Bool', `Abstract1', `Abstract1' } -> `Abstract1' #}

{#fun ap_abstract1_meet_array_wrapper as ^ { `Manager', `Abstract1', `CULong' } -> `Abstract1' #}

{#fun ap_abstract1_join_array_wrapper as ^ { `Manager', `Abstract1', `CULong' } -> `Abstract1' #}

{#fun ap_abstract1_meet_lincons_array_wrapper as ^ { `Manager', `Bool', `Abstract1', `Lincons1Array' } -> `Abstract1' #}

{#fun ap_abstract1_meet_tcons_array_wrapper as ^ { `Manager', `Bool', `Abstract1', `Tcons1Array' } -> `Abstract1' #}

-- Assignment and substitution 

{#fun ap_abstract1_assign_linexpr_array_wrapper as ^ { `Manager', `Bool', `Abstract1', `Var', `Linexpr1', `CULong', `Abstract1' } -> `Abstract1' #}

{#fun ap_abstract1_substitute_linexpr_array_wrapper as ^ { `Manager', `Bool', `Abstract1', `Var', `Linexpr1', `CULong', `Abstract1' } -> `Abstract1' #}

{#fun ap_abstract1_assign_texpr_array_wrapper as ^ { `Manager', `Bool', `Abstract1', `Var', `Texpr1', `CULong', `Abstract1' } -> `Abstract1' #}

{#fun ap_abstract1_substitute_texpr_array_wrapper as ^ { `Manager', `Bool', `Abstract1', `Var', `Texpr1', `CULong', `Abstract1' } -> `Abstract1' #}

-- Projections

-- skip skip

-- Additional functions

{#fun ap_abstract1_of_lincons_array_wrapper as ^ { `Manager', `Environment', `Lincons1Array' } -> `Abstract1' #}
 
{#fun ap_abstract1_of_tcons_array_wrapper as ^ { `Manager', `Environment', `Tcons1Array' } -> `Abstract1' #}

{#fun ap_abstract1_unify_wrapper as ^ { `Manager', `Bool', `Abstract1', `Abstract1' } -> `Abstract1' #}                      

{#fun ap_abstract1_fold_wrapper as ^ { `Manager', `Bool', `Abstract1', `Var', `CULong' } -> `Abstract1' #}

{#fun ap_abstract1_expand_wrapper as ^ { `Manager', `Bool', `Abstract1', %`Var', `Var', `CULong' } -> `Abstract1' #}

{#fun ap_abstract1_widening_wrapper as ^ { `Manager', `Abstract1', `Abstract1' } -> `Abstract1' #}

{#fun ap_abstract1_closure_wrapper as ^ { `Manager', `Bool', `Abstract1' } -> `Abstract1' #}

-- Environment 

{#fun ap_abstract1_change_environment_wrapper as ^ { `Manager', `Bool', `Abstract1', `Environment', `Bool' } -> `Abstract1' #}

{#fun ap_abstract1_minimize_environment_wrapper as ^ { `Manager', `Bool', `Abstract1' } -> `Abstract1' #}

{#fun ap_abstract1_rename_array_wrapper as ^ { `Manager', `Bool', `Abstract1', `Var', `Var', `CULong' } -> `Abstract1' #}

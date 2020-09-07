{-# LANGUAGE StandaloneDeriving #-}
module Apron.Abstract1 where
import           Apron.Environment
import           Foreign
import           Foreign.C

#include "ap_abstract1.h"

{# import Apron.Manager #}
{# import Apron.Environment #}
{# import Apron.Lincons1 #}
{# import Apron.Tcons1 #}
{# import Apron.Interval #}
{# import Apron.Var #}
 
{#pointer *ap_abstract1_t as Abstract1 foreign newtype#}

{#pointer *ap_box1_t as Box1 foreign newtype#}

-- Memory

-- ap_abstract1_t ap_abstract1_copy(ap_manager_t* man, ap_abstract1_t* a);

{#fun ap_abstract1_clear as ^ { `Manager', `Abstract1' } -> `()' #}

{#fun ap_abstract1_size as ^ { `Manager', `Abstract1' } -> `CULong' #}

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
                                                                   
                                                               


                                                            

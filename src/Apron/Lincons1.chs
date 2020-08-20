{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE ForeignFunctionInterface #-}
module Apron.Lincons1 where
import Foreign.C

{# import Apron.Environment #}
{# import Apron.Scalar #}
{# import Apron.Linexpr #}
    
#include "ap_lincons1.h"
#include "ap_lincons0.h"
#include "wrappers.h"

------ 
------ Lincons1
------

{# enum define Constyp {
  AP_CONS_EQ as CONS_EQ,
  AP_CONS_SUPEQ as CONS_SUPEQ,
  AP_CONS_SUP as CONS_SUP,
  AP_CONS_EQMOD as CONS_EQMOD,
  AP_CONS_DISEQ as CONS_DISEQ
} deriving (Eq, Ord, Show) #}


{#pointer *ap_lincons1_t as Lincons1 foreign newtype#}

-- Memory management and printing

-- ap_lincons1_make_wrapper
-- ap_lincons1_free   

------
------ Lincons1 arrays
------

{#pointer *ap_lincons1_array_t as Lincons1Array foreign newtype#}    


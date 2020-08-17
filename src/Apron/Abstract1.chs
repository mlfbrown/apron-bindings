{-# LANGUAGE StandaloneDeriving #-}
module Apron.Abstract1 where
import           Foreign
import           Foreign.C

{# import Apron.Manager #}
{# import Apron.Environment #}    

#include "ap_abstract1.h"
 
{#pointer *ap_abstract1_t as Abstract1 foreign newtype#}

{#pointer *ap_box1_t as Box1 foreign newtype#}

-- Tests

{#fun ap_abstract1_is_bottom as ^ { `Manager', `Abstract1' } -> `()' #}

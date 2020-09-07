{-# LANGUAGE StandaloneDeriving #-}
module Apron.Abstract1 where
import           Apron.Environment
import           Foreign
import           Foreign.C

#include "ap_abstract1.h"

{#pointer *ap_abstract1_t as Abstract1 foreign newtype#}

{#pointer *ap_box1_t as Box1 foreign newtype#}

-- Memory

-- ap_abstract1_t ap_abstract1_copy(ap_manager_t* man, ap_abstract1_t* a);

-- {#fun ap_abstract1_clear as ^ { } -> `Scalar' #}

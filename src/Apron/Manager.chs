{-# LANGUAGE StandaloneDeriving #-}
module Apron.Manager where
import           Apron.Environment
import           Foreign
import           Foreign.C

#include "ap_manager.h"
#include "box.h"
    
{#pointer *ap_manager_t as Manager foreign newtype#}

-- User functions

{#fun box_manager_alloc as ^ { } -> `Manager' #}

{#fun ap_manager_free as ^ { `Manager' } -> `()' #}



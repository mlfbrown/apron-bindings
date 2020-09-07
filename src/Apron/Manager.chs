{-# LANGUAGE StandaloneDeriving #-}
module Apron.Manager where
import           Apron.Environment
import           Foreign
import           Foreign.C

#include "ap_manager.h"
    
{#pointer *ap_manager_t as Manager foreign newtype#}

-- User functions



{-# LANGUAGE StandaloneDeriving #-}
module Apron.Abstract1 where
import           Apron.Environment
import           Apron.Manager
import           Foreign
import           Foreign.C

#include "ap_abstract1.h"

{#pointer *ap_abstract1_t as Abstract1 foreign newtype#}

{#pointer *ap_box1_t as Box1 foreign newtype#}




{-# LANGUAGE StandaloneDeriving #-}
module Apron.Abstract0 where
import           Foreign
import           Foreign.C
import           Foreign.Ptr

#include "ap_abstract0.h"


-- /* Generic abstract value at level 0 */
-- struct ap_abstract0_t {
--   void* value;       /* Abstract value of the underlying library */
--   ap_manager_t* man; /* Used to identify the effective type of value */
-- };

{#pointer *ap_abstract0_t as Abstract0 foreign newtype#}





{-# LANGUAGE StandaloneDeriving #-}
module Apron.Environment where
import           Apron.Manager
import           Foreign
import           Foreign.C

#include "ap_environment.h"

{#pointer *ap_environment_t as Environment foreign newtype#} 

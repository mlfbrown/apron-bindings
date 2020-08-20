{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE StandaloneDeriving       #-}
module Apron.Coeff where
import           Foreign

#include "ap_coeff.h"

{#pointer *ap_coeff_t as Coeff foreign newtype#}

-- Basics

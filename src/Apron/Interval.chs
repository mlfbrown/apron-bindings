{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE StandaloneDeriving       #-}
module Apron.Interval where

#include "ap_interval.h"    

{#pointer *ap_interval_t as Interval foreign newtype#}

-- Basics

{#fun ap_interval_alloc as ^ { } -> `Interval' #}

{#fun ap_interval_free as ^ { `Interval' } -> `()' #}

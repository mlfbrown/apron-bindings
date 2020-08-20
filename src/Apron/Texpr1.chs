{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE StandaloneDeriving       #-}
module Apron.Texpr1 where

{# import Apron.Environment #}
{# import Apron.Coeff #}
{# import Apron.Scalar #}
    
#include "ap_texpr1.h"    

{#pointer *ap_texpr1_t as Texpr1 foreign newtype#}

-- Constructors and destructors

{#fun ap_texpr1_cst as ^ { `Environment', `Coeff' } -> `Texpr1' #}
{#fun ap_texpr1_cst_scalar as ^ { `Environment', `Scalar' } -> `Texpr1' #}
{#fun ap_texpr1_cst_interval_top as ^ { `Environment' } -> `Texpr1' #}

{#fun ap_texpr1_free as ^ { `Texpr1' } -> `()' #}



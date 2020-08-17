module Apron.Manager where
import           Foreign
import           Foreign.C

#include "ap_manager.h"

{#pointer *ap_manager_t as Manager foreign newtype#}

{#pointer *ap_option_t as Option foreign newtype#}
{#pointer *ap_funopt_t as FunOpt foreign newtype#}

{#pointer *ap_result_t as Result foreign newtype#}
 

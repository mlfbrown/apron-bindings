{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE ForeignFunctionInterface #-}
module Apron.Lincons1 where
import Foreign.C

{# import Apron.Environment #}
    
#include "ap_lincons1.h"

-- Lincons1  
 
{#pointer *ap_lincons1_t as Lincons1 foreign newtype#}


-- Lincons1 arrays

{#pointer *ap_lincons1_array_t as Lincons1Array foreign newtype#}    

#c
struct ap_lincons1_array_t * ap_lincons1_array_make_wrapper (ap_environment_t* env, size_t size) {
  struct ap_lincons1_array arr = ap_lincons1_array_make(env, size);
  arr_mem = malloc(sizeof(ap_lincons1_array));
  memcpy(arr_mem, arr, sizeof(ap_lincons1_array));
  return arr_mem;
}
#endc 

{#fun ap_lincons1_array_make_wrapper as ^ { `Environment', `CULong' } -> `Lincons1Array' #}




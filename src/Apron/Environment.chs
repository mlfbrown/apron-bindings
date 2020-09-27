{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE ForeignFunctionInterface #-}
module Apron.Environment where
import           Foreign.Concurrent
import           Foreign hiding (addForeignPtrFinalizer, void)
import Foreign.C.String    
import           Foreign.C
import Control.Monad (void)

{# import Apron.Var #}
{# import Apron.Dimension #}
    
#include <limits.h>
#include "ap_environment.h"
#include "wrappers.h" 

{#pointer *ap_environment_t as Environment foreign newtype#}

-- Memory management, constructors, destructors

{#fun ap_environment_free2 as ^ { `Environment' } -> `()' #}
 
{#fun ap_environment_free_wrapper as ^ { `Environment' } -> `()' #}

{#fun ap_environment_copy_wrapper as ^ { `Environment' } -> `Environment' #}

{#fun print_environment as ^ { `Environment' } -> `()' #}

------ name_of_dim_alloc: not allowing, unsized array in struct
------ name_of_dim_free: not allowing, unsized array in struct
 
{#fun ap_environment_alloc_empty as ^ { } -> `Environment' #}


foreign import ccall "ap_environment_alloc_wrapper"
  apEnvironmentAllocWrapper'_ :: Ptr CString -> CULong -> Ptr CString -> CULong -> IO (Ptr Environment)

apEnvironmentAllocWrapper :: Ptr CString -> CULong -> Ptr CString -> CULong -> IO Environment
apEnvironmentAllocWrapper idims idim rdims rdim = do
  cptr <- apEnvironmentAllocWrapper'_ idims idim rdims rdim
  fptr <- newForeignPtr_ cptr
  return $ Environment fptr

apEnvironmentAlloc :: [String] -> [String] -> IO Environment
apEnvironmentAlloc idims rdims = do
  let iLen = length idims
      rLen = length rdims
  c_idims <- makeVarArray idims
  c_rdims <- makeVarArray rdims
  env@(Environment envFPtr) <- apEnvironmentAllocWrapper
    c_idims (fromIntegral iLen)
    c_rdims (fromIntegral rLen)
  addForeignPtrFinalizer envFPtr $ do freeVarArray c_idims iLen
                                      freeVarArray c_rdims rLen
  return env

     where makeVarArray arr = newArray =<< traverse newCString arr
           freeVarArray ptr n = do
             strs <- peekArray n ptr
             void $ traverse free strs
             free ptr


{#fun ap_environment_add as ^ { `Environment', `Var', `CULong', `Var', `CULong' } -> `Environment' #}

{#fun ap_environment_add_perm as ^ { `Environment', `Var', `CULong', `Var', `CULong', `DimPerm' } -> `Environment' #}

{#fun ap_environment_remove as ^ { `Environment', `Var', `CULong' } -> `Environment' #}

-- Tests

{#fun ap_environment_is_eq as ^ { `Environment', `Environment' } -> `Bool' #}

{#fun ap_environment_is_leq as ^ { `Environment', `Environment' } -> `Bool' #}

{#fun ap_environment_compare as ^ { `Environment', `Environment' } -> `CInt' #}

{#fun ap_environment_hash as ^ { `Environment' } -> `CInt' #}   

-- var of dim, gcc is very upset

{#fun ap_environment_mem_var_wrapper as ^ { `Environment', %`Var'} -> `Bool' #}

-- Least common enviroments and conversion permutations (NOT DOING)

-- Variable renaming

{#fun ap_environment_rename as ^ { `Environment', `Var', `Var', `CULong', `DimPerm' } -> `Environment' #}

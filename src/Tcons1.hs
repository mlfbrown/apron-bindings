module Tcons1 ( Tcons1
              , tconsMake
              , tconsFromLincons
              , tconsCopy
              -- * Access
              , tconsGetScalar
              , tconsGetExpr
              -- * Tcons arrays
              , Tcons1Array
              , tconsArrayMake
              , tconsArrayClear
              -- * Access
              , tconsArraySize
              , tconsArrayGetIndex
              -- * Setters
              , tconsArrayClearIndex
              , tconsArrayClearIndecies
              , tconsArraySetIndex
              , tconsArraySetIndecies
              ) where
import           AbstractMonad
import           Apron.Lincons1
import           Apron.Scalar
import           Apron.Tcons1
import           Apron.Texpr1
import           Apron.Var
import           Data.Word

tconsMake :: Constyp
          -> Texpr1
          -> Scalar
          -> Abstract Tcons1
tconsMake = undefined

tconsFromLincons :: Lincons1
                 -> Abstract Tcons1
tconsFromLincons = undefined

tconsCopy :: Tcons1 -> Abstract Tcons1
tconsCopy = undefined

-- Access

tconsGetScalar :: Tcons1 -> Abstract Scalar
tconsGetScalar = undefined

tconsGetExpr :: Tcons1 -> Abstract Texpr1
tconsGetExpr = undefined

---
--- Tcons array
---

tconsArrayMake :: Word32 -> Abstract Tcons1Array
tconsArrayMake = undefined

tconsArrayClear :: Tcons1Array -> Abstract ()
tconsArrayClear = undefined

-- Access

tconsArraySize :: Tcons1Array -> Abstract Word32
tconsArraySize = undefined

tconsArrayGetIndex :: Tcons1Array -> Word32 -> Abstract Tcons1
tconsArrayGetIndex = undefined

-- Setters

tconsArrayClearIndex :: Tcons1Array -> Abstract ()
tconsArrayClearIndex = undefined

tconsArrayClearIndecies :: Tcons1Array -> Abstract ()
tconsArrayClearIndecies = undefined

tconsArraySetIndex :: Tcons1Array -> Word32 -> Tcons1 -> Abstract ()
tconsArraySetIndex = undefined

tconsArraySetIndecies :: Tcons1Array -> [(Word32, Tcons1)] -> Abstract ()
tconsArraySetIndecies = undefined

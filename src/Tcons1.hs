module Tcons1 ( Tcons1
              , tconsMake
              , tconsFromLincons
              , tconsCopy
              , tconsPrint
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
import           Control.Monad              (void)
import           Control.Monad.State.Strict (liftIO)
import           Data.Word

tconsMake :: Constyp
          -> Texpr1
          -> Scalar
          -> Abstract Tcons1
tconsMake = liftIO3 apTcons1MakeWrapper

tconsFromLincons :: Lincons1
                 -> Abstract Tcons1
tconsFromLincons = liftIO1 apTcons1FromLincons1Wrapper

tconsCopy :: Tcons1 -> Abstract Tcons1
tconsCopy = liftIO1 apTcons1CopyWrapper

tconsPrint :: Tcons1 -> Abstract ()
tconsPrint = liftIO1 apTcons1Print

-- Access

tconsGetScalar :: Tcons1 -> Abstract Scalar
tconsGetScalar = liftIO1 apTcons1ScalarrefWrapper

tconsGetExpr :: Tcons1 -> Abstract Texpr1
tconsGetExpr = liftIO1 apTcons1Texpr1refWrapper

---
--- Tcons array
---

tconsArrayMake :: Word32 -> Abstract Tcons1Array
tconsArrayMake size = do
  env <- getEnvironment
  liftIO $ apTcons1ArrayMakeWrapper env $ fromIntegral size

tconsArrayClear :: Tcons1Array -> Abstract ()
tconsArrayClear = liftIO1 apTcons1ArrayClear

-- Access

tconsArraySize :: Tcons1Array -> Abstract Word32
tconsArraySize a = do
  s <- liftIO $ apTcons1ArraySizeWrapper a -- Todo: checking?
  return $ fromIntegral s

tconsArrayGetIndex :: Tcons1Array -> Word32 -> Abstract Tcons1
tconsArrayGetIndex a i = liftIO $ apTcons1ArrayGetWrapper a $ fromIntegral i

-- Setters

tconsArrayClearIndex :: Tcons1Array -> Word32 -> Abstract ()
tconsArrayClearIndex a i = liftIO $ apTcons1ArrayClearIndexWrapper a $ fromIntegral i

tconsArrayClearIndecies :: Tcons1Array -> [Word32] -> Abstract ()
tconsArrayClearIndecies a is = mapM_ (tconsArrayClearIndex a) is

tconsArraySetIndex :: Tcons1Array -> Word32 -> Tcons1 -> Abstract ()
tconsArraySetIndex a i v = void $ liftIO $ apTcons1ArraySet a (fromIntegral i) v

tconsArraySetIndecies :: Tcons1Array -> [(Word32, Tcons1)] -> Abstract ()
tconsArraySetIndecies a vs = mapM_ (uncurry $ tconsArraySetIndex a) vs

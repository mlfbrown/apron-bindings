module Lincons1 ( Lincons1
                , linconsMake
                , linconsMakeWithScalar
                , linconsCopy
                , linconsPrint
                -- * Tests
                , linconsIsUnsat
                -- * Access
                , linconsGetScalar
                , linconsGetLinexpr
                , linconsGetConstant
                , linconsGetCoeff
                -- * Setters
                , linconsSetConstant
                , linconsSetCoeffs
                , linconsSetCoeff
                , linconsSetCoeffInterval
                -- * Lincons array creation
                , Lincons1Array
                , linconsArrayMake
                , linconsArraySize
                -- * Access
                , linconsArrayGetIndex
                -- * Setters
                , linconsArrayClearIndex
                , linconsArrayClearIndecies
                , linconsArraySetIndex
                , linconsArraySetIndecies
                ) where
import           AbstractMonad
import           Apron.Coeff
import           Apron.Lincons1
import           Apron.Linexpr1
import           Apron.Scalar
import           Coeff
import           Control.Monad              (void, unless)
import           Control.Monad.State.Strict (liftIO)
import           Data.List                  (nub)
import           Data.Word
import           Interval
import           Types                      hiding (d, f, i, s)

-- | Make a new constraint of the given type with the given expression, with no scalar.
linconsMake :: Constyp
            -> Linexpr1
            -> Abstract Lincons1
linconsMake = liftIO2 apLincons1MakeWrapperTwo

-- | Create a constraint of given type with the given expression.
linconsMakeWithScalar :: Constyp
                  -> Linexpr1
                  -> Scalar
                  -> Abstract Lincons1
linconsMakeWithScalar = liftIO3 apLincons1MakeWrapper

linconsCopy :: Lincons1 -> Abstract Lincons1
linconsCopy = liftIO1 apLincons1CopyWrapper

linconsPrint :: Lincons1 -> Abstract ()
linconsPrint = liftIO1 printLincons1

-- Tests

-- | True if the constraint is b>=0 or [a,b]>=0 with b negative.
linconsIsUnsat :: Lincons1 -> Abstract Bool
linconsIsUnsat = liftIO1 apLincons1IsUnsatWrapper

-- Access

-- | Get a reference to the auxiliary coefficient of the constraint.
linconsGetScalar :: Lincons1 -> Abstract Scalar
linconsGetScalar = liftIO1 apLincons1ScalarrefWrapper

-- | Get a reference to the underlying expression of the constraint.
linconsGetLinexpr :: Lincons1 -> Abstract Linexpr1
linconsGetLinexpr = liftIO1 apLincons1Linexpr1refWrapper

-- | Set the constant of the linear constraint.
linconsSetConstant :: Lincons1 -> Value -> Abstract ()
linconsSetConstant c v = do
  coeff <- coeffMake v
  liftIO $ apLincons1SetCstWrapper c coeff

-- | Get the constant of the linear constraint.
linconsGetConstant :: Lincons1 -> Abstract Coeff
linconsGetConstant = liftIO1 apLincons1CstrefWrapper

-- | Get a reference to the coefficient associated to the variable.
-- In case of sparse representation, possibly induce the addition of a new linear term.
-- Return NULL if var is unknown in the environment.
linconsGetCoeff :: Lincons1 -> VarName -> Abstract Coeff
linconsGetCoeff c name = do
  var <- getVar name
  liftIO $ apLincons1Coeffref c var

-- | Set the coefficients of variables var in the constraint.
linconsSetCoeffs :: Lincons1 -> [(VarName,Value)] -> Abstract ()
linconsSetCoeffs c vs = mapM_ (uncurry $ linconsSetCoeff c) vs

-- | Set the coefficient of variable var in the constraint.
linconsSetCoeff :: Lincons1 -> VarName -> Value -> Abstract ()
linconsSetCoeff c name v = do
  coeff <- coeffMake v
  var <- getVar name
  void $ liftIO $ apLincons1SetCoeffWrapper c var coeff

linconsSetCoeffInterval :: Lincons1 -> VarName -> Interval -> Abstract ()
linconsSetCoeffInterval = undefined

-- Lincons array

linconsArrayMake :: Word32 -> Abstract Lincons1Array
linconsArrayMake size = do
  env <- getEnvironment
  liftIO $ apLincons1ArrayMakeWrapper env $ fromIntegral size

-- Access

linconsArraySize :: Lincons1Array -> Abstract Word32
linconsArraySize arr = do
  size <- liftIO $ apLincons1ArraySizeWrapper arr
  return $ fromIntegral size

-- | Clear the constraint at index index.
linconsArrayClearIndex :: Lincons1Array -> Word32 -> Abstract ()
linconsArrayClearIndex arr i = liftIO $ apLincons1ArrayClearIndexWrapper arr $ fromIntegral i

-- | Clear the constraints the the indecies idxs
linconsArrayClearIndecies :: Lincons1Array -> [Word32] -> Abstract ()
linconsArrayClearIndecies arr idxs = do
  unless (nub idxs == idxs) $ error $ unwords [ "Tried to clear index multiple times:"
                                              , show idxs
                                              ]
  mapM_ (linconsArrayClearIndex arr) idxs

-- | Return the linear constraint of the given index.
linconsArrayGetIndex :: Lincons1Array -> Word32 -> Abstract Lincons1
linconsArrayGetIndex arr i = liftIO $ apLincons1ArrayGetWrapper arr $ fromIntegral i

-- | Fill the index of the array with the constraint.
linconsArraySetIndex :: Lincons1Array -> Word32 -> Lincons1 -> Abstract ()
linconsArraySetIndex arr i c = liftIO $ apLincons1ArraySet arr (fromIntegral i) c

-- | Fill in the indexies of the array with the constraints.
linconsArraySetIndecies :: Lincons1Array -> [(Word32, Lincons1)] -> Abstract ()
linconsArraySetIndecies arr cs = do
  unless (nub idxs == idxs) $ error $ unwords [ "Tried to set index multiple times:"
                                              , show idxs
                                              ]
  mapM_ (uncurry $ linconsArraySetIndex arr) cs
  where idxs = map fst cs

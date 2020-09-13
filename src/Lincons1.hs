module Lincons1 ( Lincons1
                , linconsMake
                , linconsCopy
                -- * Tests
                , linconsIsUnsat
                -- * Access and setters
                , linconsScalar
                , linconsLinexpr
                , linconsSetConstant
                , linconsGetConstant
                , linconsGetCoeff
                , linconsSetCoeffs
                , linconsSetCoeff
                -- * Lincons array creation
                , Lincons1Array
                , linconsArrayMake
                , linconsArraySize
                -- * Access
                , linconsArrayClearIndex
                , linconsArrayGetIndex
                , linconsArraySetIndex
                ) where
import           AbstractMonad
import           Apron.Coeff
import           Apron.Lincons1
import           Apron.Linexpr1
import           Apron.Scalar
import           Apron.Var
import           Coeff
import           Control.Monad.State.Strict (liftIO)
import           Data.Word
import           Types

-- | Create a constraint of given type with the given expression.
linconsMake :: Constyp
            -> Linexpr1
            -> Scalar
            -> Abstract Lincons1
linconsMake = liftIO3 apLincons1MakeWrapper

-- unsat?

linconsCopy :: Lincons1 -> Abstract Lincons1
linconsCopy = liftIO1 apLincons1CopyWrapper

-- Tests

-- | True if the constraint is b>=0 or [a,b]>=0 with b negative.
linconsIsUnsat :: Lincons1 -> Abstract Bool
linconsIsUnsat = liftIO1 apLincons1IsUnsatWrapper

-- Access

-- | Get a reference to the auxiliary coefficient of the constraint.
linconsScalar :: Lincons1 -> Abstract Scalar
linconsScalar = liftIO1 apLincons1ScalarrefWrapper

-- | Get a reference to the underlying expression of the constraint.
linconsLinexpr :: Lincons1 -> Abstract Linexpr1
linconsLinexpr = liftIO1 apLincons1Linexpr1refWrapper

-- | Set the constant of the linear constraint.
linconsSetConstant :: Lincons1 -> Coeff -> Abstract ()
linconsSetConstant = liftIO2 apLincons1SetCstWrapper

-- | Get the constant of the linear constraint.
linconsGetConstant :: Lincons1 -> Abstract Coeff
linconsGetConstant = liftIO1 apLincons1CstrefWrapper

-- | Get a reference to the coefficient associated to the variable.
-- In case of sparse representation, possibly induce the addition of a new linear term.
-- Return NULL if var is unknown in the environment.
linconsGetCoeff :: Lincons1 -> Var -> Abstract Coeff
linconsGetCoeff = liftIO2 apLincons1Coeffref

-- | Set the coefficients of variables var in the constraint.
-- Return true if any var is unknown in the environment.
linconsSetCoeffs :: Lincons1 -> [(Var,Value)] -> Abstract Bool
linconsSetCoeffs c vs = do
  succs <- mapM (uncurry $ linconsSetCoeff c) vs
  return $ or succs

-- | Set the coefficient of variable var in the constraint.
--  Return true if var is unknown in the environment.
linconsSetCoeff :: Lincons1 -> Var -> Value -> Abstract Bool
linconsSetCoeff c var v = do
  coeff <- makeCoeff v
  liftIO $ apLincons1SetCoeffWrapper c var coeff

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
linconsArrayClearIndex = undefined
-- linconsArrayClearIndex arr i = liftIO $ apLincons1ArrayClearIndexWrapper arr $ fromIntegral i

-- | Return the linear constraint of the given index.
linconsArrayGetIndex :: Lincons1Array -> Word32 -> Abstract Lincons1
linconsArrayGetIndex arr i = liftIO $ apLincons1ArrayGetWrapper arr $ fromIntegral i

-- | Fill the index of the array with the constraint.
linconsArraySetIndex :: Lincons1Array -> Word32 -> Lincons1 -> Abstract ()
linconsArraySetIndex arr i c = liftIO $ apLincons1ArraySet arr (fromIntegral i) c















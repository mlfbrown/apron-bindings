module Texpr1 ( Texpr1
              , OpType(..)
              , RoundingType(..)
              , RoundingDir(..)
              , texprMakeConstant
              , texprMakeLeafVar
              , texprMakeUnOp
              , texprMakeBinOp
              , texprFromLinexpr
              , texprCopy
              , texprPrint
              -- * Tests
              , texprHasVar
              , texprIsConstant
              , texprIsLinear
              , texprIsPolynomial
              , texprIsPolyfrac
              , texprIsScalar
              -- * Operations
              , texprSubstitute
              ) where
import           AbstractMonad
import           Apron.Texpr1
import           Coeff
import           Control.Monad.State.Strict (liftIO)
import           Linexpr1
import           Types                      hiding (d, f, i, s)

-- Constructors, etc

texprMakeConstant :: Value -> Abstract Texpr1
texprMakeConstant v = do
  env <- getEnvironment
  c <- coeffMake v
  liftIO $ apTexpr1Cst env c

texprMakeLeafVar :: VarName -> Abstract Texpr1
texprMakeLeafVar v = do
  env <- getEnvironment
  var <- getVar v
  liftIO $ apTexpr1Var env var

texprMakeUnOp :: OpType
              -> Texpr1
              -> RoundingType
              -> RoundingDir
              -> Abstract Texpr1
texprMakeUnOp = liftIO4 apTexpr1Unop

texprMakeBinOp :: OpType
               -> Texpr1
               -> Texpr1
               -> RoundingType
               -> RoundingDir
               -> Abstract Texpr1
texprMakeBinOp = liftIO5 apTexpr1Binop

texprFromLinexpr :: Linexpr1 -> Abstract Texpr1
texprFromLinexpr = liftIO1 apTexpr1FromLinexpr1

texprCopy :: Texpr1 -> Abstract Texpr1
texprCopy = liftIO1 apTexpr1Copy

texprPrint :: Texpr1 -> Abstract ()
texprPrint = liftIO1 apTexpr1Print

-- Tests

texprHasVar :: Texpr1 -> VarName -> Abstract Bool
texprHasVar e v = do
  var <- getVar v
  liftIO $ apTexpr1HasVar e var

texprIsConstant :: Texpr1 -> Abstract Bool
texprIsConstant = liftIO1 apTexpr1IsIntervalCstWrapper

texprIsLinear :: Texpr1 -> Abstract Bool
texprIsLinear = liftIO1 apTexpr1IsIntervalLinearWrapper

texprIsPolynomial :: Texpr1 -> Abstract Bool
texprIsPolynomial = liftIO1 apTexpr1IsIntervalPolynomialWrapper

texprIsPolyfrac :: Texpr1 -> Abstract Bool
texprIsPolyfrac = liftIO1 apTexpr1IsIntervalPolyfracWrapper

texprIsScalar :: Texpr1 -> Abstract Bool
texprIsScalar = liftIO1 apTexpr1IsScalarWrapper

-- Operations

texprSubstitute :: Texpr1 -> VarName -> Texpr1 -> Abstract Texpr1
texprSubstitute e v d = do
  var <- getVar v
  liftIO $ apTexpr1Substitute e var d



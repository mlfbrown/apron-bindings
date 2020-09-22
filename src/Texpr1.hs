module Texpr1 ( Texpr1
              , texprMakeConstant
              , texprMakeLeafVar
              , texprFromLinexpr
              , texprCopy
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
import           Apron.Var
import           Coeff
import           Control.Monad.State.Strict (liftIO)
import           Linexpr1
import           Types

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

texprFromLinexpr :: Linexpr1 -> Abstract Texpr1
texprFromLinexpr = liftIO1 apTexpr1FromLinexpr1

texprCopy :: Texpr1 -> Abstract Texpr1
texprCopy = liftIO1 apTexpr1Copy

-- Tests

texprHasVar :: Texpr1 -> VarName -> Abstract Bool
texprHasVar = undefined

texprIsConstant :: Texpr1 -> Abstract Bool
texprIsConstant = undefined

texprIsLinear :: Texpr1 -> Abstract Bool
texprIsLinear = undefined

texprIsPolynomial :: Texpr1 -> Abstract Bool
texprIsPolynomial = undefined

texprIsPolyfrac :: Texpr1 -> Abstract Bool
texprIsPolyfrac = undefined

texprIsScalar :: Texpr1 -> Abstract Bool
texprIsScalar = undefined

-- Operations

texprSubstitute :: Texpr1 -> VarName -> Texpr1 -> Abstract Texpr1
texprSubstitute = undefined



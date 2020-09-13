module Texpr1 ( Texpr1
              , texprMake
              ) where
import           AbstractMonad
import           Apron.Texpr1
import           Coeff
import           Control.Monad.State.Strict (liftIO)
import           Linexpr1
import           Types

-- Constructors

texprMake :: Value -> Abstract Texpr1
texprMake v = do
  env <- getEnvironment
  c <- coeffMake v
  liftIO $ apTexpr1Cst env c



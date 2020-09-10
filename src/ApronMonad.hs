{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module ApronMonad where
import qualified Control.Monad.Fail         as Fail
import           Control.Monad.State.Strict

data Domain = Intervals
            | Polyhedra
            | Octagons
            | Zonotopes
            deriving (Eq, Ord, Show)

data AbstractState = AbstractState { domain :: Domain
                                   }

-- | Bolector monad, keeping track of underlying solver state.
newtype Abstract a = Abstract { unAbstractState :: StateT AbstractState IO a }
    deriving (Functor, Applicative, Monad, MonadState AbstractState, MonadIO, Fail.MonadFail)




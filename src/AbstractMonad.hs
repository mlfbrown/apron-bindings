{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module AbstractMonad where
import           Apron.Environment
import           Apron.Manager
import           Apron.Var
import qualified Control.Monad.Fail         as Fail
import           Control.Monad.State.Strict
import qualified Data.Map                   as M

data Domain = Intervals
            | Polyhedra
            | Octagons
            | Zonotopes
            deriving (Eq, Ord, Show)

type VarName = String
type NumIntVars = Int
type NumRealVars = Int

data AbstractState = AbstractState { domain      :: Domain
                                   , manager     :: Manager
                                   , environment :: Environment
                                   , vars        :: M.Map VarName Var
                                   }

-- | Monad for a given analysis
newtype Abstract a = Abstract { unAbstractState :: StateT AbstractState IO a }
    deriving (Functor, Applicative, Monad, MonadState AbstractState, MonadIO, Fail.MonadFail)

initAbstractState :: Domain
                 -> NumIntVars
                 -> NumRealVars
                 -> [VarName]
                 -> Abstract ()
initAbstractState domain intVars realVars varNames
  | intVars + realVars == length varNames = error "Not done"
      -- use the correct manager alloc function depending on the domain
      -- make var name array
      -- pass it and the numbers to the environment allocator
      -- store the new environment and var map in the abstract state
  | otherwise = error $ unwords ["Expected"
                                , show $ length varNames
                                , "vars, but got"
                                , show intVars
                                , "and"
                                , show realVars]





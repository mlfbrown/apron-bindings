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

data AbstractState = AbstractState { unDomain      :: Domain
                                   , unManager     :: Manager
                                   , unEnvironment :: Environment
                                   , unIntVars     :: [VarName]
                                   , unRealVars    :: [VarName]
                                   , unVars        :: M.Map VarName Var
                                   }

-- | Monad for a given analysis
newtype Abstract a = Abstract { unAbstractState :: StateT AbstractState IO a }
    deriving (Functor, Applicative, Monad, MonadState AbstractState, MonadIO, Fail.MonadFail)

initAbstractState :: Domain
                 -> [VarName]
                 -> [VarName]
                 -> Abstract ()
initAbstractState domain intVars realVars = do
  intVarArr <- liftIO $ makeVarArray intVars
  realVarArr <- liftIO $ makeVarArray realVars
  -- Make the environment
  manager <- case domain of
               Intervals -> liftIO boxManagerAlloc
               _ -> error $ unwords [ "Unsupported domain:"
                                    , show domain
                                    ]
  s0 <- get
  put $ s0 { unDomain   = domain
           , unManager  = manager
           , unIntVars  = intVars
           , unRealVars = realVars
           }


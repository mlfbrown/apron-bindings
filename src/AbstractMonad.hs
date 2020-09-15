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

data AbstractState = AbstractState { unDomain      :: Domain
                                   , unManager     :: Manager
                                   , unEnvironment :: Environment
                                   , unVars        :: M.Map VarName Var
                                   }

-- | Monad for a given analysis
newtype Abstract a = Abstract { unAbstractState :: StateT AbstractState IO a }
    deriving (Functor, Applicative, Monad, MonadState AbstractState, MonadIO, Fail.MonadFail)

-- | Evaluate an abstract action with a given configurations.
evalAbstract :: AbstractState -> Abstract a -> IO a
evalAbstract aState act = evalStateT (unAbstractState act) aState

defaultState :: AbstractState
defaultState = AbstractState Intervals undefined undefined M.empty

getDomain :: Abstract Domain
getDomain = gets unDomain

getManager :: Abstract Manager
getManager = gets unManager

getEnvironment :: Abstract Environment
getEnvironment = gets unEnvironment

getVar :: VarName -> Abstract Var
getVar v = do
  vs <- gets unVars
  case M.lookup v vs of
    Just v  -> return v
    Nothing -> error $ unwords ["No var", show v, "in current environment"]

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
  put $ s0 { unDomain  = domain
           , unManager = manager
           , unVars    = M.empty
           }

liftIO1 :: MonadIO m => (a -> IO b) -> a -> m b
liftIO1 = (.) liftIO

-- | Lift an 'IO' operation with 2 arguments into another monad
liftIO2 :: MonadIO m => (a -> b -> IO c) -> a -> b -> m c
liftIO2 = ((.).(.)) liftIO

-- | Lift an 'IO' operation with 3 arguments into another monad
liftIO3 :: MonadIO m => (a -> b -> c -> IO d) -> a -> b -> c -> m d
liftIO3 = ((.).((.).(.))) liftIO

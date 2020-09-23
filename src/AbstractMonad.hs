{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module AbstractMonad where
import           Apron.Environment
import           Apron.Manager
import           Apron.Var
import qualified Control.Monad.Fail         as Fail
import           Control.Monad.State.Strict
import           Data.List                  (nub)
import qualified Data.Map                   as M
import           Foreign.C.String

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

initVar :: VarName -> Abstract ()
initVar v = do
  str <- liftIO $ newCString v
  var <- liftIO $ makeVar str
  s0 <- get
  put $ s0 { unVars = M.insert v var $ unVars s0 }

getVar :: VarName -> Abstract Var
getVar v = do
  vs <- gets unVars
  case M.lookup v vs of
    Nothing -> error $ unwords [ "Variable", v, "does not exist in environment" ]
    Just var -> return var

initAbstractState :: Domain
                 -> [VarName]
                 -> [VarName]
                 -> Abstract ()
initAbstractState domain intVars realVars = do
  unless (intVars == nub intVars)   $ error $ unwords [ "Dupe int vars",  show intVars  ]
  unless (realVars == nub realVars) $ error $ unwords [ "Dupe real vars", show realVars ]
  env <- liftIO $ apEnvironmentAlloc intVars realVars
  manager <- case domain of
               Intervals -> liftIO boxManagerAlloc
               _ -> error $ unwords [ "Unsupported domain:"
                                    , show domain
                                    ]
  forM_ (intVars ++ realVars) initVar
  s0 <- get
  put $ s0 { unDomain      = domain
           , unManager     = manager
           , unEnvironment = env
           }

liftIO1 :: MonadIO m => (a -> IO b) -> a -> m b
liftIO1 = (.) liftIO

-- | Lift an 'IO' operation with 2 arguments into another monad
liftIO2 :: MonadIO m => (a -> b -> IO c) -> a -> b -> m c
liftIO2 = ((.).(.)) liftIO

-- | Lift an 'IO' operation with 3 arguments into another monad
liftIO3 :: MonadIO m => (a -> b -> c -> IO d) -> a -> b -> c -> m d
liftIO3 = ((.).((.).(.))) liftIO

-- | Lift an 'IO' operation with 4 arguments into another monad
liftIO4 :: MonadIO m => (a -> b -> c -> d -> IO e) -> a -> b -> c -> d -> m e
liftIO4 = ((.).((.).((.).(.)))) liftIO

-- | Lift an 'IO' operation with 5 arguments into another monad
liftIO5 :: MonadIO m => (a -> b -> c -> d -> e -> IO f) -> a -> b -> c -> d -> e -> m f
liftIO5 = ((.).((.).((.).((.).(.))))) liftIO


module Abstract1 ( Abstract1
                 , abstractBottom
                 , abstractOfLinconsArray
                 , abstractOfTconsArray
                 -- * Accessors
                 , abstractGetEnvironment
                 -- * Meet and join
                 , abstractMeet
                 , abstractJoin
                 ) where
import           AbstractMonad
import           Apron.Abstract1
import           Apron.Environment
import           Apron.Lincons1
import           Apron.Tcons1
import           Control.Monad.State.Strict (liftIO)
import           Data.Word

-- Constructors

abstractBottom :: Abstract Abstract1
abstractBottom = undefined
  -- man <- getManager
  -- env <- getEnvironment
  -- liftIO $ apAbstract1BottomWrapper man env

abstractOfLinconsArray :: Lincons1Array -> Abstract Abstract1
abstractOfLinconsArray arr = do
  man <- getManager
  env <- getEnvironment
  liftIO $ apAbstract1OfLinconsArrayWrapper man env arr

abstractOfTconsArray :: Tcons1Array -> Abstract Abstract1
abstractOfTconsArray arr = do
  man <- getManager
  env <- getEnvironment
  liftIO $ apAbstract1OfTconsArrayWrapper man env arr

-- Accessors

abstractGetEnvironment :: Abstract1 -> Abstract Environment
abstractGetEnvironment a = do
  man <- getManager
  liftIO $ apAbstract1Environment man a

-- Operations

-- | Meet of two abstract values.
abstractMeet :: Abstract1 -> Abstract1 -> Abstract Abstract1
abstractMeet a1 a2 = do
  man <- getManager
  liftIO $ apAbstract1MeetWrapper man False a1 a2

-- | Join of two abstract values.
abstractJoin :: Abstract1 -> Abstract1 -> Abstract Abstract1
abstractJoin a1 a2 = do
  man <- getManager
  liftIO $ apAbstract1JoinWrapper man False a1 a2

abstractArrayMeet :: Abstract1 -> Word32 -> Abstract Abstract1
abstractArrayMeet a size = do
  man <- getManager
  liftIO $ apAbstract1MeetArrayWrapper man a $ fromIntegral size

abstractArrayJoin :: Abstract1 -> Word32 -> Abstract Abstract1
abstractArrayJoin a size = do
  man <- getManager
  liftIO $ apAbstract1JoinArrayWrapper man a $ fromIntegral size

abstractLinconsArrayMeet :: Abstract1 -> Lincons1Array -> Abstract Abstract1
abstractLinconsArrayMeet a arr = do
  man <- getManager
  liftIO $ apAbstract1MeetLinconsArrayWrapper man False a arr

abstractTconsArrayMeet :: Abstract1 -> Tcons1Array -> Abstract Abstract1
abstractTconsArrayMeet a arr = do
  man <- getManager
  liftIO $ apAbstract1MeetTconsArrayWrapper man False a arr

abstractUnify :: Abstract1 -> Abstract1 -> Abstract Abstract1
abstractUnify = undefined

-- | Put the abstract value in canonical form. (not yet clear definition).
abstractCannonicalize :: Abstract1 -> Abstract ()
abstractCannonicalize = undefined

-- | Minimize the size of the representation of the abstract input.
-- his may result in a later recomputation of internal information.
abstractMinimize :: Abstract1 -> Abstract ()
abstractMinimize = undefined

-- Assignment

abstractAssignLinexprArray = undefined

abstractSubstituteLinexprArray = undefined

abstractAssignTexprArray = undefined

abstractSubstituteTexprArray = undefined
-- cannon
-- assign linexpr
-- fold
-- meet lincons array

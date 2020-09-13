module Abstract1 ( Abstract1
                 , abstractBottom
                 , abstractOfLinconsArray
                 , abstractOfTconsArray
                 -- * Accessors
                 , abstractEnvironment
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

abstractEnvironment :: Abstract1 -> Abstract Environment
abstractEnvironment a = do
  man <- getManager
  liftIO $ apAbstract1Environment man a

-- Meet and join

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

module Abstract1 ( Abstract1
                 , abstractBottom
                 , abstractTop
                 , abstractOfLinconsArray
                 , abstractToLinconsArray
                 , abstractOfTconsArray
                 , abstractToTconsArray
                 , abstractPrint
                 -- * Environment
                 , abstractGetEnvironment
                 , abstractChangeEnvironment
                 , abstractMinimizeEnvironment
                 , abstractUpdateEnvironment
                 -- * Tests
                 , abstractIsTop
                 , abstractIsBottom
                 , abstractIsLeq
                 , abstractIsEq
                 , abstractSatLincons
                 , abstractSatTcons
                 , abstractVarIsUnconstrained
                 -- * Extract properties
                 , abstractBoundLinexpr
                 , abstractBoundTexpr
                 , abstractBoundVar
                 -- * Operations
                 , abstractMeet
                 , abstractJoin
                 , abstractArrayMeet
                 , abstractArrayJoin
                 , abstractLinconsArrayMeet
                 , abstractTconsArrayMeet
                 , abstractUnify
                 , abstractCanonicalize
                 , abstractMinimize
                 -- * Expand, fold, widen, closure
                 , abstractExpand
                 , abstractFold
                 , abstractWiden
                 , abstractClosure
                 ) where
import           AbstractMonad
import           Apron.Abstract1
import           Apron.Environment
import           Apron.Interval
import           Apron.Lincons1
import           Apron.Linexpr1
import           Apron.Tcons1
import           Apron.Texpr1
import           Control.Monad.State.Strict
import           Data.Word
import           Var

import           Apron.Var
import           Foreign                    hiding (addForeignPtrFinalizer,
                                             void)
import           Foreign.C.String
import           Foreign.Concurrent

-- Constructors

abstractBottom :: Abstract Abstract1
abstractBottom = do
  man <- getManager
  env <- getEnvironment
  liftIO $ apAbstract1BottomWrapper man env

abstractTop :: Abstract Abstract1
abstractTop = do
  man <- getManager
  env <- getEnvironment
  liftIO $ apAbstract1TopWrapper man env

abstractOfLinconsArray :: Lincons1Array -> Abstract Abstract1
abstractOfLinconsArray arr = do
  man <- getManager
  env <- getEnvironment
  liftIO $ apAbstract1OfLinconsArrayWrapper man env arr

abstractToLinconsArray :: Abstract1 -> Abstract Lincons1Array
abstractToLinconsArray a = do
  man <- getManager
  liftIO $ apAbstract1ToLinconsArrayWrapper man a

abstractToTconsArray :: Abstract1 -> Abstract Tcons1Array
abstractToTconsArray a = do
  man <- getManager
  liftIO $ apAbstract1ToTconsArrayWrapper man a

abstractOfTconsArray :: Tcons1Array -> Abstract Abstract1
abstractOfTconsArray arr = do
  man <- getManager
  env <- getEnvironment
  liftIO $ apAbstract1OfTconsArrayWrapper man env arr

-- Printing

abstractPrint :: Abstract1 -> Abstract ()
abstractPrint a = do
  man <- getManager
  liftIO $ printAbstract1 man a

-- Environment

abstractGetEnvironment :: Abstract1 -> Abstract Environment
abstractGetEnvironment a = do
  man <- getManager
  liftIO $ apAbstract1Environment man a

-- | Change the abstract environment
abstractChangeEnvironment :: Abstract1
                          -> Environment
                          -> Bool
                          -> Abstract Abstract1
abstractChangeEnvironment a env proj = do
  man <- getManager
  liftIO $ apAbstract1ChangeEnvironmentWrapper man False a env proj

-- | Remove from the environment of the abstract value
-- variables that are unconstrained in it.
abstractMinimizeEnvironment :: Abstract1 -> Abstract Abstract1
abstractMinimizeEnvironment a = do
  man <- getManager
  liftIO $ apAbstract1MinimizeEnvironmentWrapper man False a

-- | Parallel renaming. The new variables should not interfere with
-- the variables that are not renamed.
abstractUpdateEnvironment :: Abstract1
                          -> [VarName]
                          -> [VarName]
                          -> Abstract Abstract1
abstractUpdateEnvironment a vns nvns = do
  man <- getManager
  vars <- makeVars vns
  newVars <- makeVars nvns
  liftIO $ apAbstract1RenameArrayWrapper man False a vars newVars $ fromIntegral len
  where len = length vns

-- Tests

abstractIsBottom :: Abstract1 -> Abstract Bool
abstractIsBottom a = do
  man <- getManager
  liftIO $ apAbstract1IsBottom man a

abstractIsTop :: Abstract1 -> Abstract Bool
abstractIsTop a = do
  man <- getManager
  liftIO $ apAbstract1IsTop man a

abstractIsLeq :: Abstract1 -> Abstract1 -> Abstract Bool
abstractIsLeq a1 a2 = do
  man <- getManager
  liftIO $ apAbstract1IsLeq man a1 a2

abstractIsEq :: Abstract1 -> Abstract1 -> Abstract Bool
abstractIsEq a1 a2 = do
  man <- getManager
  liftIO $ apAbstract1IsEq man a1 a2

abstractSatLincons :: Abstract1 -> Lincons1 -> Abstract Bool
abstractSatLincons a c = do
  man <- getManager
  liftIO $ apAbstract1SatLincons man a c

abstractSatTcons :: Abstract1 -> Tcons1 -> Abstract Bool
abstractSatTcons a c = do
  man <- getManager
  liftIO $ apAbstract1SatTcons man a c

abstractVarIsUnconstrained :: Abstract1 -> VarName -> Abstract Bool
abstractVarIsUnconstrained a v = do
  man <- getManager
  var <- getVar v
  liftIO $ apAbstract1IsVariableUnconstrained man a var

-- Extracting properties

abstractBoundLinexpr :: Abstract1 -> Linexpr1 -> Abstract Interval
abstractBoundLinexpr a e = do
  man <- getManager
  liftIO $ apAbstract1BoundLinexpr man a e

abstractBoundTexpr :: Abstract1 -> Texpr1 -> Abstract Interval
abstractBoundTexpr a t = do
  man <- getManager
  liftIO $ apAbstract1BoundTexpr man a t

abstractBoundVar :: Abstract1 -> VarName -> Abstract Interval
abstractBoundVar a v = do
  man <- getManager
  var <- getVar v
  liftIO $ apAbstract1BoundVariable man a var

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
abstractUnify a1 a2 = do
  man <- getManager
  liftIO $ apAbstract1UnifyWrapper man False a1 a2

-- | Put the abstract value in canonical form. (not yet clear definition).
abstractCanonicalize :: Abstract1 -> Abstract ()
abstractCanonicalize a = do
  man <- getManager
  liftIO $ apAbstract1Canonicalize man a

-- | Minimize the size of the representation of the abstract input.
-- his may result in a later recomputation of internal information.
abstractMinimize :: Abstract1 -> Abstract ()
abstractMinimize a = do
  man <- getManager
  liftIO $ apAbstract1Minimize man a

-- Expanding, folding, widening, closure

abstractExpand :: Abstract1
               -> VarName
               -> [VarName]
               -> Abstract Abstract1
abstractExpand a v vns = do
  man <- getManager
  var <- getVar v
  vars <- makeVars vns
  -- liftIO $ apAbstractExpandWrapper man False a var vars (fromIntegral $ length vns)
  -- Fix environment
  error "Issue with c2hs and expand wrapper"
  where len = length vns

abstractFold :: Abstract1 -> [VarName] -> Abstract Abstract1
abstractFold a1 vns = do
  man <- getManager
  vs <- makeVars vns
  -- Fix environment
  liftIO $ apAbstract1FoldWrapper man False a1 vs (fromIntegral $ length vns)

abstractWiden :: Abstract1 -> Abstract1 -> Abstract Abstract1
abstractWiden a1 a2 = do
  man <- getManager
  liftIO $ apAbstract1WideningWrapper man a1 a2

abstractClosure :: Abstract1 -> Abstract Abstract1
abstractClosure a = do
  man <- getManager
  liftIO $ apAbstract1ClosureWrapper man False a

module Var where
import           AbstractMonad
import           Apron.Var
import           Control.Monad              (void)
import           Control.Monad.State.Strict (liftIO, liftM)
import           Foreign                    hiding (addForeignPtrFinalizer,
                                             void)
import           Foreign.C.String
import           Foreign.Concurrent

-- | Given a list of variable names, make a pointer to a C list of variable representations
-- This is a really gross function.  We could unsafe cast the Var
-- foreign pointer to pointer, but that would be unsafe. Let's
-- instead just check the map for the var names and just create the
-- string array again.
makeVars :: [VarName] -> Abstract Var
makeVars vns = do
  mapM_ getVar vns -- fails if any of the vars are not in the map
  liftIO $ do
    cptr <- doMakeVarArray
    fptr <- castForeignPtr `liftM` newForeignPtr_ cptr
    addForeignPtrFinalizer fptr $ doFreeVarArray cptr
    return $ Var $  fptr
  where len = length vns
        doMakeVarArray = do
          newArray =<< traverse newCString vns
        doFreeVarArray ptr = do
             strs <- peekArray len ptr
             void $ traverse free strs
             free ptr


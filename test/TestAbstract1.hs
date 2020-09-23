module TestAbstract1 where
import           Apron.Abstract1
import           Apron.Environment
import           Apron.Lincons1
import           Apron.Linexpr1
import           Apron.Manager
import           Apron.Texpr1
import           Test.Tasty
import           Test.Tasty.HUnit


abstractTests = testGroup "Abstract tests" [ makeAbstractEmpty
                                           , makeAbstract ]

makeAbstractEmpty = testCase "Make abstract empty" $ do
  man <- boxManagerAlloc
  env <- apEnvironmentAllocEmpty
  arr <- apLincons1ArrayMakeWrapper env 2
  abstract <- apAbstract1OfLinconsArrayWrapper man env arr
  return ()

makeAbstract = testCase "Make abstract" $ do
  man <- boxManagerAlloc
  env <- apEnvironmentAlloc ["x", "y", "z"] ["u", "w", "v"]
  arr <- apLincons1ArrayMakeWrapper env 3
  abstract <- apAbstract1OfLinconsArrayWrapper man env arr
  return ()

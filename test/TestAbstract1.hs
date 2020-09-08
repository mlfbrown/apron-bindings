module TestAbstract1 where
import           Apron.Abstract1
import           Apron.Environment
import           Apron.Lincons1
import           Apron.Linexpr1
import           Apron.Manager
import           Apron.Texpr1
import           Test.Tasty
import           Test.Tasty.HUnit


abstractTests = testGroup "Abstract tests" [ makeAbstract ]

makeAbstract = testCase "Make abstract" $ do
  man <- boxManagerAllocWrapper
  env <- apEnvironmentAllocEmpty
  error ""
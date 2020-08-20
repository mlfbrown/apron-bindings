module TestTexpr1 where
import           Apron.Environment
import           Apron.Texpr1
import           Test.Tasty
import           Test.Tasty.HUnit

texprTests = testGroup "Texpr tests" [ makeTexpr ]

makeTexpr = testCase "Make texpr" $ do
  e <- apEnvironmentAllocEmpty
  t <- apTexpr1CstIntervalTop e
  apTexpr1Free t
  apEnvironmentFree2 e


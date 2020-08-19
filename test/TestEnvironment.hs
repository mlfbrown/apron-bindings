module TestEnvironment where
import           Apron.Environment as Env
import           Test.Tasty
import           Test.Tasty.HUnit

environmentTests = testGroup "Environment tests" [ makeEnvironment
                     --                            , doEnvironment
                                                 ]

makeEnvironment = testCase "Make environment" $ do
  e <- apEnvironmentAllocEmpty
  apEnvironmentFree2 e

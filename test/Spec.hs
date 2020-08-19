import           Test.Tasty
import           Test.Tasty.HUnit
import           TestEnvironment
import           TestScalar

main :: IO ()
main = defaultMain tests

tests = testGroup "All tests" [ scalarTests
                              , environmentTests
                              ]

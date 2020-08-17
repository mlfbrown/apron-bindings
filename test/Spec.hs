import           Test.Tasty
import           Test.Tasty.HUnit
import           TestScalar

main :: IO ()
main = defaultMain tests

tests = testGroup "All tests" [ scalarTests ]

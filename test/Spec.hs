import           Test.Tasty
import           Test.Tasty.HUnit
import           TestEnvironment
import           TestInterval
import           TestLincons1
import           TestScalar
import           TestTexpr1

main :: IO ()
main = defaultMain tests

tests = testGroup "All tests" [ scalarTests
                              , environmentTests
                              , linconsTests
                              , texprTests
                              , intervalTests
                              ]

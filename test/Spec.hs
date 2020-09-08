import           Test.Tasty
import           Test.Tasty.HUnit
import           TestAbstract1
import           TestCoeff
import           TestDimension
import           TestEnvironment
import           TestInterval
import           TestLincons1
import           TestLinexpr1
import           TestScalar
import           TestTexpr1

main :: IO ()
main = defaultMain tests

tests = testGroup "All tests" [ scalarTests
                              , environmentTests
                              , linconsTests
                              , texprTests
                              , intervalTests
                              , linexprTests
                              , coeffTests
                              , dimensionTests
                              , abstractTests
                              ]

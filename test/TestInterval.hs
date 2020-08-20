module TestInterval where
import           Apron.Interval
import           Test.Tasty
import           Test.Tasty.HUnit

intervalTests = testGroup "Interval tests" [ makeInterval ]

makeInterval = testCase "Make interval" $ do
  i <- apIntervalAlloc
  apIntervalFree i

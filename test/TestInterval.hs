module TestInterval where
import           Apron.Interval
import           Test.Tasty
import           Test.Tasty.HUnit

intervalTests = testGroup "Interval tests" [ makeInterval
                                           , topAndBottom
                                           ]

makeInterval = testCase "Make interval" $ do
  i <- apIntervalAlloc
  apIntervalFree i

topAndBottom = testCase "Top and bottom" $ do
  i <- apIntervalAlloc
  apIntervalSetTop i
  top <- apIntervalIsTop i
  bottom <- apIntervalIsBottom i
  top @?= True
  bottom @?= False
  apIntervalSetBottom i
  top' <- apIntervalIsTop i
  bottom' <- apIntervalIsBottom i
  top' @?= False
  bottom' @?= True
  apIntervalFree i

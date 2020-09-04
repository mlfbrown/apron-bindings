module TestDimension where
import           Apron.Dimension
import           Test.Tasty
import           Test.Tasty.HUnit

dimensionTests = testGroup "Dimension tests" [ makeDimension ]

makeDimension = testCase "Make dimension" $ do
  d <- apDimchangeAlloc 2 6
  return ()
  apDimchangeFreeWrapper d



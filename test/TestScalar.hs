module TestScalar where
import           Apron.Scalar     as Scalar
import           Test.Tasty
import           Test.Tasty.HUnit

scalarTests = testGroup "Scalar tests" [ makeScalar ]

makeScalar = testCase "Make scalar" $ do
  s <- apScalarAlloc
  apScalarFree s





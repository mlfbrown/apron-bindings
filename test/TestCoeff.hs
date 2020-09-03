module TestCoeff where
import           Apron.Coeff
import           Apron.Interval
import           Apron.Scalar
import           Test.Tasty
import           Test.Tasty.HUnit

coeffTests = testGroup "Coeff tests" [ makeCoeff ]

makeCoeff = testCase "Make coeff" $ do
  s <- apScalarAlloc
  c <- apCoeffAllocSetScalar s
  apCoeffFree c
  apScalarFree s


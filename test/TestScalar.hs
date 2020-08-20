module TestScalar where
import           Apron.Scalar     as Scalar
import           Test.Tasty
import           Test.Tasty.HUnit

scalarTests = testGroup "Scalar tests" [ makeScalar
--                                       , doScalar
                                       ]

makeScalar = testCase "Make scalar" $ do
  s <- apScalarAlloc
  apScalarFree s

doScalar = testCase "Do scalar" $ do
  s <- apScalarAllocSetDouble 1.2
  apScalarNeg s s
  apScalarInv s s
  _ <- apScalarHash s
  apScalarSetInfty s 0
  apScalarSetInt s 1
  apScalarSetDouble s 2.3


module TestScalar where

import qualified Apron.Scalar as Scalar

testScalar = do
  s <- Scalar.apScalarAlloc
  Scalar.apScalarFree s
  error ""





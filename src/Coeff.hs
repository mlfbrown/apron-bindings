module Coeff where
import           AbstractMonad
import           Apron.Coeff
import           Control.Monad.State.Strict (liftIO)
import           Types

makeCoeff :: Value -> Abstract Coeff
makeCoeff v = do
  c <- liftIO $ apCoeffAlloc $ if isInterval v then COEFF_INTERVAL else COEFF_SCALAR
  liftIO $ case v of
    IntValue v           -> apCoeffSetScalarInt c $ fromIntegral v
    DoubleValue d        -> apCoeffSetScalarDouble c d
    ScalarValue s        -> apCoeffSetScalar c s
    FracValue f          -> apCoeffSetScalarFrac c
                            (fromIntegral $ fracNum f) (fromIntegral $ fracDenom f)
    IntervalInterval i   -> apCoeffSetInterval c i
    IntInterval i1 i2    -> apCoeffSetIntervalInt c (fromIntegral i1) (fromIntegral i2)
    DoubleInterval d1 d2 -> apCoeffSetIntervalDouble c d1 d2
    ScalarInterval s1 s2 -> apCoeffSetIntervalScalar c s1 s2
    FracInterval f1 f2   -> apCoeffSetIntervalFrac c
                            (fromIntegral $ fracNum f1) (fromIntegral $ fracDenom f1)
                            (fromIntegral $ fracNum f2) (fromIntegral $ fracDenom f2)
  return c

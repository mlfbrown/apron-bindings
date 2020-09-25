module Coeff ( Coeff
             , coeffMake
             ) where
import           AbstractMonad
import           Apron.Coeff
import           Control.Monad.State.Strict (liftIO)
import           Types                      hiding (d, f, i, s)

coeffMake :: Value -> Abstract Coeff
coeffMake v = do
  c <- liftIO $ apCoeffAlloc $ if isInterval v then COEFF_INTERVAL else COEFF_SCALAR
  if isScalar v
  then liftIO $ case scalarVal v of
    IntValue i           -> apCoeffSetScalarInt c $ fromIntegral i
    DoubleValue d        -> apCoeffSetScalarDouble c d
    ScalarValue s        -> apCoeffSetScalar c s
    FracValue f          -> apCoeffSetScalarFrac c
                            (fromIntegral $ fracNum f) (fromIntegral $ fracDenom f)
  else liftIO $ case intervalVal v of
    IntInterval i1 i2    -> apCoeffSetIntervalInt c (fromIntegral i1) (fromIntegral i2)
    DoubleInterval d1 d2 -> apCoeffSetIntervalDouble c d1 d2
    ScalarInterval s1 s2 -> apCoeffSetIntervalScalar c s1 s2
    FracInterval f1 f2   -> apCoeffSetIntervalFrac c
                            (fromIntegral $ fracNum f1) (fromIntegral $ fracDenom f1)
                            (fromIntegral $ fracNum f2) (fromIntegral $ fracDenom f2)
  return c

module Types where
import           Apron.Coeff
import           Apron.Interval
import           Apron.Scalar
import           Data.Int
import           Data.Word

data Frac = Frac { fracNum   :: Int32
                 , fracDenom :: Word32
                 }
          deriving (Eq, Ord, Show)

data Value = IntValue Int32
           | DoubleValue Double
           | ScalarValue Scalar
           | FracValue Frac
           | IntervalInterval Interval
           | IntInterval Int Int
           | DoubleInterval Double Double
           | ScalarInterval Scalar Scalar
           | FracInterval Frac Frac

isInterval :: Value -> Bool
isInterval v = case v of
                 IntervalInterval{} -> True
                 IntInterval{}      -> True
                 DoubleInterval{}   -> True
                 ScalarInterval{}   -> True
                 FracInterval{}     -> True
                 _                  -> False

isScalar :: Value -> Bool
isScalar = not . isInterval

iv = IntValue
dv = DoubleValue
sv = ScalarValue
fv = FracValue
interval = IntervalInterval
iv_interval = IntInterval
dv_interval = DoubleInterval
sv_interval = ScalarInterval
fv_interval = FracInterval




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
           | CoeffValue Coeff
           | IntervalInterval Interval
           | IntInterval Int Int
           | DoubleInterval Double Double
           | ScalarInterval Scalar Scalar
           | FracInterval Frac Frac

iv = IntValue
dv = DoubleValue
sv = ScalarValue
fv = FracValue
cv = CoeffValue
interval = IntervalInterval
iv_interval = IntInterval
dv_interval = DoubleInterval
sv_interval = ScalarInterval
fv_interval = FracInterval




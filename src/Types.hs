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

data IntervalV = IntInterval Int Int
               | DoubleInterval Double Double
               | ScalarInterval Scalar Scalar
               | FracInterval Frac Frac

data ScalarV = IntValue Int32
             | DoubleValue Double
             | ScalarValue Scalar
             | FracValue Frac

data Value = ScalarVal { scalarVal :: ScalarV }
           | IntervalVal { intervalVal :: IntervalV }

isInterval :: Value -> Bool
isInterval v = case v of
                 IntervalVal{} -> True
                 _             -> False

isScalar :: Value -> Bool
isScalar = not . isInterval

i = ScalarVal . IntValue

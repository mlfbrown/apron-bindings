module Linexpr1 where
import           AbstractMonad
import           Apron.Linexpr1
import           Control.Monad.State.Strict (liftIO)

linexprMinimize :: Linexpr1 -> Abstract ()
linexprMinimize = liftIO . apLinexpr1MinimizeWrapper

linexprCopy :: Linexpr1 -> Abstract Linexpr1
linexprCopy = liftIO . apLinexpr1CopyWrapper

-- Tests

linexprIsInteger :: Linexpr1 -> Abstract Bool
linexprIsInteger = liftIO . apLinexpr1IsIntegerWrapper

linexprIsReal :: Linexpr1 -> Abstract Bool
linexprIsReal = liftIO . apLinexpr1IsRealWrapper

linexprIsLinear :: Linexpr1 -> Abstract Bool
linexprIsLinear = liftIO . apLinexpr1IsLinearWrapper

linexprIsQuasilinear :: Linexpr1 -> Abstract Bool
linexprIsQuasilinear = liftIO . apLinexpr1IsQuasilinearWrapper


module Interval ( Interval
                , intervalPrint
                -- * Tests
                , intervalIsTop
                , intervalIsBottom
                , intervalIsLeq
                , intervalIsLe
                , intervalIsEq
                , intervalIsGeq
                , intervalIsGe
                , intervalIsInt
                ) where
import           AbstractMonad
import           Apron.Interval
import           Control.Monad.State.Strict (liftIO)
import           Data.Int

intervalPrint :: Interval -> Abstract ()
intervalPrint = liftIO1 apIntervalPrint

intervalIsTop :: Interval -> Abstract Bool
intervalIsTop = liftIO1 apIntervalIsTop

intervalIsBottom :: Interval -> Abstract Bool
intervalIsBottom = liftIO1 apIntervalIsBottom

intervalIsLeq :: Interval -> Interval -> Abstract Bool
intervalIsLeq = liftIO2 apIntervalIsLeq

intervalIsLe :: Interval -> Interval -> Abstract Bool
intervalIsLe i1 i2 = do
  leq <- intervalIsLeq i1 i2
  eq <- intervalIsEq i1 i2
  return $ not eq && leq

intervalIsEq :: Interval -> Interval -> Abstract Bool
intervalIsEq = liftIO2 apIntervalEqual

intervalIsGeq :: Interval -> Interval -> Abstract Bool
intervalIsGeq i1 i2 = do
  le <- intervalIsLe i1 i2
  return $ not le

intervalIsGe :: Interval -> Interval -> Abstract Bool
intervalIsGe i1 i2 = do
  geq <- intervalIsGeq i1 i2
  eq <- intervalIsEq i1 i2
  return $ not eq && geq

intervalIsInt :: Interval -> Int32 -> Abstract Bool
intervalIsInt int val = liftIO $ apIntervalEqualInt int $ fromIntegral val

module Linexpr1 where
import           AbstractMonad
import           Apron.Coeff
import           Apron.Interval
import           Apron.Linexpr1
import           Apron.Scalar
import           Apron.Var
import           Control.Monad.State.Strict (liftIO)
import           Data.Int                   (Int32)
import           Types

-- | Build a linear expressions with by default coefficients of type SCALAR and DOUBLE.
-- If lin_discr selects a dense representation, the size of the expression is the size
-- of the environment.
-- Otherwise, the initial size is given by size and the expression may be resized lazily.
linexprMake :: LinexprDescrip -> Int32 -> Abstract Linexpr1
linexprMake d size = do
  env <- getEnvironment
  liftIO $ apLinexpr1MakeWrapper env d $ fromIntegral size

-- | In case of sparse representation, remove zero coefficients.
linexprMinimize :: Linexpr1 -> Abstract ()
linexprMinimize = liftIO . apLinexpr1MinimizeWrapper

-- | Make a copy of the linear expression.
linexprCopy :: Linexpr1 -> Abstract Linexpr1
linexprCopy = liftIO . apLinexpr1CopyWrapper

-- Tests

-- | Does the expression depends only on integer variables?
linexprIsInteger :: Linexpr1 -> Abstract Bool
linexprIsInteger = liftIO . apLinexpr1IsIntegerWrapper

-- | Does the expression depends only on real variables ?
linexprIsReal :: Linexpr1 -> Abstract Bool
linexprIsReal = liftIO . apLinexpr1IsRealWrapper

-- | Return true iff all involved coefficients are scalars.
linexprIsLinear :: Linexpr1 -> Abstract Bool
linexprIsLinear = liftIO . apLinexpr1IsLinearWrapper

-- | Return true iff all involved coefficients but the constant are scalars.
linexprIsQuasilinear :: Linexpr1 -> Abstract Bool
linexprIsQuasilinear = liftIO . apLinexpr1IsQuasilinearWrapper

-- Accesses

-- | Get a reference to the constant. Do not free it.
linexprGetConstant :: Linexpr1 -> Abstract Coeff
linexprGetConstant = liftIO . apLinexpr1CstrefWrapper

-- | Get a reference to the coefficient associated to the variable.
-- Do not free it.
-- In case of sparse representation, possibly induce the addition of a new linear term.
-- Return NULL if var is unknown in the environment.
linexprGetCoeff :: Linexpr1 -> Var -> Abstract Coeff
linexprGetCoeff = liftIO2 apLinexpr1CoeffrefWrapper

-- | Get the constant and assign it to coeff.
linexprAssignConstant :: Coeff -> Linexpr1 -> Abstract ()
linexprAssignConstant = liftIO2 apLinexpr1GetCstWrapper

-- Setters

-- | Set the linear expression to a constant or interval of constants.
linexprSetConstant :: Linexpr1 -> Value -> Abstract ()
linexprSetConstant e v = do
  liftIO $ case v of
    IntValue i           -> apLinexpr1SetCstScalarIntWrapper e $ fromIntegral i
    DoubleValue d        -> apLinexpr1SetCstScalarDoubleWrapper e d
    ScalarValue s        -> apLinexpr1SetCstScalarWrapper e s
    FracValue f          -> apLinexpr1SetCstScalarFracWrapper e
                            (fromIntegral $ fracNum f) (fromIntegral $ fracDenom f)
    CoeffValue c         -> apLinexpr1SetCstWrapper e c
    IntervalInterval i   -> apLinexpr1SetCstIntervalWrapper e i
    IntInterval i1 i2    -> apLinexpr1SetCstIntervalIntWrapper e
                            (fromIntegral $ i1) (fromIntegral $ i2)
    DoubleInterval d1 d2 -> apLinexpr1SetCstIntervalDoubleWrapper e d1 d2
    ScalarInterval s1 s2 -> apLinexpr1SetCstIntervalScalarWrapper e s1 s2
    FracInterval f1 f2   -> apLinexpr1SetCstIntervalFracWrapper e
                            (fromIntegral $ fracNum f1) (fromIntegral $ fracDenom f1)
                            (fromIntegral $ fracNum f2) (fromIntegral $ fracDenom f2)

-- | Set the coefficient of variables var in the expression.
-- Return true if any var is unknown in the environment.
linexprSetCoeffs :: Linexpr1 -> [(Var, Value)] -> Abstract Bool
linexprSetCoeffs e vs = do
  succs <- mapM (uncurry $ linexprSetCoeff e) vs
  return $ or succs

-- | Set the coefficient of variable var in the expression.
-- Return true if var is unknown in the environment.
linexprSetCoeff :: Linexpr1 -> Var -> Value -> Abstract Bool
linexprSetCoeff e var v = do
  liftIO $ case v of
    IntValue i           -> apLinexpr1SetCoeffScalarIntWrapper e var $ fromIntegral i
    DoubleValue d        -> apLinexpr1SetCoeffScalarDoubleWrapper e var d
    ScalarValue s        -> apLinexpr1SetCoeffScalarWrapper e var s
    FracValue f          -> apLinexpr1SetCoeffScalarFracWrapper e var
                            (fromIntegral $ fracNum f) (fromIntegral $ fracDenom f)
    CoeffValue c         -> apLinexpr1SetCoeffWrapper e var c
    IntervalInterval i   -> apLinexpr1SetCoeffIntervalWrapper e var i
    IntInterval i1 i2    -> apLinexpr1SetCoeffIntervalIntWrapper e var
                            (fromIntegral i1) (fromIntegral i2)
    DoubleInterval d1 d2 -> apLinexpr1SetCoeffIntervalDoubleWrapper e var d1 d2
    ScalarInterval s1 s2 -> apLinexpr1SetCoeffIntervalScalarWrapper e var s1 s2
    FracInterval f1 f2   -> apLinexpr1SetCoeffIntervalFracWrapper e var
                            (fromIntegral $ fracNum f1) (fromIntegral $ fracDenom f1)
                            (fromIntegral $ fracNum f2) (fromIntegral $ fracDenom f2)

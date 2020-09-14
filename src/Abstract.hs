module Abstract ( Abstract
                , initAbstractState
                -- * Higher-level constructors
                , linexprEquation
                , linconsEquation
                -- * Linexpr
                , Linexpr1
                , linexprMake
                , linexprMinimize
                , linexprCopy
                -- ** Tests
                , linexprIsInteger
                , linexprIsReal
                , linexprIsLinear
                , linexprIsQuasilinear
                -- ** Access
                , linexprGetConstant
                , linexprGetCoeff
                -- ** Setters
                , linexprSetConstant
                , linexprSetCoeffs
                , linexprSetCoeff
                -- * Lincons
                , Lincons1
                , linconsMake
                , linconsCopy
                -- ** Tests
                , linconsIsUnsat
                -- ** Access
                , linconsGetScalar
                , linconsGetLinexpr
                , linconsGetConstant
                , linconsGetCoeff
                -- ** Setters
                , linconsSetConstant
                , linconsSetCoeffs
                , linconsSetCoeff
                -- * Lincons array
                , Lincons1Array
                , linconsArrayMake
                , linconsArraySize
                -- ** Access
                , linconsArrayGetIndex
                -- ** Setters
                , linconsArrayClearIndex
                , linconsArrayClearIndecies
                , linconsArraySetIndex
                , linconsArraySetIndecies
                -- * Abstract
                , Abstract1
                , abstractBottom
                , abstractOfLinconsArray
                -- ** Access
                , abstractGetEnvironment
                -- ** Operations
                , abstractMeet
                , abstractJoin
                -- * Other types
                , Scalar
                ) where
import           Abstract1
import           AbstractMonad
import           Apron.Abstract1
import           Apron.Lincons1
import           Apron.Linexpr1
import           Apron.Scalar
import           Lincons1
import           Linexpr1
import           Types

-- | Make a new constraint for a linear equation.
-- Set the linexpr to the given set of variables.
linexprEquation :: LinexprDescrip
                -> Constyp
                -> [(VarName, Value)]
                -> Abstract Lincons1
linexprEquation descrip constyp vars = do
  let size = if isDense descrip then 0 else length vars
  expr <- linexprMake descrip $ fromIntegral size
  cons <- linconsMake constyp expr
  linexprSetCoeffs expr vars
  return cons

-- | Make a new constraint for an linear equation.
-- Set the lincons to a given set of variables.
linconsEquation :: LinexprDescrip
                -> Constyp
                -> [(VarName, Value)]
                -> Abstract Lincons1
linconsEquation descrip constyp vars = do
  let size = if isDense descrip then 0 else length vars
  expr <- linexprMake descrip $ fromIntegral size
  cons <- linconsMake constyp expr
  linconsSetCoeffs cons vars
  return cons



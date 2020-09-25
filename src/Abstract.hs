module Abstract ( Abstract
                , Domain(..)
                , defaultState
                , initAbstractState
                , evalAbstract
                -- * Higher-level constructors
                , linexprEquation
                , linconsEquation
                -- * Linexpr
                , Linexpr1
                , LinexprDescrip(..)
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
                , Constyp(..)
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
                -- * Texpr
                , Texpr1
                , OpType(..)
                , RoundingType(..)
                , RoundingDir(..)
                , texprMakeConstant
                , texprMakeLeafVar
                , texprMakeUnOp
                , texprMakeBinOp
                , texprFromLinexpr
                , texprCopy
                -- ** Tests
                , texprHasVar
                , texprIsConstant
                , texprIsPolynomial
                , texprIsPolyfrac
                , texprIsScalar
                -- ** Operations
                , texprSubstitute
                -- * Tcons
                , Tcons1
                , tconsMake
                , tconsFromLincons
                , tconsCopy
                -- ** Access
                , tconsGetScalar
                , tconsGetExpr
                -- * Tcons array
                , Tcons1Array
                , tconsArrayMake
                , tconsArrayClear
                -- ** Access
                , tconsArraySize
                , tconsArrayGetIndex
                -- ** Setters
                , tconsArrayClearIndex
                , tconsArrayClearIndecies
                , tconsArraySetIndex
                , tconsArraySetIndecies
                -- * Abstract
                , Abstract1
                , abstractPrint
                , abstractBottom
                , abstractOfLinconsArray
                , abstractToLinconsArray
                , abstractOfTconsArray
                , abstractToTconsArray
                -- ** Access
                , abstractGetEnvironment
                -- ** Tests
                , abstractIsTop
                , abstractIsBottom
                , abstractIsLeq
                , abstractIsEq
                , abstractSatLincons
                , abstractSatTcons
                , abstractVarIsUnconstrained
                -- ** Extract properties
                , abstractBoundLinexpr
                , abstractBoundTexpr
                , abstractBoundVar
                -- ** Operations
                , abstractMeet
                , abstractJoin
                , abstractArrayMeet
                , abstractArrayJoin
                , abstractLinconsArrayMeet
                , abstractTconsArrayMeet
                , abstractUnify
                , abstractCanonicalize
                , abstractMinimize
                -- ** Other
                , abstractExpand
                , abstractFold
                , abstractWiden
                , abstractClosure
                -- * Interval
                , Interval
                -- ** Tests
                , intervalIsTop
                , intervalIsBottom
                , intervalIsLeq
                , intervalIsLe
                , intervalIsEq
                , intervalIsGeq
                , intervalIsGe
                , intervalIsInt
                -- * Other types
                , Scalar
                ) where
import           Abstract1
import           AbstractMonad
import           Apron.Abstract1
import           Apron.Interval
import           Apron.Lincons1
import           Apron.Linexpr1
import           Apron.Scalar
import           Control.Monad   (when)
import           Data.Maybe
import           Interval
import           Lincons1
import           Linexpr1
import           Tcons1
import           Texpr1
import           Types

-- | Make a new constraint for a linear equation.
-- Set the linexpr to the given set of variables.
linexprEquation :: LinexprDescrip
                -> Constyp
                -> [(VarName, Value)]
                -> Maybe Value
                -> Abstract Lincons1
linexprEquation descrip constyp vars mConstant = do
  let size = if isDense descrip then 0 else length vars
  expr <- linexprMake descrip $ fromIntegral size
  cons <- linconsMake constyp expr
  linexprSetCoeffs expr vars
  when (isJust mConstant) $ linexprSetConstant expr $ fromJust mConstant
  return cons

-- | Make a new constraint for an linear equation.
-- Set the lincons to a given set of variables.
linconsEquation :: LinexprDescrip
                -> Constyp
                -> [(VarName, Value)]
                -> Maybe Value
                -> Abstract Lincons1
linconsEquation descrip constyp vars mConstant = do
  let size = if isDense descrip then 0 else length vars
  expr <- linexprMake descrip $ fromIntegral size
  cons <- linconsMake constyp expr
  linconsSetCoeffs cons vars
  when (isJust mConstant) $ linconsSetConstant cons $ fromJust mConstant
  return cons



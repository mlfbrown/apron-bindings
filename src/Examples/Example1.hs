module Examples.Example1 where
import           Apron
import           Prelude hiding (abs)
import           Types

-- | The second half of example 1 from example.c
-- (starting at line 109)
-- https://github.com/antoinemine/apron/blob/master/examples/example1.c
example :: IO ()
example = evalAbstract defaultState $ do

  initAbstractState Intervals ["x", "y", "z"] ["u", "w", "v"]
  arr <- linconsArrayMake 6

  cons0 <- linexprEquation LINEXPR_DENSE CONS_EQ [ ("x", i 1)
                                                 , ("y", i 1)
                                                 , ("z", i 1)
                                                 , ("w", i 1)
                                                 , ("u", i 1)
                                                 ] Nothing
  cons1 <- linexprEquation LINEXPR_SPARSE CONS_SUPEQ [ ("w", i 1) ]      Nothing
  cons2 <- linexprEquation LINEXPR_SPARSE CONS_SUPEQ [ ("w", i (-1)) ] $ Just $ i 5
  cons3 <- linexprEquation LINEXPR_SPARSE CONS_SUPEQ [ ("u", i 1) ]    $ Just $ i 5
  cons4 <- linexprEquation LINEXPR_SPARSE CONS_SUPEQ [ ("u", i (-1)) ]   Nothing
  cons5 <- linexprEquation LINEXPR_DENSE CONS_EQ [ ("x", i 1)
                                                 , ("y", i 1)
                                                 , ("z", i (-1))
                                                 , ("w", i (-1))
                                                 ] Nothing
  linconsArraySetIndecies arr [ (0, cons0)
                              , (1, cons1)
                              , (2, cons2)
                              , (3, cons3)
                              , (4, cons4)
                              , (5, cons5)
                              ]
  _abs <- abstractOfLinconsArray arr
  error ""






import           Apron
import           Types

main :: IO ()
main = evalAbstract defaultState $ do

  initAbstractState Intervals ["x", "y", "z"] ["u", "w", "v"]
  arr <- linconsArrayMake 3

  --      -39x + 40y >= 0
  cons0 <- linconsEquation LINEXPR_SPARSE CONS_SUPEQ [ ("x", i (-39))
                                                     , ("y", i 40)
                                                     ] $ Just $ i 0
  linconsPrint cons0

  --      -6x - 20y + 85 >= 0
  cons1 <- linconsEquation LINEXPR_SPARSE CONS_SUPEQ [ ("x", i (-6))
                                                     , ("y", i (-20))
                                                     ] $ Just $ i 85
  linconsPrint cons1

  --      x >= 0
  cons2 <- linconsEquation LINEXPR_SPARSE CONS_SUPEQ [ ("x", i 1) ] $ Just $ i 0
  linconsPrint cons2

  linconsArraySetIndecies arr [ (0, cons0)
                              , (1, cons1)
                              , (2, cons2)
                              ]

  abs1 <- abstractOfLinconsArray arr
  abstractPrint abs1
  abs2 <- abstractFold abs1 ["x", "y"]
  abstractPrint abs2



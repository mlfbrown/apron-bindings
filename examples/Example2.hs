import           Apron
import           Control.Monad.State.Strict (liftIO)
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

  liftIO $ putStrLn "Global environment before abstract operations:"
  env0 <- getEnvironment
  environmentPrint env0

  abs1 <- abstractOfLinconsArray arr
  env1 <- abstractGetEnvironment abs1
  liftIO $ putStrLn "Abstract 1:"
  abstractPrint abs1
  liftIO $ putStrLn "Abstract environment after first abstract operation:"
  environmentPrint env1

  abs2 <- abstractFold abs1 ["x", "y"]
  env2 <- abstractGetEnvironment abs2
  liftIO $ putStrLn "Abstract 2:"
  abstractPrint abs2
  liftIO $ putStrLn "Abstract environment after abstract fold:"
  environmentPrint env2

  env3 <- getEnvironment
  liftIO $ putStrLn "Global environment after abstract operations:"
  environmentPrint env3

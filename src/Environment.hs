module Environment ( Environment
                   , environmentPrint
                   ) where
import           AbstractMonad
import           Apron.Environment

environmentPrint :: Environment -> Abstract ()
environmentPrint = liftIO1 printEnvironment

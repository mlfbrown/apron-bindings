module TestLincons1 where
import           Apron.Environment
import           Apron.Lincons1
import           Test.Tasty
import           Test.Tasty.HUnit

linconsTests = testGroup "Lincons tests" [ --makeLincons
--                                         , doLincons
                                         ]

-- makeLincons = testCase "Make lincons" $ do
--   e <- apEnvironmentAllocEmpty
--   c <- apLincons1ArrayMakeWrapper e 4
--   apLincons1ArrayFree c

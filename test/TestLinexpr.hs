module TestLinexpr where
import           Apron.Environment
import           Apron.Linexpr
import           Test.Tasty
import           Test.Tasty.HUnit

linexprTests = testGroup "Linexpr tests" [ makeLinexpr ]

makeLinexpr = testCase "Make linexpr" $ do
  e <- apEnvironmentAllocEmpty
  lin <- apLinexpr1MakeWrapper e LINEXPR_DENSE 4
  apLinexpr1Free lin
  apEnvironmentFree2 e

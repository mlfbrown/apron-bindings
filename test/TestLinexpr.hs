module TestLinexpr where
import           Apron.Environment
import           Apron.Linexpr
import           Test.Tasty
import           Test.Tasty.HUnit

linexprTests = testGroup "Linexpr tests" [ makeLinexpr ]

makeLinexpr = testCase "Make linexpr" $ do
  e <- apEnvironmentAllocEmpty
  expr <- apLinexpr1MakeWrapper e LINEXPR_DENSE 4
  apLinexpr1Free expr
  apEnvironmentFree2 e

-- opsLinexpr = testCase "Linexpr ops" $ do
--   e <- apEnvironmentAllocEmpty
--   expr <- apLinexpr1MakeWrapper e LINEXPR_DENSE 4
--   apLinexpr1Free expr
--   apEnvironmentFree2 e

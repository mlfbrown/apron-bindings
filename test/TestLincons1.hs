module TestLincons1 where
import           Apron.Environment
import           Apron.Lincons1
import           Apron.Linexpr1
import           Apron.Scalar
import           Test.Tasty
import           Test.Tasty.HUnit

linconsTests = testGroup "Lincons tests" [ makeLincons ]

makeLincons = testCase "Make lincons" $ do
  e <- apEnvironmentAllocEmpty
  expr <- apLinexpr1MakeWrapper e LINEXPR_DENSE 4
  s <- apScalarAlloc
  lin <- apLincons1MakeWrapper CONS_EQ expr s
  apLincons1Free lin


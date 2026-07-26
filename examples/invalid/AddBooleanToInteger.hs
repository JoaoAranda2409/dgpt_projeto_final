module AddBooleanToInteger where

import qualified Expressions.Typed as Typed

-- Este arquivo está errado de propósito.
--
-- O segundo operando de 'Typed.Add' deveria ter o tipo
-- 'Typed.TypedExpression Int', mas 'Typed.BooleanLiteral True' possui o tipo
-- 'Typed.TypedExpression Bool'. O teste passa quando o GHC encontra esse erro.
invalidAddition :: Typed.TypedExpression Int
invalidAddition =
  Typed.Add
    (Typed.IntegerLiteral 10)
    (Typed.BooleanLiteral True)

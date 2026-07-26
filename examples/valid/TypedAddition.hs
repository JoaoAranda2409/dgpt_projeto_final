module Main (main) where

import qualified Expressions.Typed as Typed

main :: IO ()
main = do
  let expression :: Typed.TypedExpression Int
      expression =
        Typed.Add
          (Typed.IntegerLiteral 10)
          (Typed.IntegerLiteral 20)

  print (Typed.evaluate expression)

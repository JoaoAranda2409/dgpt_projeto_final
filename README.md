# Museu dos Programas que Não Compilam

Este repositório é um estudo experimental executável sobre desenvolvimento
guiado por tipos em Haskell. A pergunta que orienta o projeto é:

> Até que ponto regras normalmente verificadas durante a execução podem ser
> transferidas para o sistema de tipos e verificadas durante a compilação?

O primeiro experimento implementa uma pequena linguagem de expressões de duas
maneiras:

1. uma versão convencional, que permite construir expressões inválidas e usa
   `Either` para detectar o erro durante a execução;
2. uma versão com GADT, na qual o tipo de cada expressão registra o tipo de seu
   resultado e impede combinações inválidas.

## Como executar

É necessário ter o [Stack](https://docs.haskellstack.org/) instalado.

```text
stack build
stack run
stack test
bash scripts/compile-fail-tests.sh
```

O último comando é diferente de um teste comum: ele tenta compilar os arquivos
da pasta `examples/invalid`. O teste passa quando o GHC rejeita esses programas.

## Estrutura do primeiro experimento

```text
src/Expressions/Untyped.hs
    Implementação convencional. Uma soma entre Int e Bool pode ser construída.

src/Expressions/Typed.hs
    Implementação com GADT. Os operandos aceitos estão descritos nos tipos.

examples/valid/TypedAddition.hs
    Pequeno programa válido, aceito pelo compilador.

examples/invalid/AddBooleanToInteger.hs
    Pequeno programa propositalmente inválido, rejeitado pelo compilador.
```

## Resultado esperado

Na versão convencional, esta expressão é representável:

```haskell
Add (IntegerLiteral 10) (BooleanLiteral True)
```

Ela compila, mas sua avaliação produz um `Left`.

Na versão tipada, o construtor `Add` exige dois valores do tipo
`TypedExpression Int`. Portanto, a tentativa equivalente não compila. Neste
caso, a assinatura do construtor funciona como parte da especificação do
programa.

Este primeiro experimento introduz tipos algébricos, tipos de erro, GADTs e
tipos indexados. As exposições seguintes poderão acrescentar máquinas de
estado, famílias de tipos, vetores e matrizes com dimensões presentes nos tipos.

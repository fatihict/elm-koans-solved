module AboutLiterals exposing (..)

import ElmTest exposing (..)
import TestHelpers exposing (..)


-- Single line comments begin with "--"
{- Multi line comments
  begin with "{-" and end with "-}"
-}


testSuite =
  suite
    "About Literals"
    [ test
        "strings are enclosed in double quotes"
        (assertEqual "A string" "A string")
    , test
        "characters are enclosed in single quotes"
        (assertEqual 'A' 'A')
    , test
        "floats have a decimal"
        (assertEqual 42.24 42.24)
    , test
        "integers do not"
        (assertEqual 42 42)
    , test
        "number literals can be integers"
        <| let
            num : Int
            num =
              42
           in
            (assertEqual num 42)
    , test
        "number literals can be floats"
        <| let
            num : Float
            num =
              42.0
           in
            (assertEqual num 42.0)
    , test
        "lists are denoted by brackets"
        (assertEqual [ 1, 2, 3 ] [ 1, 2, 3 ])
    ]

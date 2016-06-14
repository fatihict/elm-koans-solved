module AboutComparisonOperators exposing (..)

import ElmTest exposing (..)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Comparison Operators"
    [ test
        "== tests for equality"
        (assert (1 == 1))
    , test
        "/= tests for inequality"
        (assert (-1 /= 0))
    , test
        "< tests for less than"
        (assert (1 < 2))
    , test
        "<= tests for less than or equal to"
        (assert (1 <= 3))
    , test
        "> tests for greater than"
        (assert (1 > 0))
    , test
        ">= tests for greater than or equal to"
        (assert (1 >= 0))
    , test
        "Floats are comparable"
        (assert (1.5 >= 0.65))
    , test
        "Strings are comparable"
        (assert ("A string" == "A string"))
    , test
        "Chars are comparable"
        (assert ('a' == 'a'))
    , test
        "max returns the maximum of two comparables"
        (assertEqual (max 1 2) 2)
    , test
        "min returns the minimum of two comparables"
        (assertEqual (min 1 2) 1)
    , test
        "compare returns an Order"
        -- valid Order values are LT, EQ, and GT
        (assertEqual (compare 1 2) LT)
    , test
        "functions can be made infix with `backticks`"
        (assertEqual (2 `compare` 1) GT)
    ]

module AboutMathematicalOperators exposing (..)

import ElmTest exposing (..)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Mathematical Operators"
    [ test
        "negate gives the negative of a number"
        (assertEqual -3 (negate 3))
    , test
        "abs gives the absolute value of a number"
        (assertEqual 3 (abs 3))
    , test
        "sqrt gives the square root of a Float"
        (assertEqual 3.0 (sqrt 9.0))
    , test
        "+ adds numbers"
        (assertEqual 3 (1 + 2))
    , test
        "- subtracts numbers"
        (assertEqual 3 (7 - 4))
    , test
        "* multiplies numbers"
        (assertEqual 6 (4 * 1.5))
    , test
        "/ divides Floats"
        (assertEqual 2.5 (5 / 2))
    , test
        "// divides Ints"
        (assertEqual 2 (5 // 2))
    , test
        "rem gives the remainder after division"
        (assertEqual 2 (5 `rem` 3))
    , test
        "% performs modular arithmetic (which is different)"
        (assertEqual (-1 % 5) 4)
    , test
        "logBase returns the log of the value in the given base"
        (assertEqual (logBase 2 8) 3)
    , test
        "clamp returns the value if it is between the given min and max"
        (assertEqual (clamp 1 10 5) 5)
    , test
        "clamp returns the min value if the value is below the minimum"
        (assertEqual (clamp 1 10 -5) 1)
    , test
        "clamp returns the max value if the value is above the maximum"
        (assertEqual (clamp 1 10 50) 10)
    ]

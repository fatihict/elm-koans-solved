module AboutLogicalOperators exposing (..)

import ElmTest exposing (..)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Logical Operators"
    [ test
        "not negates a boolean"
        (assertEqual False (not True))
    , test
        "&& is a logical AND"
        (assert (True && True))
    , test
        "|| is a logical OR"
        (assert (False || True))
    , test
        "xor is a logical XOR"
        (assert (False `xor` True))
    ]

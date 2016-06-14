module AboutNumberConversions exposing (..)

import ElmTest exposing (..)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Number Conversions"
    [ test
        "toFloat converts an int to a float"
        (assertEqual (toFloat 5) 5.0)
    , test
        "floor converts a float to an int (rounding down)"
        (assertEqual (floor 3.6) 3)
    , test
        "floor converts a float to an int (rounding down)"
        (assertEqual (floor -3.6) -4)
    , test
        "ceiling converts a float to an int (rounding up)"
        (assertEqual (ceiling 3.6) 4)
    , test
        "ceiling converts a float to an int (rounding up)"
        (assertEqual (ceiling -3.6) -3)
    , test
        "round converts a float to an int (rounding to the closest int)"
        (assertEqual (round 3.6) 4)
    , test
        "round converts a float to an int (rounding to the closest int)"
        (assertEqual (round -3.6) -4)
    , test
        "truncate converts a float to an int (rounding towards 0)"
        (assertEqual (truncate 3.6) 3)
    , test
        "truncate converts a float to an int (rounding towards 0)"
        (assertEqual (truncate -3.6) -3)
    ]

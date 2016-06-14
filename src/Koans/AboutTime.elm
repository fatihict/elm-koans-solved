module AboutTime exposing (..)

import ElmTest exposing (..)
import TestHelpers exposing (..)
import Time


testSuite =
  suite
    "About Time"
    [ test
        "time is just a Float"
        (assertEqual 123.45 123.45)
    , test
        "a constant exists for hour"
        (assertEqual (1 * Time.hour) 3600000)
    , test
        "and minute"
        (assertEqual (1 * Time.minute) 60000)
    , test
        "and second"
        (assertEqual (1 * Time.second) 1000)
    , test
        "and millisecond"
        (assertEqual (1 * Time.millisecond) 1)
    , test
        "helpers exist to convert back to Floats"
        (assertEqual (Time.inSeconds 1000) 1)
    ]

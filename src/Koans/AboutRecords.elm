module AboutRecords exposing (..)

import ElmTest exposing (..)
import TestHelpers exposing (..)


point =
  { x = 1, y = 2 }


testSuite =
  suite
    "About Records"
    [ test
        "a record is a set of named fields"
        (assertEqual { x = 1, y = 2 } { x = 1, y = 2 })
    , test
        "you can access a field with dot notation"
        (assertEqual point.x 1)
    , test
        "the dot notation may also be used as a function"
        (assertEqual (.y point) 2)
    , test
        "fields may be updated"
        (assertEqual { point | x = 3 } { x = 3, y = 2 })
    ]

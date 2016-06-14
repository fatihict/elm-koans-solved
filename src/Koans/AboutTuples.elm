module AboutTuples exposing (..)

import ElmTest exposing (..)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Tuples"
    [ test
        "tuples are like lists of fixed length"
        (assertEqual ( 1, 2 ) ( 1, 2 ))
    , test
        "tuples may also be of mixed types"
        (assertEqual ( 1, "hey" ) ( 1, "hey" ))
    , test
        "there is a special comma syntax for creating tuples"
        (assertEqual ((,) 1 "hey") (1, "hey"))
    , test
        "you use as many commas as there would be in the tuple"
        (assertEqual ((,,) 1 "hey" []) (1, "hey", []))
    , test
        "fst gets the first element of a 2-tuple"
        (assertEqual (fst (1, 2)) 1)
    , test
        "snd gets the second element of a 2-tuple"
        (assertEqual (snd (1, "as")) "as")
    , test
        "case statements may be used to destructure a tuple"
        (case ( 1, 2 ) of
          ( first, second ) ->
            (assert ((first == 1) && (second == 2)))
        )
    , test
        "tuples may also be destructured by function arguments"
        (assert ((\( f, s ) -> ((f == 1) && (s == 2))) ( 1, 2 )))
    ]

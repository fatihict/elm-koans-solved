module AboutResults exposing (..)

import ElmTest exposing (..)
import Result
import TestHelpers exposing (..)


testSuite =
  suite
    "About Result"
    [ test
        "results represent the result of a function"
        (assertEqual (Ok 42) (Ok 42))
    , test
        "but could be an error"
        (assertEqual (Err "there was an error") (Err "there was an error"))
    , test
        "a result can be converted to a maybe"
        (assertEqual (Result.toMaybe (Ok 42)) (Just 42))
    , test
        "but an error will become nothing"
        (assertEqual (Result.toMaybe (Err "there was an error")) Nothing)
    , test
        "a maybe can also be converted to a result"
        (assertEqual (Result.fromMaybe "there was an error" (Just 42)) (Ok 42))
    , test
        "and will become an error if there is nothing"
        (assertEqual (Result.fromMaybe "there was an error" Nothing) (Err "there was an error"))
    ]

module AboutMaybe exposing (..)

import ElmTest exposing (..)
import Maybe
import TestHelpers exposing (..)


testSuite =
  suite
    "About Maybe"
    [ test
        "maybe represents a value that may be nothing"
        (assertEqual Nothing Nothing)
    , test
        "or the value could be something"
        (assertEqual (Just 5) (Just 5))
    , test
        "withDefault can be used to get the value from a maybe"
        (assertEqual (Maybe.withDefault 3 (Just 5)) 5)
    , test
        "but will give the default value if there is nothing"
        (assertEqual (Maybe.withDefault 3 Nothing) 3)
    , test
        "oneOf will get the first value from a list of maybes"
        (assertEqual (Maybe.oneOf [ Nothing, (Just 1), (Just 2) ]) (Just 1))
    , test
        "but you could still wind up with nothing"
        (assertEqual (Maybe.oneOf [ Nothing, Nothing, Nothing ]) Nothing)
    , test
        "map will transform the value in a maybe"
        (assertEqual (Maybe.map (\n -> n / 2) (Just 4)) (Just 2))
    , test
        "but will not transform a nothing"
        (assertEqual (Maybe.map (\n -> n / 2) Nothing) Nothing)
    ]

module AboutAsserts exposing (..)

import ElmTest exposing (..)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Asserts"
    [ test
        "assert tests for a true value"
        (assert True)
    , test
        "assertEqual tests for equality"
        (assertEqual True True)
    , test
        "assertNotEqual tests for inequality"
        (assertNotEqual False True)
    ]

module AboutStrings exposing (..)

import ElmTest exposing (..)
import String
import TestHelpers exposing (..)


testSuite =
  suite
    "About Strings"
    [ test
        "length returns the string length"
        (assertEqual (String.length "Hello") 5)
    , test
        "isEmpty tests for an empty string"
        (assert (String.isEmpty ""))
    , test
        "reverse returns the reverse of a string"
        (assertEqual (String.reverse "Hello") "olleH")
    , test
        "repeat returns the string repeated n times"
        (assertEqual (String.repeat 2 "ya") "yaya")
    , test
        "the ++ infix function appends two strings"
        (assertEqual ("Elm" ++ "Lang") "ElmLang")
    , test
        "append does the same thing"
        (assertEqual (String.append "Elm" "Lang") "ElmLang")
    , test
        "concat appends a list of strings together"
        (assertEqual (String.concat [ "Elm", "Lang", "Yay!" ]) "ElmLangYay!")
    , test
        "join is like concat with a separator"
        (assertEqual (String.join "," [ "I'm", "a", "csv" ]) "I'm,a,csv")
    , test
        "split does the opposite"
        (assertEqual (String.split "," "I'm,a,csv") [ "I'm", "a", "csv" ])
    , test
        "slice gets a substring"
        (assertEqual (String.slice 4 12 "I'm a string") "a string")
    , test
        "negative indices start from the end"
        (assertEqual (String.slice -8 -1 "I'm a string") "a strin")
    , test
        "left takes the first n characters of a string"
        (assertEqual (String.left 3 "I'm a string") "I'm")
    , test
        "right takes the last n characters of a string"
        (assertEqual (String.right 3 "I'm a string") "ing")
    , test
        "dropLeft drops the first n characters of a string"
        (assertEqual (String.dropLeft 3 "I'm a string") " a string")
    , test
        "dropRight drops the last n characters of a string"
        (assertEqual (String.dropRight 3 "I'm a string") "I'm a str")
    , test
        "contains looks for a substring"
        (assertEqual (String.contains "string" "I'm a string") True)
    , test
        "indexes gives the location of each occurance"
        -- there are sooooo many string functions, just check them out
        (assertEqual (String.indexes "string" "I'm a string") [6])
    ]

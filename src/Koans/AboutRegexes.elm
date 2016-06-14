module AboutRegexes exposing (..)

import ElmTest exposing (..)
import Regex
import String
import TestHelpers exposing (..)


testSuite =
  suite
    "About Regex"
    [ test
        "contains tests for a regex match"
        (assertEqual (Regex.contains (Regex.regex "[abc]+") "abcdefg") True)
    , test
        "escape will escape all special characters"
        (assertEqual (Regex.escape "[abc]+") "\\[abc\\]\\+")
    , test
        "useful for matching strange strings"
        (assertEqual (Regex.contains (Regex.regex (Regex.escape "[eir]+")) "w[eir]+d") True)
    , test
        "it's easy to make your regex case insensitive"
        (assertEqual (Regex.contains (Regex.caseInsensitive (Regex.regex "abc")) "ABC") True)
    , test
        "find returns a list of all matches"
        (assertEqual (Regex.find Regex.All (Regex.regex "abc") "abcabcabc" |> List.length) 3)
    , test
        "matches contain the match"
        (assertEqual (Regex.find Regex.All (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.match)) ["a", "b", "c"])
    , test
        "matches contain the index"
        (assertEqual (Regex.find Regex.All (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.index)) [0, 2, 4])
    , test
        "matches may contain submatches"
        (assertEqual (Regex.find Regex.All (Regex.regex "(a)|(b)") "axbxc" |> List.map (\match -> match.submatches)) [[Just "a", Nothing], [Nothing, Just "b"]])
    , test
        "you may limit the number of matches"
        (assertEqual (Regex.find (Regex.AtMost 2) (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.match)) ["a", "b"])
    , test
        "replace can modify based on the match"
        (assertEqual (Regex.replace Regex.All (Regex.regex "[abc]") (\match -> String.toUpper match.match) "axbxc") "AxBxC")
    ]

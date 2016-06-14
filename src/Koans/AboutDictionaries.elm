module AboutDictionaries exposing (..)

import ElmTest exposing (..)
import Dict
import TestHelpers exposing (..)


testSuite =
  suite
    "About Dictionaries"
    <| [ test
          "dictionaries can be empty"
          (assertEqual (Dict.size Dict.empty) 0)
       , test
          "or initialized with a single key-value pair"
          (assertEqual (Dict.size <| Dict.singleton 1 "a") 1)
       , test
          "or from a list of key-value pairs"
          (assertEqual (Dict.size <| Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) 2)
       , test
          "they can also be converted back to a list"
          (assertEqual (Dict.toList <| Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) [ (1, "a"), (2, "b") ])
       , test
          "checking for an empty dictionary is easy"
          (assertEqual (Dict.isEmpty Dict.empty) True)
       , test
          "you can also check if a key is present in the dictionary"
          (assertEqual (Dict.member 1 <| Dict.singleton 1 "a") True)
       , test
          "or get the value associated with the key"
          (assertEqual (Dict.get 1 <| Dict.singleton 1 "a") (Just "a"))
       , test
          "a key-value pair can be added to the dictionary"
          (assertEqual (Dict.get 2 <| Dict.insert 2 "b" <| Dict.singleton 1 "a") (Just "b"))
       , test
          "inserting can also overwrite the value associated with a key"
          (assertEqual (Dict.get 1 <| Dict.insert 1 "b" <| Dict.singleton 1 "a") (Just "b"))
       , test
          "updating a value works similarly"
          (assertEqual (Dict.get 1 <| Dict.update 1 (\_ -> Just "b") <| Dict.singleton 1 "a") (Just "b"))
       , test
          "but knows about the current value"
          (assertEqual (Dict.get 1 <| Dict.update 1 (\v -> (Maybe.withDefault "" v) ++ "b" |> Just) <| Dict.singleton 1 "a") (Just "ab"))
       , test
          "updating can add a new value"
          (assertEqual (Dict.get 2 <| Dict.update 2 (\_ -> Just "b") <| Dict.singleton 1 "a") (Just "b"))
       , test
          "or even remove a value"
          (assertEqual (Dict.get 1 <| Dict.update 1 (\_ -> Nothing) <| Dict.singleton 1 "a") (Nothing))
       , test
          "of course there is a more direct way to remove a value too"
          (assertEqual (Dict.get 1 <| Dict.remove 1 <| Dict.singleton 1 "a") (Nothing))
       , test
          "you can get the list of keys"
          (assertEqual (Dict.keys <| Dict.singleton 1 "a") [1])
       , test
          "or the list of values"
          (assertEqual (Dict.values <| Dict.singleton 1 "a") ["a"])
       , test
          "you can get the union of two dictionaries"
          (assertEqual (Dict.values <| Dict.union (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) (Dict.fromList [ ( 2, "c" ), ( 3, "d" ) ])) [ "a", "b", "d" ])
       , test
          "or the intersection"
          (assertEqual (Dict.values <| Dict.intersect (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) (Dict.fromList [ ( 2, "c" ), ( 3, "d" ) ])) [ "b" ])
       , test
          "or the difference"
          (assertEqual (Dict.values <| Dict.diff (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) (Dict.fromList [ ( 2, "c" ), ( 3, "d" ) ])) ["a"])
       , test
          "mapping works similarly as with lists"
          -- so does filter, foldl, foldr, partition
          (assertEqual (Dict.values <| Dict.map (\k v -> v ++ "c") (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ])) [ "ac", "bc" ])
       ]

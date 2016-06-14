module AboutArrays exposing (..)

import ElmTest exposing (..)
import Array exposing (fromList)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Arrays"
    [ test
        "arrays can be created from a list"
        (assertEqual (fromList [ 0, 1 ]) (fromList [ 0, 1 ]))
    , test
        "arrays can also be turned into lists"
        (assertEqual (Array.toList <| fromList [ 0, 1 ]) [ 0, 1 ])
    , test
        "length gives the number of elements"
        (assertEqual (Array.length <| fromList [ 0, 1, 2 ]) 3)
    , test
        "values can be pushed on to an array"
        (assertEqual (Array.push 3 <| fromList [ 1, 2 ]) (fromList [ 1, 2, 3 ]))
    , test
        "or two arrays can become one"
        (assertEqual (Array.append (fromList [ 1, 2 ]) (fromList [ 3 ])) (fromList [1, 2, 3]))
    , test
        "it is easy to create an empty array"
        (assertEqual (Array.push 1 <| Array.empty) (fromList [ 1 ]))
    , test
        "or to create an array of all the same value"
        (assertEqual (Array.repeat 3 "a") (fromList [ "a", "a", "a" ]))
    , test
        "initialize creates an array based on the index"
        (assertEqual (Array.initialize 3 (\i -> i * 2)) (fromList [ 0, 2, 4  ]))
    , test
        "you can test whether an array is empty"
        (assertEqual (Array.isEmpty Array.empty) True)
    , test
        "mapping is just like with lists"
        -- so is indexedMap, filter, foldl, foldr
        (assertEqual (Array.map (\i -> i * 3) <| fromList [ 0, 1, 2 ]) (fromList [ 0, 3, 6 ]))
    , test
        "unlike with lists, you can get the value at an index"
        (assertEqual (Array.get 1 <| fromList [ 0, 1, 2 ]) (Just 1))
    , test
        "and set the value at an index"
        (assertEqual (Array.set 1 5 <| fromList [ 0, 1, 2 ]) (fromList [ 0, 5, 2 ]))
    , test
        "or get a slice of the array"
        (assertEqual (Array.slice 1 4 <| fromList [ 0, 1, 2, 3, 4 ]) (fromList [ 1, 2, 3 ]))
    ]

module AboutSets exposing (..)

import ElmTest exposing (..)
import Set
import TestHelpers exposing (..)


assertEqualSets set1 set2 =
  assertEqual (Set.toList set1) (Set.toList set2)


oneTwoThree =
  Set.fromList [ 1, 2, 3 ]


testSuite =
  suite
    "About Sets"
    [ test
        "a set can be created from a list"
        (assertEqualSets (Set.fromList [ 1, 2, 3 ]) (Set.fromList [1, 2, 3]))
    , test
        "a set cannot contain duplicates"
        (assertEqualSets (Set.fromList [ 1, 2, 3, 3, 2, 1 ]) (Set.fromList [1, 2, 3]))
    , test
        "sets may be empty"
        (assertEqualSets Set.empty Set.empty)
    , test
        "or contain a single value"
        (assertEqualSets (Set.singleton 0) (Set.singleton 0))
    , test
        "insert may add a new element to a set"
        (assertEqualSets (Set.insert 4 oneTwoThree) (Set.fromList [1, 2, 3, 4]))
    , test
        "but may not add duplicates"
        (assertEqualSets (Set.insert 1 oneTwoThree) (Set.fromList [1, 2, 3]))
    , test
        "remove may subtract an element from a set"
        (assertEqualSets (Set.remove 1 oneTwoThree) (Set.fromList [2, 3]))
    , test
        "but only if it is there"
        (assertEqualSets (Set.remove 4 oneTwoThree) (Set.fromList [1, 2, 3]))
    , test
        "member can check if an element is in a set"
        (assertEqual (Set.member 2 oneTwoThree) True)
    , test
        "union will add two sets"
        (assertEqualSets (Set.union oneTwoThree (Set.fromList [ 3, 4 ])) (Set.fromList [1, 2, 3, 4]))
    , test
        "intersect will get the intersection"
        (assertEqualSets (Set.intersect oneTwoThree (Set.fromList [ 3, 4 ])) (Set.fromList [3]))
    , test
        "diff is the difference between the first and second sets"
        (assertEqualSets (Set.diff oneTwoThree (Set.fromList [ 1, 3 ])) (Set.fromList [2]))
    ]

module AboutDates exposing (..)

import Date
import ElmTest exposing (..)
import TestHelpers exposing (..)


-- dates can be created from a Time


ourDate =
  Date.fromTime 0



-- parsing a date could fail, and so returns a Result


parsedDate =
  Date.fromString "1/1/2000 11:30:45 AM"


getField : (Date.Date -> a) -> Result String Date.Date -> String
getField fn date =
  case date of
    Ok value ->
      toString (fn value)

    Err msg ->
      msg


testSuite =
  suite
    "About Dates"
    [ test
        "year gets the year"
        (assertEqual (Date.year ourDate) 1970)
    , test
        "month gets the month"
        -- a type!
        (assertEqual (Date.month ourDate) Date.Jan)
    , test
        "day gets the day"
        (assertEqual (Date.day ourDate) 1)
    , test
        "dayOfWeek gets the day of the week"
        -- another type
        (assertEqual (Date.dayOfWeek ourDate) Date.Thu)
    , test
        "hour gets the hour"
        (assertEqual (getField Date.hour parsedDate) "11")
    , test
        "minute gets the minute"
        (assertEqual (getField Date.minute parsedDate) "30")
    , test
        "second gets the second"
        (assertEqual (getField Date.second parsedDate) "45")
    ]

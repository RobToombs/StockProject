module Types exposing (..)


type alias News =
    { buzz : Buzz
    , companyNewsScore : Float
    , sectorAverageBullishPercent : Float
    , sectorAverageNewsScore : Float
    , sentiment : Sentiment
    , symbol : String
    }


defaultNews : News
defaultNews =
    News defaultBuzz 0.0 0.0 0.0 defaultSentiment ""


type alias Buzz =
    { articlesInLastWeek : Int
    , buzz : Float
    , weeklyAverage : Float
    }


defaultBuzz : Buzz
defaultBuzz =
    Buzz 0 0.0 0.0


type alias Sentiment =
    { bearishPercent : Float
    , bullishPercent : Float
    }


defaultSentiment : Sentiment
defaultSentiment =
    Sentiment 0.0 0.0

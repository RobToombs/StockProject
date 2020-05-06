module Types exposing (..)

import Http


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


type alias CompanyInfo =
    { address : String
    , city : String
    , country : String
    , currency : String
    , cusip : String
    , sedol : String
    , description : String
    , employeeTotal : String
    , exchange : String
    , ggroup : String
    , gind : String
    , gsector : String
    , gsubind : String
    , ipo : String
    , isin : String
    , marketCapitalization : Float
    , naics : String
    , naicsNationalIndustry : String
    , naicsSector : String
    , naicsSubsector : String
    , name : String
    , phone : String
    , shareOutstanding : Float
    , state : String
    , ticker : String
    , weburl : String
    }


defaultCompanyInfo : CompanyInfo
defaultCompanyInfo =
    CompanyInfo "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" 0.0 "" "" "" "" "" "" 0.0 "" "" ""


premiumOnlyCompanyInfo : CompanyInfo
premiumOnlyCompanyInfo =
    CompanyInfo "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" 0.0 "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" "Premium Account Only" 0.0 "Premium Account Only" "Premium Account Only" "Premium Account Only"


type alias Quote =
    { c : Float
    , h : Float
    , l : Float
    , o : Float
    , pc : Float
    }


defaultQuote : Quote
defaultQuote =
    Quote 0.0 0.0 0.0 0.0 0.0


type RequestType
    = QuoteSearch


type alias RequestError =
    { errorType : RequestType
    , error : Http.Error
    }

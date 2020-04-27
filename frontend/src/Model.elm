module Model exposing (..)

import Http
import Types exposing (..)


type alias Model =
    { symbol : String
    , news : News
    , companyInfo : CompanyInfo
    , quote : Quote
    }


defaultModel : Model
defaultModel =
    Model "" defaultNews defaultCompanyInfo defaultQuote


type Msg
    = FetchSymbolInfo
      --  | ReceivedMessage (Result Http.Error String)
    | UpdateSymbol String
    | EnterListener Int
    | NewsResponse (Result Http.Error News)
    | CompanyInfoResponse (Result Http.Error CompanyInfo)
    | QuoteResponse String (Result Http.Error Quote)
    | SaveQuoteResponse (Result Http.Error Int)

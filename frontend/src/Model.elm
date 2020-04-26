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
    | NewsResponse (Result Http.Error News)
    | CompanyInfoResponse (Result Http.Error CompanyInfo)
    | QuoteResponse (Result Http.Error Quote)

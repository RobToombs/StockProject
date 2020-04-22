module Model exposing (..)

import Http
import Types exposing (..)


type alias Model =
    { symbol : String
    , news : News
    }


defaultModel : Model
defaultModel =
    Model "" defaultNews


type Msg
    = FetchNewsUpdates
      --  | ReceivedMessage (Result Http.Error String)
    | UpdateSymbol String
    | NewsResponse (Result Http.Error News)

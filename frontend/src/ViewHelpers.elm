module ViewHelpers exposing (..)

import Html exposing (Attribute)
import Html.Events exposing (keyCode, on)
import Json.Decode as Json


onKeyUp : (Int -> msg) -> Attribute msg
onKeyUp tagger =
    on "keyup" (Json.map tagger keyCode)

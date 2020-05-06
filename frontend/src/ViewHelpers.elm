module ViewHelpers exposing (..)

import Html exposing (Attribute)
import Html.Events exposing (keyCode, on)
import Http exposing (Error(..))
import Json.Decode as Json


onKeyUp : (Int -> msg) -> Attribute msg
onKeyUp tagger =
    on "keyup" (Json.map tagger keyCode)


errorToString : Http.Error -> String
errorToString err =
    case err of
        Timeout ->
            "Timeout exceeded"

        NetworkError ->
            "Network error"

        BadStatus status ->
            "Bad Status: " ++ String.fromInt status

        BadBody resp ->
            "Unexpected response from api: " ++ resp

        BadUrl url ->
            "Malformed url: " ++ url

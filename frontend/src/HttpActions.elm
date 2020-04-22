module HttpActions exposing (..)

import Http exposing (Body, Expect, Header)
import HttpHelpers exposing (createGet)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (optional, required)
import Model exposing (Msg(..))
import Types exposing (Buzz, News, Sentiment, defaultBuzz, defaultSentiment)


getNewsUpdates : String -> Cmd Msg
getNewsUpdates symbol =
    let
        url =
            "https://finnhub.io/api/v1/news-sentiment?symbol=" ++ symbol ++ "&token=" ++ finnhubApiKey
    in
    Http.get <| createGet url NewsResponse newsDecoder



--fetchHelloWorld : Cmd Msg
--fetchHelloWorld =
--    let
--        url_ =
--            "/api/hello"
--
--        expect_ =
--            Http.expectString ReceivedMessage
--    in
--    Http.get { url = url_, expect = expect_ }


newsDecoder : Decode.Decoder News
newsDecoder =
    Decode.succeed News
        |> optional "buzz" buzzDecoder defaultBuzz
        |> optional "companyNewsScore" Decode.float 0.0
        |> optional "sectorAverageBullishPercent" Decode.float 0.0
        |> optional "sectorAverageNewsScore" Decode.float 0.0
        |> optional "sentiment" sentimentDecoder defaultSentiment
        |> optional "symbol" Decode.string ""


buzzDecoder : Decode.Decoder Buzz
buzzDecoder =
    Decode.succeed Buzz
        |> optional "articlesInLastWeek" Decode.int 0
        |> optional "buzz" Decode.float 0.0
        |> optional "weeklyAverage" Decode.float 0.0


sentimentDecoder : Decode.Decoder Sentiment
sentimentDecoder =
    Decode.succeed Sentiment
        |> optional "bearishPercent" Decode.float 0.0
        |> optional "bullishPercent" Decode.float 0.0


finnhubApiKey : String
finnhubApiKey =
    "bqfqd47rh5r9oe99lsc0"

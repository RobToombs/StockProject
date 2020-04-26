module HttpActions exposing (..)

import Http exposing (Body, Expect, Header)
import HttpHelpers exposing (createGet)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (optional, required)
import Model exposing (Msg(..))
import Types exposing (Buzz, CompanyInfo, News, Sentiment, defaultBuzz, defaultSentiment)


getNewsUpdates : String -> Cmd Msg
getNewsUpdates symbol =
    let
        url =
            "https://finnhub.io/api/v1/news-sentiment?symbol=" ++ symbol ++ "&token=" ++ finnhubApiKey
    in
    Http.get <| createGet url NewsResponse newsDecoder


getCompanyInfo : String -> Cmd Msg
getCompanyInfo symbol =
    let
        url =
            "https://finnhub.io/api/v1/stock/profile?symbol=" ++ symbol ++ "&token=" ++ finnhubApiKey
    in
    Http.get <| createGet url CompanyInfoResponse companyInfoDecoder



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


companyInfoDecoder : Decode.Decoder CompanyInfo
companyInfoDecoder =
    Decode.succeed CompanyInfo
        |> optional "address" Decode.string ""
        |> optional "city" Decode.string ""
        |> optional "country" Decode.string ""
        |> optional "currency" Decode.string ""
        |> optional "cusip" Decode.string ""
        |> optional "sedol" Decode.string ""
        |> optional "description" Decode.string ""
        |> optional "employeeTotal" Decode.string ""
        |> optional "exchange" Decode.string ""
        |> optional "ggroup" Decode.string ""
        |> optional "gind" Decode.string ""
        |> optional "gsector" Decode.string ""
        |> optional "gsubind" Decode.string ""
        |> optional "ipo" Decode.string ""
        |> optional "isin" Decode.string ""
        |> optional "marketCapitalization" Decode.float 0.0
        |> optional "naics" Decode.string ""
        |> optional "naicsNationalIndustry" Decode.string ""
        |> optional "naicsSector" Decode.string ""
        |> optional "naicsSubsector" Decode.string ""
        |> optional "name" Decode.string ""
        |> optional "phone" Decode.string ""
        |> optional "shareOutstanding" Decode.float 0.0
        |> optional "state" Decode.string ""
        |> optional "ticker" Decode.string ""
        |> optional "weburl" Decode.string ""


finnhubApiKey : String
finnhubApiKey =
    "bqfqd47rh5r9oe99lsc0"

module View exposing (..)

import Bootstrap.Form.Input as Input
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Model exposing (..)
import Types exposing (CompanyInfo, News, Quote)
import ViewHelpers exposing (onKeyUp)


view : Model -> Html Msg
view model =
    div []
        [ fetchSymbolInput model
        , contentContainer model
        ]


contentContainer : Model -> Html Msg
contentContainer model =
    Grid.containerFluid []
        [ Grid.simpleRow
            [ Grid.col [ Col.xs4 ] (displayCompanyInfo model.companyInfo)
            , Grid.col [ Col.xs4 ] (displayQuote model.quote)
            , Grid.col [ Col.xs4 ] (displayNews model.news)
            ]
        ]


fetchSymbolInput : Model -> Html Msg
fetchSymbolInput model =
    Grid.containerFluid
        []
        [ Grid.simpleRow
            [ Grid.col
                [ Col.xs1 ]
                [ Input.text [ Input.id "symbolInput", Input.small, Input.placeholder "Symbol", Input.onInput UpdateSymbol, Input.attrs [ onKeyUp EnterListener ] ] ]
            , Grid.col
                [ Col.xs1 ]
                [ button [ onClick FetchSymbolInfo ] [ text "Fetch Info" ] ]
            , Grid.col [ Col.xs1 ] [ createRow "Symbol:" model.news.symbol ]
            ]
        ]


displayQuote : Quote -> List (Html Msg)
displayQuote quote =
    [ createRow "Current Price:" (dollars quote.c)
    , createRow "Day High:" (dollars quote.h)
    , createRow "Day Low:" (dollars quote.l)
    , createRow "Opening Price:" (dollars quote.o)
    , createRow "Previous Close Price:" (dollars quote.pc)
    ]


displayNews : News -> List (Html Msg)
displayNews news =
    let
        buzz =
            news.buzz

        sentiment =
            news.sentiment
    in
    [ createRow "Company News Score:" (String.fromFloat news.companyNewsScore)
    , createRow "Sector Average Bullish Percent:" (String.fromFloat news.sectorAverageBullishPercent)
    , createRow "Sector Average News Percent:" (String.fromFloat news.sectorAverageNewsScore)
    , createSeparator "--- Buzz ---"
    , createRow "Articles In Last Week:" (String.fromInt buzz.articlesInLastWeek)
    , createRow "Buzz:" (String.fromFloat buzz.buzz)
    , createRow "Weekly Average:" (String.fromFloat buzz.weeklyAverage)
    , createSeparator "--- Sentiment ---"
    , createRow "Bearish Percent:" (String.fromFloat sentiment.bearishPercent)
    , createRow "Bullish Percent:" (String.fromFloat sentiment.bullishPercent)
    ]


displayCompanyInfo : CompanyInfo -> List (Html Msg)
displayCompanyInfo companyInfo =
    [ createRow "Name:" companyInfo.name
    , createRow "Description:" companyInfo.description
    , createRow "Address:" companyInfo.address
    , createRow "City:" companyInfo.city
    , createRow "Country:" companyInfo.country
    , createRow "Employees:" companyInfo.employeeTotal
    , createRow "Exchange:" companyInfo.exchange
    , createRow "Currency:" companyInfo.currency
    , createRow "CUSIP:" companyInfo.cusip
    , createRow "Sedol #:" companyInfo.sedol
    , createRow "GICS Industry Group:" companyInfo.ggroup
    , createRow "GICS Industry:" companyInfo.gind
    , createRow "GICS Sub-Industry:" companyInfo.gsubind
    , createRow "GICS Sector:" companyInfo.gsector
    , createRow "ISIN #:" companyInfo.isin
    , createRow "NAICS National Industry:" companyInfo.naicsNationalIndustry
    , createRow "NAICS Industry:" companyInfo.naics
    , createRow "NAICS Sector:" companyInfo.naicsSector
    , createRow "NAICS Sub-Sector:" companyInfo.naicsSubsector
    , createRow "Phone:" companyInfo.phone
    , createRow "State:" companyInfo.state
    , createRow "Website:" companyInfo.weburl
    , createRow "Market Capitalization:" (String.fromFloat companyInfo.marketCapitalization)
    , createRow "Outstanding Shares:" (String.fromFloat companyInfo.shareOutstanding)
    ]


createRow : String -> String -> Html msg
createRow title value =
    Grid.simpleRow
        [ Grid.col
            [ Col.xs6 ]
            [ text title ]
        , Grid.col
            [ Col.xs6 ]
            [ text value ]
        ]


createSeparator : String -> Html Msg
createSeparator title =
    Grid.simpleRow
        [ Grid.col
            [ Col.xs12 ]
            [ text title ]
        ]


dollars : Float -> String
dollars amount =
    "$" ++ String.fromFloat amount

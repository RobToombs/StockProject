module View exposing (..)

import Bootstrap.Form.Input as Input
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Model exposing (..)
import Types exposing (News)


view : Model -> Html Msg
view model =
    div []
        [ fetchNewsInput
        , displayNews model.news
        ]


fetchNewsInput : Html Msg
fetchNewsInput =
    Grid.containerFluid
        []
        [ Grid.simpleRow
            [ Grid.col
                [ Col.xs1 ]
                [ button [ onClick FetchNewsUpdates ] [ text "Fetch News" ] ]
            , Grid.col
                [ Col.xs1 ]
                [ Input.text [ Input.id "symbolInput", Input.small, Input.placeholder "Symbol", Input.onInput UpdateSymbol ] ]
            ]
        ]


displayNews : News -> Html Msg
displayNews news =
    let
        buzz =
            news.buzz

        sentiment =
            news.sentiment
    in
    Grid.containerFluid
        []
        [ createRow "Symbol:" news.symbol
        , createRow "Company News Score:" (String.fromFloat news.companyNewsScore)
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


createRow : String -> String -> Html msg
createRow title value =
    Grid.simpleRow
        [ Grid.col
            [ Col.xs2 ]
            [ text title ]
        , Grid.col
            [ Col.xs1 ]
            [ text value ]
        ]


createSeparator : String -> Html Msg
createSeparator title =
    Grid.simpleRow
        [ Grid.col
            [ Col.xs3 ]
            [ text title ]
        ]

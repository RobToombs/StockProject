module Update exposing (..)

import HttpActions exposing (getCompanyInfo, getNewsUpdates, getQuote)
import Model exposing (Model, Msg(..))
import Task
import Types exposing (premiumOnlyCompanyInfo)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        --ReceivedMessage result ->
        --    case result of
        --        Ok message_ ->
        --            let
        --                updatedModel =
        --                    { model | message = message_ }
        --            in
        --            ( updatedModel, Cmd.none )
        --
        --        Err _ ->
        --            let
        --                updatedModel =
        --                    { model | message = "Error receiving message from backend." }
        --            in
        --            ( updatedModel, Cmd.none )
        UpdateSymbol symbol_ ->
            ( { model | symbol = symbol_ }, Cmd.none )

        EnterListener key ->
            let
                result =
                    if key == 13 then
                        update FetchSymbolInfo model

                    else
                        ( model, Cmd.none )
            in
            result

        FetchSymbolInfo ->
            let
                commands =
                    Cmd.batch
                        [ getNewsUpdates model.symbol
                        , getCompanyInfo model.symbol
                        , getQuote model.symbol
                        ]
            in
            ( model, commands )

        NewsResponse result ->
            case result of
                Ok news_ ->
                    let
                        updatedModel =
                            { model | news = news_ }
                    in
                    ( updatedModel, Cmd.none )

                Err err ->
                    ( model, Cmd.none )

        CompanyInfoResponse result ->
            case result of
                Ok companyInfo_ ->
                    let
                        updatedModel =
                            { model | companyInfo = companyInfo_ }
                    in
                    ( updatedModel, Cmd.none )

                Err err ->
                    let
                        updatedModel =
                            { model | companyInfo = premiumOnlyCompanyInfo }
                    in
                    ( updatedModel, Cmd.none )

        QuoteResponse result ->
            case result of
                Ok quote_ ->
                    let
                        updatedModel =
                            { model | quote = quote_ }
                    in
                    ( updatedModel, Cmd.none )

                Err err ->
                    ( model, Cmd.none )

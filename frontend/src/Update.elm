module Update exposing (..)

import Http
import HttpActions exposing (getCompanyInfo, getNewsUpdates, getQuote, saveQuote)
import Model exposing (Model, Msg(..))
import Types exposing (RequestError, RequestType(..), premiumOnlyCompanyInfo)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
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

        QuoteResponse symbol result ->
            case result of
                Ok quote_ ->
                    let
                        updatedModel =
                            { model | quote = quote_ }

                        saveQuoteRequest =
                            saveQuote symbol quote_
                    in
                    ( updatedModel, saveQuoteRequest )

                Err err ->
                    ( model, Cmd.none )

        SaveQuoteResponse result ->
            let
                updatedErrorList =
                    handleRequestError model.requestErrors result QuoteSearch
            in
            case result of
                Ok id ->
                    ( { model | requestErrors = updatedErrorList }, Cmd.none )

                Err err ->
                    ( { model | requestErrors = updatedErrorList }, Cmd.none )


handleRequestError : List RequestError -> Result Http.Error a -> RequestType -> List RequestError
handleRequestError existing result errType =
    let
        filteredErrors =
            List.filter (\error -> error.errorType /= errType) existing
    in
    case result of
        Ok _ ->
            filteredErrors

        Err err ->
            let
                newError =
                    RequestError errType err
            in
            List.append [ newError ] filteredErrors

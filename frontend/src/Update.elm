module Update exposing (..)

import HttpActions exposing (getNewsUpdates)
import Model exposing (Model, Msg(..))


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

        FetchNewsUpdates ->
            ( model, getNewsUpdates model.symbol )

        NewsResponse result ->
            case result of
                Ok news_ ->
                    let
                        updatedModel =
                            { model | news = news_ }
                    in
                    ( updatedModel, Cmd.none )

                Err err ->
                    let
                        d =
                            Debug.log "Error retrieving news updates" err
                    in
                    ( model, Cmd.none )

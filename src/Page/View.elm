module Page.View exposing (Model, Msg, init, subscriptions, update, view)

import Env exposing (Env)
import Html exposing (..)
import Route



-- MODEL


type alias Model =
    { env : Env
    , id : Int
    }


init : Env -> Int -> ( Model, Cmd Msg )
init env id =
    ( Model env id
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOps


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOps ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> { title : String, body : List (Html Msg) }
view model =
    { title = "メニュー"
    , body =
        [ div [] [ a [ Route.href Route.Index ] [ text "トップに戻る" ] ]
        , div [] [ p [] [ text <| "メニュー " ++ String.fromInt model.id ] ]
        ]
    }

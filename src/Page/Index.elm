module Page.Index exposing (Model, Msg, init, subscriptions, update, view)

import Env exposing (Env)
import Html exposing (..)
import Route



-- MODEL


type alias Model =
    { env : Env
    , items : List Int
    }


init : Env -> ( Model, Cmd Msg )
init env =
    let
        items = List.range 1 5
    in
    ( Model env items
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
    { title = "トップ"
    , body =
        [ ul [] <| List.map (\item -> li [] [ a [ Route.href <| Route.View item ] [ text <| "メニュー " ++ String.fromInt item ] ]) model.items
        ]
    }

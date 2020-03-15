module Route exposing (Route(..), fromUrl, href, parser, routeToString)

import Html exposing (Attribute)
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser)


type Route
    = Index
    | View Int


parser : Parser (Route -> a) a
parser =
    Parser.oneOf
        [ Parser.map Index (Parser.s "pwa-elm-spa-sample")
        , Parser.map View (Parser.s "pwa-elm-spa-sample" </> Parser.s "view" </> Parser.int)
        ]


fromUrl : Url -> Maybe Route
fromUrl url =
    Parser.parse parser url


href : Route -> Attribute msg
href targetRoute =
    Attr.href (routeToString targetRoute)


routeToString : Route -> String
routeToString page =
    let
        pieces =
            case page of
                Index ->
                    []

                View id ->
                    [ "view", String.fromInt id ]
    in
    "/pwa-elm-spa-sample/" ++ String.join "/" pieces

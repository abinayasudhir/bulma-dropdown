module Main exposing (main)

import Browser
import Screen.State exposing (init, update)
import Screen.Types exposing (Model, Msg(..))
import Screen.View exposing (view)


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }

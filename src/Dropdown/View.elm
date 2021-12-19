module Dropdown.View exposing (view)

import Bulma.Elements exposing (TitleSize(..), content, icon, title)
import Bulma.Modifiers exposing (Size(..))
import Bulma.Modifiers.Typography exposing (Weight(..), capitalize, textLeft, textWeight, uppercase)
import Dropdown.Types as DD exposing (Model, Msg(..), OpenState(..), Option)
import Html exposing (Html, div, i, span, text)
import Html.Attributes exposing (class, tabindex)
import Html.Events exposing (on, onClick)
import Html.Events.Extra as HE
import Json.Decode as Decode


view : Model item -> Html (Msg item)
view model =
    div
        [ tabindex 0
        , on "focusout" <| Decode.succeed Close
        , onClick Open
        , class "dropdown-custom"
        ]
        [ span
            [ HE.onClickStopPropagation <|
                if model.state == Closed then
                    Open

                else
                    Close
            ]
            [ span [ uppercase ] [ text "Compare" ]
            , icon Standard [] [ i [ class "fa fa-caret-down" ] [] ]
            ]
        , if model.state == Opened then
            div [ class "list-items" ] <| List.map (listItem model.values) model.options

          else
            div [] []
        ]


listItem : List (Option item) -> Option item -> Html (Msg item)
listItem values option =
    div [ Html.Events.onClick (DD.Toggle option), class "list-item" ]
        [ content Standard
            [ capitalize, textLeft, textWeight Bold ]
            [ title H6
                []
                [ icon Standard
                    []
                    [ i
                        [ class <|
                            if List.member option values then
                                "fa fa-check-square"

                            else
                                "fa fa-square"
                        ]
                        []
                    ]
                , text option.label
                ]
            ]
        ]

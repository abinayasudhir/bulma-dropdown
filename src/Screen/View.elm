module Screen.View exposing (view)

import Bulma.CDN exposing (stylesheet)
import Bulma.Columns exposing (ColumnModifiers, column, columnModifiers, columns, columnsModifiers)
import Bulma.Elements exposing (TitleSize(..), box, content, subtitle, title)
import Bulma.Layout exposing (SectionSpacing(..), section)
import Bulma.Modifiers exposing (Devices, Size(..), Width(..))
import Bulma.Modifiers.Typography as BT exposing (Color(..), capitalize, textColor, textLeft, uppercase)
import Dropdown.View as DD
import Html exposing (Html, main_, text)
import Html.Attributes exposing (class, href, rel)
import Screen.Types exposing (Model, Msg(..))


myColumnModifiers : Width -> Maybe Width -> ColumnModifiers
myColumnModifiers offset width =
    let
        widths : Devices (Maybe Width)
        widths =
            columnModifiers.widths
    in
    { columnModifiers
        | offset =
            offset
        , widths =
            { widths
                | tablet = width
                , desktop = width
                , widescreen = width
                , fullHD = width
            }
    }


fontAwesomeCDN : Html msg
fontAwesomeCDN =
    Html.node "link"
        [ rel "stylesheet"
        , href "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        ]
        []


view : Model -> Html Msg
view model =
    let
        displaySelectedOptions options =
            List.map (\o -> o.label) options |> String.join ", " |> text
    in
    main_ []
        [ stylesheet
        , fontAwesomeCDN
        , box [ class "container top-container" ]
            [ content Standard
                [ uppercase, textLeft ]
                [ title H6 [ textColor BT.Black ] [ text "Overview" ]
                , subtitle H6
                    [ textLeft, capitalize, textColor Grey ]
                    [ text "Selected: "
                    , displaySelectedOptions model.dropDown1.values
                    ]
                ]
            , Html.map DD1 <| DD.view model.dropDown1
            ]
        , section NotSpaced
            [ class "container" ]
            [ columns columnsModifiers
                []
                [ column (myColumnModifiers Auto (Just Auto))
                    []
                    [ content Standard
                        [ textLeft ]
                        [ title H6 [ textColor BT.Black, BT.uppercase ] [ text "Breakdown" ]
                        , subtitle H6
                            [ textColor Grey ]
                            [ text "Select the options from dropdown menu"
                            ]
                        ]
                    ]
                ]
            , box []
                [ content Standard
                    [ textLeft ]
                    [ title H6 [ textColor BT.Black, uppercase ] [ text "Category1" ]
                    , subtitle H6
                        [ capitalize, textColor Grey ]
                        [ text "Selected: "
                        , displaySelectedOptions model.dropDown2.values
                        ]
                    ]
                , Html.map DD2 <| DD.view model.dropDown2
                ]
            , columns columnsModifiers
                []
                [ column (myColumnModifiers Auto (Just Auto))
                    []
                    [ box []
                        [ content Standard
                            [ textLeft ]
                            [ title H6 [ uppercase, textColor BT.Black ] [ text "Category2" ]
                            , subtitle H6
                                [ capitalize, textColor Grey ]
                                [ text "Selected: "
                                , displaySelectedOptions model.dropDown3.values
                                ]
                            ]
                        , Html.map DD3 <| DD.view model.dropDown3
                        ]
                    ]
                , column (myColumnModifiers Auto (Just Auto))
                    []
                    [ box []
                        [ content Standard
                            [ textLeft ]
                            [ title H6 [ uppercase, textColor BT.Black ] [ text "Category3" ]
                            , subtitle H6
                                [ capitalize, textColor Grey ]
                                [ text "Selected: "
                                , displaySelectedOptions model.dropDown4.values
                                ]
                            ]
                        , Html.map DD4 <| DD.view model.dropDown4
                        ]
                    ]
                ]
            ]
        ]

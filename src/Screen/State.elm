module Screen.State exposing (init, update)

import Dropdown.State as DD
import Screen.Types exposing (Model, Msg(..))


init : ( Model, Cmd Msg )
init =
    ( { dropDown1 =
            DD.init
                [ { label = "Option 1", value = "Option 1" }
                , { label = "Option 2", value = "Option 2" }
                , { label = "Option 3", value = "Option 3" }
                , { label = "Option 4", value = "Option 4" }
                , { label = "Option 5", value = "Option 5" }
                , { label = "Option 6", value = "Option 6" }
                , { label = "Option 7", value = "Option 7" }
                , { label = "Option 8", value = "Option 8" }
                , { label = "Option 9", value = "Option 9" }
                , { label = "Option 10", value = "Option 10" }
                ]
                [ { label = "Option 1", value = "Option 1" } ]
      , dropDown2 =
            DD.init
                [ { label = "Option 1", value = "Option 1" }
                , { label = "Option 2", value = "Option 2" }
                , { label = "Option 3", value = "Option 3" }
                , { label = "Option 4", value = "Option 4" }
                , { label = "Option 5", value = "Option 5" }
                ]
                []
      , dropDown3 =
            DD.init
                [ { label = "Option 1", value = "Option 1" }
                , { label = "Option 2", value = "Option 2" }
                , { label = "Option 3", value = "Option 3" }
                , { label = "Option 4", value = "Option 4" }
                , { label = "Option 5", value = "Option 5" }
                ]
                []
      , dropDown4 =
            DD.init
                [ { label = "Option 1", value = "Option 1" }
                , { label = "Option 2", value = "Option 2" }
                , { label = "Option 3", value = "Option 3" }
                , { label = "Option 4", value = "Option 4" }
                , { label = "Option 5", value = "Option 5" }
                ]
                []
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DD1 ddMsg ->
            let
                ( newModel, newCmd ) =
                    DD.update ddMsg model.dropDown1
            in
            ( { model | dropDown1 = newModel }
            , Cmd.map DD1 newCmd
            )

        DD2 ddMsg ->
            let
                ( newModel, newCmd ) =
                    DD.update ddMsg model.dropDown2
            in
            ( { model | dropDown2 = newModel }
            , Cmd.map DD2 newCmd
            )

        DD3 ddMsg ->
            let
                ( newModel, newCmd ) =
                    DD.update ddMsg model.dropDown3
            in
            ( { model | dropDown3 = newModel }
            , Cmd.map DD3 newCmd
            )

        DD4 ddMsg ->
            let
                ( newModel, newCmd ) =
                    DD.update ddMsg model.dropDown4
            in
            ( { model | dropDown4 = newModel }
            , Cmd.map DD4 newCmd
            )

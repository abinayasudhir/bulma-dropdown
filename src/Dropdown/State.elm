module Dropdown.State exposing (init, update)

import Dropdown.Types exposing (Model, Msg(..), OpenState(..), Option)


init : List (Option item) -> List (Option item) -> Model item
init options values =
    { options = options, values = values, state = Closed }


update : Msg item -> Model item -> ( Model item, Cmd (Msg item) )
update msg model =
    case msg of
        Open ->
            ( { model | state = Opened }
            , Cmd.none
            )

        Close ->
            ( { model | state = Closed }
            , Cmd.none
            )

        Toggle option ->
            let
                values =
                    if List.member option model.values then
                        List.filter (\i -> i /= option) model.values

                    else
                        List.append model.values [ option ]
            in
            ( { model | values = values }
            , Cmd.none
            )

module Screen.Types exposing (Model, Msg(..))

import Dropdown.Types as DD


type alias Model =
    { dropDown1 : DD.Model String
    , dropDown2 : DD.Model String
    , dropDown3 : DD.Model String
    , dropDown4 : DD.Model String
    }


type Msg
    = DD1 (DD.Msg String)
    | DD2 (DD.Msg String)
    | DD3 (DD.Msg String)
    | DD4 (DD.Msg String)

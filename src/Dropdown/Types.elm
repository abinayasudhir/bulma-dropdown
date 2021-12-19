module Dropdown.Types exposing (Model, Msg(..), OpenState(..), Option)


type alias Option item =
    { label : String
    , value : item
    }


type OpenState
    = Opened
    | Closed


type alias Model item =
    { options : List (Option item)
    , values : List (Option item)
    , state : OpenState
    }


type Msg item
    = Open
    | Close
    | Toggle (Option item)

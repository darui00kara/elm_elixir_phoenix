module Message exposing (..)

import Navigation exposing (Location)

type Msg =
  UrlChange Location
  | NewUrl String

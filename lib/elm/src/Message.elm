module Message exposing (..)

import Navigation exposing (Location)
import Http exposing (..)

import Model.User as User

type Msg =
  UrlChange Location
  | NewUrl String
  | RequestUserData (Result Http.Error User.Schema)

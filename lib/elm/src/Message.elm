module Message exposing (..)

import Navigation exposing (Location)

import Request.Message as ReqMsg
import Model.Form as Form

type Msg =
  UrlChange Location
  | NewUrl String
  | RequestMsg ReqMsg.Msg
  | FormInput Form.Msg

module Message exposing (..)

import Navigation exposing (Location)

import Request.Message as ReqMsg

type Msg =
  UrlChange Location
  | NewUrl String
  | RequestMsg ReqMsg.Msg

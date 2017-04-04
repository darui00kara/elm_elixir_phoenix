module Request.Helper exposing (ReqMsg(..), ReqResult, get)

import Http exposing (Request, Error, get, send)
import Json.Decode exposing (Decoder)

type ReqMsg e a =
  Failure e
  | Success a

type alias ReqResult a =
  ReqMsg Error a

get : String -> (ReqResult a -> msg) -> Decoder a -> Cmd msg
get apiUrl translation decoder =
  (Http.get apiUrl decoder) |> sendReq |> cmdMap translation

sendReq : Http.Request a -> Cmd (ReqResult a)
sendReq =
  Http.send resultToMessage

resultToMessage : Result e a -> ReqMsg e a
resultToMessage result =
  case result of
    Ok  value  -> Success value
    Err reason -> Failure reason

cmdMap : (ReqResult a -> msg) -> Cmd (ReqResult a) -> Cmd msg
cmdMap translation cmd =
  Cmd.map translation cmd

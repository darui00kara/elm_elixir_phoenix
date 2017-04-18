module Request.Helper exposing (ReqMsg(..), ReqResult, get, post)

import Http exposing (Request, Error, Body, get, send)
import Json.Decode exposing (Decoder)
import Json.Encode as Encode exposing (Value)

type ReqMsg e a =
  Failure e
  | Success a

type alias ReqResult a =
  ReqMsg Error a

get : String -> (ReqResult a -> msg) -> Decoder a -> Cmd msg
get apiUrl translation decoder =
  (Http.get apiUrl decoder) |> sendReq |> cmdMap translation

post : String -> (ReqResult a -> msg) -> Decoder a -> Encode.Value -> Cmd msg
post apiUrl translation decoder body =
  (Http.post apiUrl (Http.jsonBody body) decoder) |> sendReq |> cmdMap translation

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

module Request.Helper exposing
  ( ReqMsg(..)
  , ReqResult
  , get
  , post
  , makeRequest
  , getRequest
  , postRequest
  )

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

makeRequest :
  String
  -> List Http.Header
  -> String
  -> Decoder a
  -> Http.Body
  -> Http.Request a
makeRequest url headers method decoder body =
  Http.request
    { url = url
    , headers = headers
    , method = method
    , expect = Http.expectJson decoder
    , body = body
    , timeout = Nothing
    , withCredentials = False
    }

getRequest : String -> List Http.Header -> Decoder a -> Http.Request a
getRequest url headers decoder =
  makeRequest url headers "GET" decoder Http.emptyBody

postRequest : String -> List Http.Header -> Decoder a -> Encode.Value -> Http.Request a
postRequest url headers decoder body =
  makeRequest url headers "POST" decoder (Http.jsonBody body)

putRequest : String -> List Http.Header -> Decoder a -> Encode.Value -> Http.Request a
putRequest url headers decoder body =
  makeRequest url headers "PUT" decoder (Http.jsonBody body)

deleteRequest : String -> List Http.Header -> Decoder a -> Encode.Value -> Http.Request a
deleteRequest url headers decoder body =
  makeRequest url headers "DELETE" decoder (Http.jsonBody body)

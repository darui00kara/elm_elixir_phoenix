module Temp exposing (..)

import Http exposing (..)
import Json.Decode as Decode

import Model.User as User exposing (..)
import Message as Msg exposing (..)

type alias JsonSchema =
  { data : User.Schema }

-- decoder

idDecoder =
  (Decode.field "id" Decode.int)

nameDecoder =
  (Decode.field "name" Decode.string)

emailDecoder =
  (Decode.field "email" Decode.string)

userDecoder =
  Decode.map3 User.Schema idDecoder nameDecoder emailDecoder

userDataDecoder =
  (Decode.field "data" userDecoder)

-- request 

getUserUrl : String
getUserUrl =
  "http://localhost:4000/api/users/1"

getUser : Http.Request User.Schema
getUser =
  Http.get getUserUrl userDataDecoder

sendRequest : Cmd Msg
sendRequest =
  Http.send Msg.RequestUserData getUser 

module Temp exposing (..)

import Http exposing (..)
import Json.Decode as Decode

import Model.User as User exposing (..)
import Message as Msg exposing (..)

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

usersDecoder =
  Decode.list userDecoder

usersDataDecoder =
  (Decode.field "data" usersDecoder)

-- request 

getUserUrl : String
getUserUrl =
  "http://localhost:4000/api/users/1"

getUserUrl2 : String
getUserUrl2 =
  "http://localhost:4000/api/users"

getUser : Http.Request User.Schema
getUser =
  Http.get getUserUrl userDataDecoder

sendRequest : Cmd Msg
sendRequest =
  Http.send Msg.RequestUserData getUser 

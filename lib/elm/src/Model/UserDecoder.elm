module Model.UserDecoder exposing (user, listUsers, empty)

import Json.Decode as Decode exposing (Decoder, int, string)

import Model.User as User

id : Decoder Int
id =
  (Decode.field "id" int)

name : Decoder String
name =
  (Decode.field "name" string)

email : Decoder String
email =
  (Decode.field "email" string)

user : Decoder User.Schema
user =
  (Decode.map3 User.Schema id name email) |> Decode.field "data"

listUsers : Decoder (List User.Schema)
listUsers =
  (Decode.map3 User.Schema id name email) |> Decode.list |> Decode.field "data"

empty : Decoder String
empty =
  (Decode.succeed "")

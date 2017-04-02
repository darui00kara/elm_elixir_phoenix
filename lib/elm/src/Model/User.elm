module Model.User exposing
  (Schema, new, userDecode, listUsersDecode, showApi, indexApi)

import Json.Decode as Decode exposing (Decoder, int, string)

type alias Schema =
  { id : Int
  , name : String
  , email : String
  }

new : Schema
new =
  Schema 0 "" ""

id : Decoder Int
id =
  (Decode.field "id" int)

name : Decoder String
name =
  (Decode.field "name" string)

email : Decoder String
email =
  (Decode.field "email" string)

user : Decoder Schema
user =
  Decode.map3 Schema id name email

listUsers : Decoder (List Schema)
listUsers =
  Decode.list user

userDecode : Decoder Schema
userDecode =
  (Decode.field "data" user)

listUsersDecode : Decoder (List Schema)
listUsersDecode =
  (Decode.field "data" listUsers)

showApi : String -> String
showApi id =
  "http://localhost:4000/api/users/" ++ id

indexApi : String
indexApi =
  "http://localhost:4000/api/users"

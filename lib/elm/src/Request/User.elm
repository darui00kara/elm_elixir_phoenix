module Request.User exposing (show, index)

import Json.Decode as Decode exposing (Decoder, int, string)

import Request.Helper exposing (..)
import Model.User as User

type Msg =
  Show (ReqResult User.Schema)
  | Index (ReqResult (List User.Schema))

-- Request

show : Int -> Cmd Msg
show id =
  get ("http://localhost:4000/api/users/" ++ (toString id)) Show user 

index : Cmd Msg
index =
  get "http://localhost:4000/api/users" Index listUsers

-- Json Decoder
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
  (Decode.list user) |> Decode.field "data"

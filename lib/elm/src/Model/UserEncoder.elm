module Model.UserEncoder exposing (user)

import Json.Encode as Encode exposing (Value, int, string, object)

import Model.User as User

id : Int -> (String, Encode.Value)
id value =
  ("id", Encode.int value)

name : String -> (String, Encode.Value)
name value =
  ("name", Encode.string value)

email : String -> (String, Encode.Value)
email value =
  ("email", Encode.string value)

user : User.Schema -> List (String, Encode.Value)
user schema =
  Encode.object
    [ id schema.id
    , name schema.name
    , email schema.email
    ]

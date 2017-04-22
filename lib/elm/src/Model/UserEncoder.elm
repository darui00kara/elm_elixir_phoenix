module Model.UserEncoder exposing (user)

import Json.Encode as Encode exposing (Value, int, string, object)

import Model.User as User

name : String -> (String, Encode.Value)
name value =
  ("name", Encode.string value)

email : String -> (String, Encode.Value)
email value =
  ("email", Encode.string value)

user : User.Schema -> Encode.Value
user schema =
  Encode.object
    [ ("user"
      , Encode.object
          [ name schema.name
          , email schema.email
          ]
      )
    ]

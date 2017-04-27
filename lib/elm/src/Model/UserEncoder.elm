module Model.UserEncoder exposing (createUser, updateUser, deleteUser)

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

toObject : User.Schema -> Encode.Value
toObject user =
  Encode.object
    [ name user.name
    , email user.email
    ]

createUser : User.Schema -> Encode.Value
createUser user =
  Encode.object [ ("user", toObject user) ]

updateUser : User.Schema -> Encode.Value
updateUser user =
  Encode.object
    [ id user.id
    , ("user", toObject user)
    ]

deleteUser : User.Schema -> Encode.Value
deleteUser user =
  Encode.object [ id user.id ]

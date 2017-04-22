module Model.User exposing (Schema, new, id, name, email)

type alias Schema =
  { id : Int
  , name : String
  , email : String
  }

new : Schema
new =
  Schema 0 "" ""

id : Schema -> Int -> Schema
id user newId =
  { user | id = newId }

name : Schema ->  String -> Schema
name user newName =
  { user | name = newName }

email : Schema -> String -> Schema
email user newEmail =
  { user | email = newEmail }

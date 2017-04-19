module Model.User exposing (Schema, new, id, name, email)

type alias Schema =
  { id : Int
  , name : String
  , email : String
  }

new : Schema
new =
  Schema 0 "" ""

id : Int -> Schema -> Schema
id newId user =
  { user | id = newId }

name : String -> Schema -> Schema
name newName user =
  { user | name = newName }

email : String -> Schema -> Schema
email newEmail user =
  { user | email = newEmail }

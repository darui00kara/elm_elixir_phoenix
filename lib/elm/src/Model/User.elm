module Model.User exposing (Schema, new)

type alias Schema =
  { id : Int
  , name : String
  , email : String
  }

new : Schema
new =
  Schema 0 "" ""

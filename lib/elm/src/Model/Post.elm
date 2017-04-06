module Model.Post exposing (Schema, new)

type alias Schema =
  { id : Int
  , title : String
  , body : String
  }

new : Schema
new =
  Schema 0 "" ""

module Model.Post exposing (Schema, new, id, title, body)

type alias Schema =
  { id : Int
  , title : String
  , body : String
  }

new : Schema
new =
  Schema 0 "" ""

id : Int -> Schema -> Schema
id newId post =
  { post | id = newId }

title : String -> Schema -> Schema
title newTitle post =
  { post | title = newTitle }

body : String -> Schema -> Schema
body newBody post =
  { post | body = newBody }

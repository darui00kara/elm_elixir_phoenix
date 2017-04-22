module Model.Post exposing (Schema, new, id, title, body)

type alias Schema =
  { id : Int
  , title : String
  , body : String
  }

new : Schema
new =
  Schema 0 "" ""

id : Schema -> Int -> Schema
id post newId =
  { post | id = newId }

title : Schema -> String -> Schema
title post newTitle =
  { post | title = newTitle }

body : Schema -> String -> Schema
body post newBody =
  { post | body = newBody }

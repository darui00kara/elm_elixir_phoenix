module Model.Post exposing
  (Schema, new, postDecode, listPostsDecode, indexApi)

import Json.Decode as Decode exposing (Decoder, int, string)

type alias Schema =
  { id : Int
  , title : String
  , body : String
  }

new : Schema
new =
  Schema 0 "" ""

id : Decoder Int
id =
  (Decode.field "id" Decode.int)

title : Decoder String
title =
  (Decode.field "title" Decode.string)

body : Decoder String
body =
  (Decode.field "body" Decode.string)

post : Decoder Schema
post =
  Decode.map3 Schema id title body

listPosts : Decoder (List Schema)
listPosts =
  Decode.list post

postDecode : Decoder Schema
postDecode =
  (Decode.field "data" post)

listPostsDecode : Decoder (List Schema)
listPostsDecode =
  (Decode.field "data" listPosts)

indexApi : String
indexApi =
  "http://localhost:4000/api/posts"

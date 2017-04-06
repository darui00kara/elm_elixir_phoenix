module Model.PostDecoder exposing (post, listPosts)

import Json.Decode as Decode exposing (Decoder, int, string)

import Model.Post as Post

id : Decoder Int
id =
  (Decode.field "id" Decode.int)

title : Decoder String
title =
  (Decode.field "title" Decode.string)

body : Decoder String
body =
  (Decode.field "body" Decode.string)

post : Decoder Post.Schema
post =
  (Decode.map3 Post.Schema id title body) |> Decode.field "data"

listPosts : Decoder (List Post.Schema)
listPosts =
  (Decode.map3 Post.Schema id title body) |> Decode.list |> Decode.field "data"

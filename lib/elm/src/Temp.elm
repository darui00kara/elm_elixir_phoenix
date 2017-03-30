module Temp exposing (..)

import Http exposing (..)
import Json.Decode as Decode

import Model.User as User exposing (..)
import Model.Post as Post exposing (..)
import Message as Msg exposing (..)

-- decoder

idDecoder =
  (Decode.field "id" Decode.int)

nameDecoder =
  (Decode.field "name" Decode.string)

emailDecoder =
  (Decode.field "email" Decode.string)

titleDecoder =
  (Decode.field "title" Decode.string)

bodyDecoder =
  (Decode.field "body" Decode.string)

userDecoder =
  Decode.map3 User.Schema idDecoder nameDecoder emailDecoder

postDecoder =
  Decode.map3 Post.Schema idDecoder titleDecoder bodyDecoder

userDataDecoder =
  (Decode.field "data" userDecoder)

postDataDecoder =
  (Decode.field "data" postDecoder)

usersDecoder =
  Decode.list userDecoder

postsDecoder =
  Decode.list postDecoder

usersDataDecoder =
  (Decode.field "data" usersDecoder)

postsDataDecoder =
  (Decode.field "data" postsDecoder)

-- request 

getUserUrl : String
getUserUrl =
  "http://localhost:4000/api/users/1"

getUserUrl2 : String
getUserUrl2 =
  "http://localhost:4000/api/users"

getPostsUrl : String
getPostsUrl =
  "http://localhost:4000/api/posts"

getUser : Http.Request User.Schema
getUser =
  Http.get getUserUrl userDataDecoder

getPosts : Http.Request (List Post.Schema)
getPosts =
  Http.get getPostsUrl postsDataDecoder

sendRequest : Cmd Msg
sendRequest =
  Http.send Msg.RequestUserData getUser

getPostsReq : Cmd Msg
getPostsReq =
  Http.send Msg.GetPostsReq getPosts

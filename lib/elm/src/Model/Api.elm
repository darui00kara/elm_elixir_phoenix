module Model.Api exposing (..)

import Http exposing (..)
import Json.Decode exposing (Decoder)

import Message as Msg exposing (..)
import Model.User as User
import Model.Post as Post

getReqParam : String -> Decoder a -> Http.Request a
getReqParam apiUrl decoder =
  Http.get apiUrl decoder

userReq : Http.Request User.Schema -> Cmd Msg
userReq param =
  Http.send Msg.UserReq param

listPostsReq : Http.Request (List Post.Schema) -> Cmd Msg
listPostsReq param =
  Http.send Msg.ListPostsReq param

sendReq : Http.Request a -> Cmd (RequestMsg a)
sendReq =
  Http.send Msg.UserData

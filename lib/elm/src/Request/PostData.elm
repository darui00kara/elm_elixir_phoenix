module Request.PostData exposing (Msg(..), show, index)

import Request.Helper exposing (ReqMsg, ReqResult, get)
import Model.Post as Post
import Model.PostDecoder exposing (post, listPosts)

type Msg =
  Show (ReqResult Post.Schema)
  | Index (ReqResult (List Post.Schema))

show : Int -> Cmd Msg
show id =
  get ("http://localhost:4000/api/posts/" ++ (toString id)) Show post

index : Cmd Msg
index =
  get "http://localhost:4000/api/posts" Index listPosts

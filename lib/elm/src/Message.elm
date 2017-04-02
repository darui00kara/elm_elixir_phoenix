module Message exposing (..)

import Navigation exposing (Location)
import Http exposing (..)

import Model.Post as Post
import Model.User as User

type Msg =
  UrlChange Location
  | NewUrl String
  | UserReq (Result Http.Error User.Schema)
  | ListPostsReq (Result Http.Error (List Post.Schema))

module Message exposing (..)

import Navigation exposing (Location)
import Http exposing (..)

import Model.User as User
import Model.Post as Post

type Msg =
  UrlChange Location
  | NewUrl String
  | RequestUserData (Result Http.Error User.Schema)
  | GetPostsReq (Result Http.Error (List Post.Schema))

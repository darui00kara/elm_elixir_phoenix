module Message exposing (..)

import Navigation exposing (Location)

import Request.PostData as Post
import Request.UserData as User

type Msg =
  UrlChange Location
  | NewUrl String
  | PostReq Post.Msg
  | UserReq User.Msg

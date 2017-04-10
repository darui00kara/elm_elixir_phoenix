module Request.Message exposing (Msg(..))

import Request.UserData as User
import Request.PostData as Post

type Msg =
  UserReq User.Msg
  | PostReq Post.Msg

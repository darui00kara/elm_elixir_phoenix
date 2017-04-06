module Request.UserData exposing (Msg(..), show, index)

import Request.Helper exposing (ReqMsg, ReqResult, get)
import Model.User as User
import Model.UserDecoder exposing (user, listUsers)

type Msg =
  Show (ReqResult User.Schema)
  | Index (ReqResult (List User.Schema))

show : Int -> Cmd Msg
show id =
  get ("http://localhost:4000/api/users/" ++ (toString id)) Show user 

index : Cmd Msg
index =
  get "http://localhost:4000/api/users" Index listUsers

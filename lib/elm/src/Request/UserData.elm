module Request.UserData exposing (Msg(..), show, index, signUp)

import Request.Helper exposing (ReqMsg, ReqResult, get, post)
import Model.User as User
import Model.UserDecoder as Decode exposing (user, listUsers)
import Model.UserEncoder as Encode exposing (user)

type Msg =
  Show (ReqResult User.Schema)
  | Index (ReqResult (List User.Schema))
  | SignUp (ReqResult User.Schema)

show : Int -> Cmd Msg
show id =
  get ("http://localhost:4000/api/users/" ++ (toString id)) Show Decode.user 

index : Cmd Msg
index =
  get "http://localhost:4000/api/users" Index Decode.listUsers

signUp : User.Schema -> Cmd Msg
signUp schema =
  post "http://localhost:4000/api/users" SignUp Decode.user (Encode.user schema)

module Request.UserData exposing (Msg(..), show, index, edit, signUp)

import Request.Helper exposing (ReqMsg, ReqResult, get, post, put)
import Model.User as User
import Model.UserDecoder as Decode exposing (user, listUsers)
import Model.UserEncoder as Encode exposing (createUser, updateUser)

type Msg =
  Show (ReqResult User.Schema)
  | Index (ReqResult (List User.Schema))
  | Edit (ReqResult User.Schema)
  | SignUp (ReqResult User.Schema)

show : Int -> Cmd Msg
show id =
  get
    ("http://localhost:4000/api/users/" ++ (toString id))
    Show
    Decode.user 

index : Cmd Msg
index =
  get
    "http://localhost:4000/api/users"
    Index
    Decode.listUsers

edit : User.Schema -> Cmd Msg
edit user =
  put
    ("http://localhost:4000/api/users/" ++ (toString user.id))
    Edit
    Decode.user
    (Encode.updateUser user)

signUp : User.Schema -> Cmd Msg
signUp user =
  post
    "http://localhost:4000/api/users"
    SignUp
    Decode.user
    (Encode.createUser user)

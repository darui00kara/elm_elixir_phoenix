module Request.UserData exposing (Msg(..), show, index, edit, delete, signUp)

import Request.Helper as Req exposing (ReqMsg, ReqResult, get, post, put, delete)
import Model.User as User
import Model.UserDecoder as Decode exposing (user, listUsers)
import Model.UserEncoder as Encode exposing (createUser, updateUser, deleteUser)

type Msg =
  Show (ReqResult User.Schema)
  | Index (ReqResult (List User.Schema))
  | Edit (ReqResult User.Schema)
  | Delete (ReqResult String)
  | SignUp (ReqResult User.Schema)

show : Int -> Cmd Msg
show id =
  Req.get
    ("http://localhost:4000/api/users/" ++ (toString id))
    Show
    Decode.user 

index : Cmd Msg
index =
  Req.get
    "http://localhost:4000/api/users"
    Index
    Decode.listUsers

edit : User.Schema -> Cmd Msg
edit user =
  Req.put
    ("http://localhost:4000/api/users/" ++ (toString user.id))
    Edit
    Decode.user
    (Encode.updateUser user)

delete : User.Schema -> Cmd Msg
delete user =
  Req.delete
    ("http://localhost:4000/api/users/" ++ (toString user.id))
    Delete
    Decode.empty
    (Encode.deleteUser user)

signUp : User.Schema -> Cmd Msg
signUp user =
  Req.post
    "http://localhost:4000/api/users"
    SignUp
    Decode.user
    (Encode.createUser user)

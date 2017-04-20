module Model.Form exposing (Msg(..), UserItem(..), PostItem(..), input)

import Model exposing (Model)
import Model.User as User
import Model.Post as Post

type UserItem =
  Name String
  | Email String
  | SignUp

type PostItem =
  Title String
  | Body String

type Msg =
  UserForm UserItem
  | PostForm PostItem

input : Msg -> Model -> Model
input msg model =
  case msg of
    UserForm item ->
      Model.updateUser (model.user |> inputUserForm item) model
    PostForm item ->
      Model.updatePost (model.post |> inputPostForm item) model

inputUserForm : UserItem -> User.Schema -> User.Schema
inputUserForm item user =
  case item of
    Name  value -> user |> User.name  value
    Email value -> user |> User.email value
    SignUp -> user

inputPostForm : PostItem -> Post.Schema -> Post.Schema
inputPostForm item post =
  case item of
    Title value -> post |> Post.title value
    Body  value -> post |> Post.body  value


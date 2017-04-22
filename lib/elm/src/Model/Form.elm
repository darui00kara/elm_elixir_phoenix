module Model.Form exposing (Msg(..), UserFormItem(..), PostFormItem(..), update)

import Navigation exposing (newUrl)

import Model exposing (Model)
import Model.User as User
import Model.Post as Post

type UserFormItem =
  Name String
  | Email String

type PostFormItem =
  Title String
  | Body String

type Msg =
  UserForm UserFormItem
  | PostForm PostFormItem
  | Submit String

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
    UserForm form ->
      (updateUserForm form model.user |> Model.updateUser model, Cmd.none)
    PostForm form ->
      (updatePostForm form model.post |> Model.updatePost model, Cmd.none)
    Submit url ->
      (model, Navigation.newUrl url)

updateUserForm : UserFormItem -> User.Schema -> User.Schema
updateUserForm item user =
  case item of
    Name  value -> value |> User.name  user
    Email value -> value |> User.email user

updatePostForm : PostFormItem -> Post.Schema -> Post.Schema
updatePostForm item post =
  case item of
    Title value -> value |> Post.title post
    Body  value -> value |> Post.body  post

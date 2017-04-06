module Model exposing (Model, new, updateUser, updatePost, updateListPosts)

import Model.User as User
import Model.Post as Post

type alias Model =
  { user : User.Schema
  , post : Post.Schema
  , listPosts : List Post.Schema
  }

new : Model
new =
  Model User.new Post.new []

updateUser : User.Schema -> Model -> Model
updateUser user model =
  { model | user = user }

updatePost : Post.Schema -> Model -> Model
updatePost post model =
  { model | post = post }

updateListPosts : List Post.Schema -> Model -> Model
updateListPosts listPosts model =
  { model | listPosts = listPosts }

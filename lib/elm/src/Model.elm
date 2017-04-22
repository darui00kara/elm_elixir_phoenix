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

updateUser : Model -> User.Schema -> Model
updateUser model user =
  { model | user = user }

updatePost : Model -> Post.Schema -> Model
updatePost model post =
  { model | post = post }

updateListPosts : Model -> List Post.Schema -> Model
updateListPosts model listPosts =
  { model | listPosts = listPosts }

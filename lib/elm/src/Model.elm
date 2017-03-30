module Model exposing (Model, new)

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

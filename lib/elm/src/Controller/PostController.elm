module Controller.PostController exposing (update, new, show, edit)

import Html exposing (Html)

import Message exposing (Msg)
import Model exposing (Model, updatePost, updateListPosts)
import View.PostView as View
import Request.PostData as Post
import Request.Helper as Req

update : Post.Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Post.Show (Req.Success data) ->
      (updatePost data model, Cmd.none)
    Post.Index (Req.Success data) ->
      (updateListPosts data model, Cmd.none)
    _ ->
      (model, Cmd.none)

new : Model -> (Model, Cmd Msg, (Model -> Html Msg))
new model =
  (model, Cmd.none, View.new)

show : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
show id model =
  (model, Cmd.none, View.show)

edit : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
edit id model =
  (model, Cmd.none, View.edit)

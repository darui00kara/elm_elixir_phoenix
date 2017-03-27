module Controller.PostController exposing (new, show, edit)

import Html exposing (Html)

import Message exposing (Msg)
import Model exposing (Model)
import View.PostView as View

new : Model -> (Model, Cmd Msg, (Model -> Html Msg))
new model =
  (model, Cmd.none, View.new)

show : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
show id model =
  (model, Cmd.none, View.show)

edit : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
edit id model =
  (model, Cmd.none, View.edit)

module Controller.UserController exposing (new, show, edit)

import Html exposing (Html)

import Message exposing (Msg)
import Model exposing (Model)
import View.UserView as View
import Temp exposing (sendRequest)

new : Model -> (Model, Cmd Msg, (Model -> Html Msg))
new model =
  (model, Cmd.none, View.new)

show : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
show id model =
  (model, sendRequest, View.show)

edit : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
edit id model =
  (model, Cmd.none, View.edit)

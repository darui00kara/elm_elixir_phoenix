module Controller.UserController exposing (new, show, edit)

import Html exposing (Html)

import Message as Msg exposing (Msg)
import Model exposing (Model)
import View.UserView as View
import Request.UserData as User

new : Model -> (Model, Cmd Msg, (Model -> Html Msg))
new model =
  (model, Cmd.none, View.new)

show : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
show id model =
  ( model
  , Cmd.map Msg.UserReq (User.show id)
  , View.show
  )

edit : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
edit id model =
  (model, Cmd.none, View.edit)

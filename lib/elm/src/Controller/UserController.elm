module Controller.UserController exposing (new, show, edit)

import Html exposing (Html)

import Message exposing (Msg)
import Model exposing (Model)
import View.UserView as View
import Model.User as User
import Model.Api as Api

new : Model -> (Model, Cmd Msg, (Model -> Html Msg))
new model =
  (model, Cmd.none, View.new)

show : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
show id model =
  ( model
  , (Api.getReqParam (User.showApi "1") User.userDecode) |> Api.userReq
  , View.show
  )

edit : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
edit id model =
  (model, Cmd.none, View.edit)

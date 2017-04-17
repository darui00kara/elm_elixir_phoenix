module Controller.UserController exposing (update, new, show, edit)

import Html exposing (Html)

import Message as Msg exposing (Msg)
import Model exposing (Model, updateUser)
import View.UserView as View
import Request.UserData as User
import Request.Helper as Req
import Request.Message as ReqMsg

update : User.Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    User.Show (Req.Success data) ->
      ((model |> updateUser data), Cmd.none)
    _ ->
      (model, Cmd.none)

new : Model -> (Model, Cmd Msg, (Model -> Html Msg))
new model =
  (model, Cmd.none, View.new)

show : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
show id model =
  ( model
  , Cmd.map Msg.RequestMsg (Cmd.map ReqMsg.UserReq (User.show id))
  , View.show
  )

edit : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
edit id model =
  (model, Cmd.none, View.edit)

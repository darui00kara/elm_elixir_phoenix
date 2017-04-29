module Controller.UserController exposing (update, new, create, show, edit, put, delete)

import Html exposing (Html)

import Message as Msg exposing (Msg)
import Model exposing (Model, updateUser)
import View.UserView as View
import View.HelperView as HelperView
import Request.UserData as User
import Request.Helper as Req
import Request.Message as ReqMsg

update : User.Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    User.Show (Req.Success data) ->
      (data |> updateUser model, Cmd.none)
    _ ->
      (model, Cmd.none)

new : Model -> (Model, Cmd Msg, (Model -> Html Msg))
new model =
  (model, Cmd.none, View.new)

create : Model -> (Model, Cmd Msg, (Model -> Html Msg))
create model =
  ( model
  , User.signUp model.user |> Cmd.map ReqMsg.UserReq |> Cmd.map Msg.RequestMsg
  , View.show
  )

show : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
show id model =
  ( model
  , Cmd.map Msg.RequestMsg (Cmd.map ReqMsg.UserReq (User.show id))
  , View.show
  )

edit : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
edit id model =
  ( model
  , User.show id |> Cmd.map ReqMsg.UserReq |> Cmd.map Msg.RequestMsg
  , View.edit
  )

put : Model -> (Model, Cmd Msg, (Model -> Html Msg))
put model =
  ( model
  , User.edit model.user |> Cmd.map ReqMsg.UserReq |> Cmd.map Msg.RequestMsg
  , View.show
  )

delete : Int -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
delete id model =
  ( model
  , User.delete model.user |> Cmd.map ReqMsg.UserReq |> Cmd.map Msg.RequestMsg
  , HelperView.render
  )

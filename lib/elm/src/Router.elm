module Router exposing (routing, requestRouting)

import Html exposing (Html)
import Navigation

import Message as Msg exposing (Msg)
import Resource exposing (Param)
import Model exposing (Model)
import Routing.Route as Route
import Controller.PageController as PageCtrl
import Controller.PostController as PostCtrl
import Controller.UserController as UserCtrl
import Request.Message as ReqMsg

routing : Navigation.Location -> Param -> (Param, Cmd Msg)
routing location param =
  let
    path = location |> Route.build |> Route.take
    (model, cmd, render) = action path param.model
  in
    ( ( param
        |> updatePath location
        |> updateModel model
        |> updateRender render
      )
      , cmd
    )

updatePath : Navigation.Location -> Param -> Param
updatePath location param =
  { param
    | currentPagePath = Route.build location
    , locationHistory = location :: param.locationHistory
  }

updateModel : Model -> Param -> Param
updateModel model param =
  { param | model = model }

updateRender : (Model -> Html Msg) -> Param -> Param
updateRender render param =
  { param | render = render }

action : Route.PagePath -> Model -> (Model, Cmd Msg, (Model -> Html Msg))
action path model =
  case path of
    Route.NotFound      -> PageCtrl.notFound  model
    Route.TopPage       -> PageCtrl.home      model
    Route.About         -> PageCtrl.about     model
    Route.Help          -> PageCtrl.help      model
    Route.Contact       -> PageCtrl.contact   model
    Route.SignIn        -> PageCtrl.signin    model
    Route.NewPost       -> PostCtrl.new       model
    Route.ShowPost   id -> PostCtrl.show   id model
    Route.EditPost   id -> PostCtrl.edit   id model
    Route.SignUp        -> UserCtrl.new       model
    Route.CreateUser    -> UserCtrl.create    model
    Route.ShowUser   id -> UserCtrl.show   id model
    Route.EditUser   id -> UserCtrl.edit   id model
    Route.UpdateUser    -> UserCtrl.put       model
    Route.DeleteUser id -> UserCtrl.delete id model

requestRouting : ReqMsg.Msg -> Param -> (Param, Cmd Msg)
requestRouting msg param =
  case msg of
    ReqMsg.UserReq result ->
      let
        (model, cmd) = UserCtrl.update result param.model
      in
        ( ( param
            |> updateModel model
          )
          , Cmd.none
        )
    ReqMsg.PostReq result ->
      let
        (model, cmd) = PostCtrl.update result param.model
      in
        ( ( param
            |> updateModel model
          )
          , Cmd.none
        )

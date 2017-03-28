module Router exposing (routing)

import Html exposing (Html)
import Navigation

import Message exposing (Msg)
import Resource exposing (Param)
import Model exposing (Model)
import Router.Route as Route
import Controller.PageController as PageCtrl
import Controller.PostController as PostCtrl
import Controller.UserController as UserCtrl

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
    Route.NotFound    -> PageCtrl.notFound model
    Route.TopPage     -> PageCtrl.home     model
    Route.About       -> PageCtrl.about    model
    Route.Help        -> PageCtrl.help     model
    Route.Contact     -> PageCtrl.contact  model
    Route.SignIn      -> PageCtrl.signin   model
    Route.NewPost     -> PostCtrl.new      model
    Route.ShowPost id -> PostCtrl.show     id model
    Route.EditPost id -> PostCtrl.edit     id model
    Route.SignUp      -> UserCtrl.new      model
    Route.ShowUser id -> UserCtrl.show     id model
    Route.EditUser id -> UserCtrl.edit     id model

module Controller.PageController exposing (notFound, home, about, help, contact, signin)

import Html exposing (Html)

import Message as Msg exposing (Msg)
import Model exposing (Model)
import View.HelperView as View
import Request.PostData as Post

home : Model -> (Model, Cmd Msg, (Model -> Html Msg))
home model =
  ( model
  , Cmd.map Msg.PostReq Post.index
  , View.renderPosts
  )

about : Model -> (Model, Cmd Msg, (Model -> Html Msg))
about model =
  (model, Cmd.none, View.render)

help : Model -> (Model, Cmd Msg, (Model -> Html Msg))
help model =
  (model, Cmd.none, View.render)

contact : Model -> (Model, Cmd Msg, (Model -> Html Msg))
contact model =
  (model, Cmd.none, View.render)

signin : Model -> (Model, Cmd Msg, (Model -> Html Msg))
signin model =
  (model, Cmd.none, View.render)

notFound : Model -> (Model, Cmd Msg, (Model -> Html Msg))
notFound model =
  (model, Cmd.none, View.notFound)

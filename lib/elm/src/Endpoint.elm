module Endpoint exposing (..)

-- package import

import List exposing (map)
import Html exposing (..)
import Navigation

-- user module import

import Message as Msg exposing (Msg)
import Resource exposing (Param)
import Router
import View.HelperView as View
import Model.Form as Form

-- main

main : Program Never Param Msg
main =
  Navigation.program Msg.UrlChange
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- init

init : Navigation.Location -> (Param, Cmd Msg)
init location =
  (Resource.new location View.render, Cmd.none)

-- update 

update : Msg -> Param -> (Param, Cmd Msg)
update msg param =
  case msg of
    Msg.NewUrl url ->
      (param, Navigation.newUrl url)
    Msg.UrlChange location ->
      Router.routing location param
    Msg.RequestMsg msg ->
      Router.requestRouting msg param
    Msg.FormMsg msg ->
      let
        (model, cmd) = Form.update msg param.model
      in
        (model |> Resource.updateModel param, cmd)

-- view

view : Param -> Html Msg
view param =
  div []
    [ param.render param.model
    , View.currentPage param.currentPagePath
    , View.allLinks 1
    , View.renderHistory param.locationHistory
    ]

-- subscriptions

subscriptions : Param -> Sub Msg
subscriptions param =
  Sub.none


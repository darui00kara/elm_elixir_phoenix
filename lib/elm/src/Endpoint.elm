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
    Msg.UserReq (Ok data) ->
      ( { param | model = { user = data, post = param.model.post, listPosts = [] } }, Cmd.none )
    Msg.UserReq (Err _) ->
      (param, Cmd.none)
    Msg.ListPostsReq (Ok data) ->
      ( { param | model = { user = param.model.user, post = param.model.post, listPosts = data } }, Cmd.none )
    Msg.ListPostsReq (Err _) ->
      (param, Cmd.none)
    Msg.SendRequest reqMsg ->
      reqResult reqMsg param

reqResult : Msg.RequestMsg a -> Param -> (Param, Cmd Msg)
reqResult msg param =
  case msg of
    Msg.UserData (Ok data) ->
      (param, Cmd.none)
    Msg.UserData (Err _) ->
      (param, Cmd.none)
    Msg.ListPostsData (Ok data) ->
      (param, Cmd.none)
    Msg.ListPostsData (Err _) ->
      (param, Cmd.none)

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


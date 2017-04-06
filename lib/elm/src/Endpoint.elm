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
import Request.Helper as Req
import Request.PostData as Post
import Request.UserData as User
import Model

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
    Msg.PostReq (Post.Index (Req.Success data)) ->
      ( { param
          | model = ( param.model
                      |> Model.updateUser param.model.user
                      |> Model.updatePost param.model.post
                      |> Model.updateListPosts data
                    )
        }
        , Cmd.none
      )
    Msg.PostReq (Post.Show (Req.Success data)) ->
      ( { param
          | model = ( param.model
                      |> Model.updateUser param.model.user
                      |> Model.updatePost data
                      |> Model.updateListPosts param.model.listPosts
                    )
        }
        , Cmd.none
      )
    Msg.UserReq (User.Show (Req.Success data)) ->
      ( { param
          | model = ( param.model
                      |> Model.updateUser data
                      |> Model.updatePost param.model.post
                      |> Model.updateListPosts param.model.listPosts
                    )
        }
        , Cmd.none
      )
    _ ->
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


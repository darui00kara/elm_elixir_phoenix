module View.HelperView exposing (..)

import List
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Navigation

import Message as Msg exposing (Msg)
import Model exposing (Model)
import Model.Post as Post exposing (..)
import Routing.Route as Route

notFound : Model -> Html Msg
notFound model =
  div [] [ text "404 not found" ]

render : Model -> Html Msg
render model = 
  div []
    [ div [] [ text (model.user.name ++ ":" ++ model.user.email) ]
    , div [] [ text (model.post.title ++ ":" ++ model.post.body) ]
    ]

renderPosts : Model -> Html Msg
renderPosts model =
  div []
    [ h1 [] [ text "posts" ]
    , ul [] (List.map renderPost model.listPosts)
    ]

renderPost : Post.Schema -> Html Msg
renderPost post =
  li [] [ text (post.title ++ ":" ++ post.body) ]

allLinks : Int -> Html Msg
allLinks id =
  div []
    [ h1 [] [ text "page link" ]
    , ul [] (List.map renderLink [ "/"
                                 , "/about"
                                 , "/help"
                                 , "/contact"
                                 , "/signin"
                                 , "/new-post"
                                 , "/post/" ++ (toString id) ++ "/show"
                                 , "/post/" ++ (toString id) ++ "/edit"
                                 , "/signup"
                                 , "/user/" ++ (toString id) ++ "/show"
                                 , "/user/" ++ (toString id) ++ "/edit"
                                 ]
            )
    ]

renderLink : String -> Html Msg
renderLink url =
  li [] [ button [ onClick (Msg.NewUrl url) ] [ text url ] ]

renderHistory : List Navigation.Location -> Html Msg
renderHistory history =
  div []
    [ h1 [] [ text "Location History" ]
    , ul [] (List.map renderLocation history)
    ]

renderLocation : Navigation.Location -> Html Msg
renderLocation location =
  li [] [ text (location.pathname ++ location.hash) ]

currentPage : Maybe Route.PagePath -> Html Msg
currentPage maybePagePath =
  div []
    [ h1 [] [ text "Current Page" ]
    , li [] [ text (Route.toString maybePagePath) ]
    , li [] [ text (Route.isSuccess maybePagePath) ]
    ]



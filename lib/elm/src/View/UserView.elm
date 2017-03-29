module View.UserView exposing (new, show, edit)

import Html exposing (..)

import Message exposing (Msg)
import Model exposing (Model)

new : Model -> Html Msg
new model =
  div [] [ text "new user" ]

show : Model -> Html Msg
show model =
  div []
    [ div [] [ text "show user" ]
    , div [] [ text (model.user.name ++ ":" ++ model.user.email) ]
    ]

edit : Model -> Html Msg
edit model =
  div [] [ text "edit user" ]

module View.PostView exposing (new, show, edit)

import Html exposing (..)

import Message exposing (Msg)
import Model exposing (Model)

new : Model -> Html Msg
new model =
  div [] [ text "post new" ]

show : Model -> Html Msg
show model =
  div [] [ text "post show" ]

edit : Model -> Html Msg
edit model =
  div [] [ text "post edit" ]


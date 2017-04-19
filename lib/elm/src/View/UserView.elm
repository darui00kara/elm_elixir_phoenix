module View.UserView exposing (new, show, edit)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

import Message as Msg exposing (Msg)
import Model exposing (Model)
import Model.Form as Form

new : Model -> Html Msg
new model =
  Html.map Msg.FormInput
    ( Html.map Form.UserForm
      ( div []
        [ div [] [ text "new user" ]
        , div []
            [ h2 [] [ text "Signup Form" ]
            , label [ for "name-field" ] [ text "Name:" ]
            , input [ id "name-field"
                    , type_ "text"
                    , placeholder "Name"
                    , onInput Form.Name ]
                    []
            , label [ for "email-field" ] [ text "Email:" ]
            , input [ id "email-field"
                    , type_ "text"
                    , placeholder "Email"
                    , onInput Form.Email ]
                    []
            ]
        ]
      )
    )

show : Model -> Html Msg
show model =
  div []
    [ div [] [ text "show user" ]
    , div [] [ text (model.user.name ++ ":" ++ model.user.email) ]
    ]

edit : Model -> Html Msg
edit model =
  div [] [ text "edit user" ]

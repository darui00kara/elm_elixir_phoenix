module Endpoint exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode

type alias User =
  { name  : String
  , email : String
  , id    : Int
  }

type alias UserData =
  { data : User }

type Msg =
  LoadUserData ( Result Http.Error User )
  | Name String
  | Email String
  | Signup

-- main

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

init : (User, Cmd Msg)
init =
  ( { name = "none", email = "none", id = 0 }
  , sendRequest
  )

update : Msg -> User -> ( User, Cmd Msg )
update msg user =
  case msg of
    LoadUserData ( Ok newUser ) ->
      ( newUser, Cmd.none )
    LoadUserData ( Err _ ) ->
      ( user, Cmd.none )
    Signup ->
      ( user, Cmd.none )
    Name name ->
      ( { user | name = name }, Cmd.none )
    Email email ->
      ( { user | email = email }, Cmd.none )

view : User -> Html Msg
view user =
  div []
    [ h2 [] [ text user.name ]
    , h2 [] [ text user.email ]
    , div []
        [ h2 [] [ text "Signup Form" ]
        , label [ for "name-field" ] [ text "Name:" ]
        , input [ id "name-field", type_ "text", placeholder "Name", onInput Name ] []
        , label [ for "email-field" ] [ text "Email:" ]
        , input [ id "email-field", type_ "text", placeholder "Email", onInput Email ] []
        , button [ onClick Signup ] [ text "signup" ]
        ]
    ]

subscriptions : User -> Sub Msg
subscriptions user =
  Sub.none

-- decoder

idDecoder =
  ( Decode.field "id" Decode.int )

nameDecoder =
  ( Decode.field "name" Decode.string )

emailDecoder =
  ( Decode.field "email" Decode.string )

userDecoder =
  Decode.map3 User nameDecoder emailDecoder idDecoder

userDataDecoder =
  ( Decode.field "data" userDecoder )

-- request 

getUserUrl : String
getUserUrl =
  "http://localhost:4000/api/users/1"

getUser : Http.Request User
getUser =
  Http.get getUserUrl userDataDecoder

sendRequest : Cmd Msg
sendRequest =
  Http.send LoadUserData getUser 


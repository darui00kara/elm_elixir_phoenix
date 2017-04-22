module Resource exposing (Param, new, updateModel)

import Html exposing (Html)
import Navigation exposing (Location)

import Routing.Route as Route exposing (PagePath)
import Message exposing (Msg)
import Model exposing (Model)

type alias Param =
  { currentPagePath : Maybe Route.PagePath
  , locationHistory : List Location
  , render : Model -> Html Msg
  , model : Model
  }

new : Location -> (Model -> Html Msg) -> Param
new location renderFunc =
  Param
    (Route.build location)
    [ location ]
    renderFunc
    Model.new

updateModel : Param -> Model -> Param
updateModel param model =
  { param | model = model }

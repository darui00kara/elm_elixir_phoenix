module Routing.Route exposing (PagePath, PagePath(..), build, take, isSuccess, toString)

import Navigation exposing (Location)
import UrlParser as Url exposing (oneOf, map, top, s, (</>), int)

type PagePath =
  NotFound
  | TopPage
  | About
  | Help
  | Contact
  | SignIn
  | NewPost
  | ShowPost Int
  | EditPost Int
  | SignUp
  | ShowUser Int
  | EditUser Int

route : Url.Parser (PagePath -> a) a
route =
  oneOf
    [ map TopPage  top
    , map About    (s "about")
    , map Help     (s "help")
    , map Contact  (s "contact")
    , map SignIn   (s "signin")
    , map NewPost  (s "new-post")
    , map ShowPost (s "post" </> int </> s "show")
    , map EditPost (s "post" </> int </> s "edit")
    , map SignUp   (s "signup")
    , map ShowUser (s "user" </> int </> s "show")
    , map EditUser (s "user" </> int </> s "edit")
    ]

take : Maybe PagePath -> PagePath
take maybePagePath =
  Maybe.withDefault NotFound maybePagePath

build : Location -> Maybe PagePath
build location =
  Url.parsePath route location

isSuccess : Maybe PagePath -> String
isSuccess maybePagePath =
  case (take maybePagePath) of
    NotFound ->
      " (Invalid)"
    _ ->
      " (Success)"

toString : Maybe PagePath -> String
toString maybePagePath =
  case (take maybePagePath) of
    NotFound    -> "not found"
    TopPage     -> "top" 
    About       -> "about"
    Help        -> "help"
    Contact     -> "contact"
    SignIn      -> "signin"
    NewPost     -> "new post"
    ShowPost id -> "show post"
    EditPost id -> "edit post"
    SignUp      -> "signup"
    ShowUser id -> "show user"
    EditUser id -> "edit user"

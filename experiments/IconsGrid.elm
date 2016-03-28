import GG.IconsRo exposing (..)

import Html exposing (..)

import StartApp
import Effects exposing (Effects)

import Flexy exposing (..)

-- MODEL 

type alias Model = Int 

init : Model
init = 0 

-- UPDATE 

type Action = NoOp


noFx : model -> ( model, Effects action )
noFx m = (m, Effects.none)

update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of 
    NoOp -> noFx model


-- VIEW 

dp : Int -> String
dp v = (toString v) ++ "px"

loadFonts : String
loadFonts = "
    var head   = document.getElementsByTagName('head')[0];

    var link3   = document.createElement('link');
    link3.rel   = 'stylesheet';
    link3.type  = 'text/css';
    link3.href  = 'http://www.globalgoals.org/wp-content/themes/global-goals-theme/fonts/giorgio-sans/GiorgioSans-Bold-Web.woff';
    link3.media = 'all';
    head.appendChild(link3);
    "

view : Signal.Address Action -> Model -> Html
view address model = 
  let 
    size = (dp 400, dp 400)
  in 
  div 
  [ design <| Flexy.wrap <| justifyAround <| alignItemsCenter <| fullscreen] 
  ((Html.node "script" [] [Html.text loadFonts])::(iconsList size))



-- WIRING 

app : StartApp.App Model
app = StartApp.start
  { init = noFx init
  , update = update
  , view = view 
  , inputs = [] }

main : Signal Html
main = app.html
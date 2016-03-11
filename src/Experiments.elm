import GG.Icons exposing (..)
import GG exposing (colors)

import Html exposing (..)
import Html.Attributes exposing (..)
import Svg

import StartApp
import Effects exposing (Effects)

import Flexy exposing (..)

noFx : model -> ( model, Effects action )
noFx m = (m, Effects.none)


type alias Model = Int 
type Action = NoOp

init : Model
init = 0 


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of 
    NoOp -> noFx model

dp v = (toString v) ++ "px"

iconStyle color = 
  [ ("background", color)
  , ("width", dp 1000)
  , ("height", dp 1000)
  ]

color color styles = styles++[("color", color)]

fontSize size styles = styles++[("fontSize", dp size)]

size (w, h) styles = styles ++ [ ("width", dp w), ("height", dp h)
  ]

fontFamily family xs = xs ++ [("fontFamily", family)]
bold xs = xs ++ [("fontWeight", "500")]

number n = 
  div 
  [ design <| justifyCenter <| alignItemsEnd <| size (290, 290) []] 
  [ span [ design <| alignSelfEnd <| fontSize 300 [("lineHeight", "85%")]] 
      [ text <| toString n] ]



title xs = 
  div [ design <| justifyCenter <| alignItemsEnd <| fontSize 130 [("lineHeight", "88%")]] xs

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
  div 
  [ design <| justifyCenter <| alignItemsCenter <| fullscreen] 
  [ Html.node "script" [] [Html.text loadFonts]
  , div [ design <| column <| justifyCenter <| alignItemsCenter <| iconStyle colors.gg01] 
    [ div [ design <| alignSelfStretch <| bold <| fontFamily "Giorgio Sans" <| color "#fff" []] 
      [ number 1
      , title [text "NO", br [] [], text "POVERTY"]
      ]

    , div [ design <|  alignSelfStretch <| flex 1 0 "auto" <| justifyCenter <| alignItemsCenter [] ] [GG.Icons.gg01]
    ]
  , div [design <| size (1000, 1000) [] ] [GG.Icons.gg01Orig (dp 1000, dp 1000)]
  ]


app : StartApp.App Model
app = StartApp.start
  { init = noFx init
  , update = update
  , view = view 
  , inputs = [] }

main : Signal Html
main = app.html
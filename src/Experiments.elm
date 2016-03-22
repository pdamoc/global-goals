import GG.IconsRo exposing (..)
import GG.IconsRaw as I
import GG.Colors as C

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


--icon n txts = 
--  let 
--    (bkgColor, ico) = 
--      case n of
--        1 -> (C.gg01, GG.Icons.gg01) 
--        2 -> (C.gg02, GG.Icons.gg01) 
--        3 -> (C.gg03, GG.Icons.gg01) 
--        4 -> (C.gg04, GG.Icons.gg01) 
--        5 -> (C.gg05, GG.Icons.gg01) 
--        6 -> (C.gg06, GG.Icons.gg01) 
--        7 -> (C.gg07, GG.Icons.gg01) 
--        8 -> (C.gg08, GG.Icons.gg01) 
--        9 -> (C.gg09, GG.Icons.gg01) 
--        10 -> (C.gg10, GG.Icons.gg01) 
--        11 -> (C.gg11, GG.Icons.gg01) 
--        12 -> (C.gg12, GG.Icons.gg01) 
--        13 -> (C.gg13, GG.Icons.gg01) 
--        14 -> (C.gg14, GG.Icons.gg01) 
--        15 -> (C.gg15, GG.Icons.gg01) 
--        16 -> (C.gg16, GG.Icons.gg01) 
--        17 -> (C.gg17, GG.Icons.gg01) 
--        _ -> (C.gg01, GG.Icons.gg01) 
--  in 
--    div [ design <| column <| justifyCenter <| alignItemsCenter <| iconStyle bkgColor] 
--      [ div [ design <| alignSelfStretch <| bold <| fontFamily "Giorgio Sans" <| color "#fff" []] 
--        [ number n
--        , title txts
--        ]

--      , div [ design <|  alignSelfStretch <| flex 1 0 "auto" <| justifyCenter <| alignItemsCenter [] ] [ico (dp 1000, dp 1000)]
--      ]

view : Signal.Address Action -> Model -> Html
view address model = 
  let 
    size = (dp 400, dp 400)
  in 
  div 
  [ design <| Flexy.wrap <| justifyCenter <| alignItemsCenter <| fullscreen] 
  [ Html.node "script" [] [Html.text loadFonts]

  , I.gg01 size
  , gg01 size

  , I.gg02 size
  , gg02 size

  , I.gg03 size
  , gg03 size
  
  , I.gg04 size
  , gg04 size

  , I.gg05 size
  , gg05 size

  , I.gg06 size
  , gg06 size
  
  , I.gg07 size
  , gg07 size
  
  , I.gg08 size
  , gg08 size
  
  , I.gg09 size
  , gg09 size
  
  , I.gg10 size
  , gg10 size
  
  , I.gg11 size
  , gg11 size
  
  , I.gg12 size
  , gg12 size
  
  , I.gg13 size
  , gg13 size
  
  , I.gg14 size
  , gg14 size
  
  , I.gg15 size
  , gg15 size
  
  , I.gg16 size
  , gg16 size

  , I.gg17 size
  , gg17 size
  
  , I.tgg size
  , tgg size
  ]


app : StartApp.App Model
app = StartApp.start
  { init = noFx init
  , update = update
  , view = view 
  , inputs = [] }

main : Signal Html
main = app.html
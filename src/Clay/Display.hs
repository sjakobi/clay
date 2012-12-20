{-# LANGUAGE OverloadedStrings, GeneralizedNewtypeDeriving #-}
module Clay.Display
(
-- * Float.

  float
, Clear
, both
, clearLeft
, clearRight
, clear

-- * Position.

, Position
, static, absolute, fixed, relative
, position

-- * Display

, Display
, inline, block, listItem, runIn, inlineBlock, table, inlineTable, tableRowGroup
, tableHeaderGroup, tableFooterGroup, tableRow, tableColumnGroup, tableColumn
, tableCell, tableCaption, displayNone, displayInherit, flex
, inlineFlex, grid, inlineGrid
, display

-- * Overlow

, Overflow
, scroll
, overflow, overflowX, overflowY

-- * Visibility.

, Visibility
, collapse
, visibility

-- Clipping.

, Clip
, clip
, rect

-- * Z-index.

, zIndex
)
where

import Data.Monoid
import Data.String

import Clay.Background
import Clay.Size
import Clay.Property
import Clay.Stylesheet
import Clay.Common

-------------------------------------------------------------------------------

float :: Side -> Css
float = key "float"

newtype Clear = Clear Value
  deriving (Val, Other, None, Inherit)

both :: Clear
both = Clear "both"

clearLeft :: Clear
clearLeft = Clear "left"

clearRight :: Clear
clearRight = Clear "right"

clear :: Clear -> Css
clear = key "clear"

-------------------------------------------------------------------------------

newtype Position = Position Value
  deriving (Val, Other, Inherit)

static, absolute, fixed, relative :: Position

static   = Position "static"
absolute = Position "absolute"
fixed    = Position "fixed"
relative = Position "relative"

position :: Position -> Css
position = key "position"

-------------------------------------------------------------------------------

newtype Display = Display Value
  deriving (Val, Other, None, Inherit)

inline, block, listItem, runIn, inlineBlock, table, inlineTable, tableRowGroup,
  tableHeaderGroup, tableFooterGroup, tableRow, tableColumnGroup, tableColumn,
  tableCell, tableCaption, displayNone, displayInherit, flex, inlineFlex, grid,
  inlineGrid :: Display

inline           = Display "inline"
block            = Display "block"
listItem         = Display "list-item"
runIn            = Display "runIn"
inlineBlock      = Display "inline-block"
table            = Display "table"
inlineTable      = Display "inline-table"
tableRowGroup    = Display "table-row-Group"
tableHeaderGroup = Display "table-header-group"
tableFooterGroup = Display "table-footer-group"
tableRow         = Display "table-row"
tableColumnGroup = Display "table-column-group"
tableColumn      = Display "table-column"
tableCell        = Display "table-cell"
tableCaption     = Display "table-caption"
displayNone      = Display "none"
displayInherit   = Display "inherit"
flex             = Display "flex"
inlineFlex       = Display "inline-flex"
grid             = Display "grid"
inlineGrid       = Display "inline-grid"

display :: Display -> Css
display = key "display"

-------------------------------------------------------------------------------

newtype Overflow = Overflow Value
  deriving (Val, Other, Auto, Inherit, Hidden, Visible)

scroll :: Overflow
scroll = Overflow "scroll"

overflow, overflowX, overflowY :: Overflow -> Css

overflow  = key "overflow"
overflowX = key "overflow-y"
overflowY = key "overflow-x"

-------------------------------------------------------------------------------

newtype Visibility = Visibility Value
  deriving (Val, Other, Auto, Inherit, Hidden, Visible)

collapse :: Visibility
collapse = Visibility "collapse"

visibility :: Visibility -> Css
visibility = key "overflow"

-------------------------------------------------------------------------------

newtype Clip = Clip Value
  deriving (Val, Other, Auto, Inherit)

clip :: Clip -> Css
clip = key "clip"

rect :: Size a -> Size a -> Size a -> Size a -> Clip
rect t r b l = Clip (mconcat ["rect(", value t, ",", value r, ",", value b, ",", value l, ")"])

-------------------------------------------------------------------------------

zIndex :: Integer -> Css
zIndex i = key "z-index" (fromString (show i) :: Value)


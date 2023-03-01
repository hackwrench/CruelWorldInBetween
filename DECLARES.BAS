DECLARE SUB Potion.Dose.Display (Text$, Dosage%)
DECLARE SUB Bazaar.Clear ()
DECLARE SUB MasterList ()
DECLARE SUB PersonShow (Display AS ANY, X%, Y%)
DECLARE SUB PersonMove (OBJImage AS ANY, Area%())
DECLARE SUB Screen.Clean ()
DECLARE SUB ScenicView (Direct%, X%, Y%)
DECLARE SUB Castle.Init ()
DECLARE SUB Races.Init ()
DECLARE SUB Item.Armor.Init ()
DECLARE SUB Item.Weapons.Init ()
DECLARE SUB Fountain.Drink.Get (Person AS ANY)
DECLARE SUB ActionBox.Sell (Seller$, ItemType$, Item$(), Prices%(), Which%)
DECLARE SUB BuyItems.Intro (ItemType$)

DECLARE FUNCTION Enough% (Q%)

DECLARE SUB Room.Empty.Find (Object() AS INTEGER, X%, Y%, Z%)
DECLARE FUNCTION Room.IsEmpty% (Castle%(), X%, Y%, Z%)

DECLARE FUNCTION ExitCastle% (Object AS ANY)
DECLARE FUNCTION Spell.Cast.Menu$ ()

DECLARE SUB Font.Regular (Text$, X%, Y%, Colour%)
DECLARE SUB Font.System (Text$, X%, Y%, Colour%)
DECLARE SUB Font.System.Init ()

DECLARE SUB Intro.Game ()

DECLARE SUB Block.PSET (BlockList() AS INTEGER, BlockNum%, X%, Y%)

DECLARE SUB Block.Get ()

DECLARE FUNCTION Value.Limit.Max% (Q%, Max%)
DECLARE FUNCTION Value.Limit.Min% (Q%, Min%)

DECLARE SUB Location.Init (Object AS ANY, InitX%, InitY%)

DECLARE SUB Map.GlobalDisplay (Map%(), Thing() AS Dweller, Object AS ANY)
DECLARE SUB Map.RoomClear (PositionX%, PositionY%)
DECLARE SUB Variable.Load (Object() AS ANY, File$)


DECLARE SUB System.Key.Get ()
DECLARE SUB System.Key.Clear ()
DECLARE SUB System.Delay (T!)

DECLARE SUB Stream.Text.List (TList() AS STRING, FileNumber%)

DECLARE SUB Bar.Title (Text AS STRING, X%, Y%, Length%)

DECLARE FUNCTION CheckMax% (Q%)
DECLARE FUNCTION CoOrdinates% (X%, Y%, Z%)
DECLARE FUNCTION ObjectCoOrdinates% (Object AS ANY)

DECLARE FUNCTION Rand% (Q%)

DECLARE FUNCTION WhereIAm$ (Object AS ANY)

DECLARE FUNCTION Mapx16% (n%)

DECLARE SUB Prompt.Gaze ()
DECLARE FUNCTION Parse.Gaze% (Thing() AS ANY, Building() AS INTEGER)

DECLARE SUB Prompt.Stairs.Init ()

DECLARE SUB Prompt.Spin.Init ()
DECLARE SUB Prompt.Spin (X%, Y%, col%)

DECLARE SUB Prompt.Drink (X%, Y%, ForeColor%)
DECLARE SUB Prompt.Stairs (Direction, X, Y, ForeColor)
DECLARE FUNCTION Parse.Stairs ()
DECLARE FUNCTION YesNo% ()

DECLARE FUNCTION Map1D22DX% (Value1D%, TotalX%)
DECLARE FUNCTION Map1D22DY% (Value1D%, X%, TotalX%)


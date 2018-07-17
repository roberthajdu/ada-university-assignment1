with Card_Dir;
use Card_Dir;

package Coords is
    type Coord is private;

    function Get_X(This : Coord) return Integer;
    function Get_Y(This : Coord) return Integer;

    procedure Set_X(This  : in out Coord;
                    New_X : in     Integer);
    procedure Set_Y(This  : in out Coord;
                    New_Y : in     Integer);

    function Get_Distance(This : Coord; That: Coord) return Integer;

    procedure Change_Direction(This : in out Coord; 
                               Dir : in Cardinal_Direction);

    generic
        type Item is private;
        type Map is array(Integer, Integer) of Item;
    function Coord_With_Array(This : Coord; From : Map) return Item;

private 
    type Coord is record
        X : Integer;
        Y : Integer;
    end record;
end Coords;

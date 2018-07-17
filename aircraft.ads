with Coords, Card_Dir;
use Coords, Card_Dir;

generic
    type Id is (<>);
    with function "<"(Left, Right : Id) return Boolean;
package Aircraft is

    type Aircraft_Type(N : Id) is private;

    procedure Ascend(This : in out Aircraft_Type);

    procedure Land(This : in out Aircraft_Type);
    
    function Get_Is_In_The_Air(This : Aircraft_Type) return Boolean;
    
    function Get_Coord(This : Aircraft_Type) return Coord;

    procedure Set_Card_Dir_Coord(This : in out Aircraft_Type; Card_Dir : Cardinal_Direction);

    procedure Start(This : in out Aircraft_Type);

    function Compare(Left, Right: Aircraft_Type) return Boolean;

    generic
        with procedure Process(Name : in out Id; Position : in out Coord; Is_In_The_Air : in out Boolean);
    procedure Action(This : in out Aircraft_Type);

    function Get_Distance(This: Aircraft_Type; That : Aircraft_Type) return Integer;

private
    type Aircraft_Type(N : Id) is record
        Name : Id := N;
        Position : Coord;
        Is_In_The_Air : Boolean;
    end record;

    procedure Set_Coord(This : in out Aircraft_Type; Position : in Coord);



end Aircraft;
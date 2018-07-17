with Ada.Numerics.discrete_Random;

package body Aircraft is

procedure Ascend(This : in out Aircraft_Type) is 
begin
    This.Is_In_The_Air := True;
end Ascend;

procedure Land(This : in out Aircraft_Type) is 
begin
    This.Is_In_The_Air := False;
end Land;

function Get_Is_In_The_Air(This : Aircraft_Type) return Boolean is 
begin
    return This.Is_In_The_Air;
end Get_Is_In_The_Air;

function Get_Coord(This : Aircraft_Type) return Coord is
begin
    return This.Position;
end Get_Coord;

procedure Set_Card_Dir_Coord(This : in out Aircraft_Type; Card_Dir : in Cardinal_Direction) is
begin
    Change_Direction(This.Position,Card_Dir);
end Set_Card_Dir_Coord;

procedure Start(This : in out Aircraft_Type) is
    subtype Rand_Range is Integer range 0..100;
    package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
    seed : Rand_Int.Generator;
begin
    Rand_Int.Reset(seed);
    Set_X(This.Position, Rand_Int.Random(seed));
    Rand_Int.Reset(seed);
    Set_Y(This.Position, Rand_Int.Random(seed));
    null;
end Start;


function Get_Distance(This: Aircraft_Type; That : Aircraft_Type) return Integer is
begin
    return Coords.Get_Distance(This.Position, That.Position);
end Get_Distance;

function Compare(Left, Right : Aircraft_Type) return Boolean is
begin
    return (Left.Name < Right.Name);
end Compare;

procedure Action(This : in out Aircraft_Type) is
begin
    Process(This.Name, This.Position, This.Is_In_The_Air);
end Action;

procedure Set_Coord(This : in out Aircraft_Type; Position : in Coord) is
begin
    This.Position := Position;
end Set_Coord;


end Aircraft;
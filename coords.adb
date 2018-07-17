package body Coords is
    function Get_X(This : Coord) return Integer is
    begin
        return This.X;
    end Get_X;

    function Get_Y(This : Coord) return Integer is
    begin
        return This.Y;
    end Get_Y;

    procedure Set_X(This  : in out Coord;
                    New_X : in     Integer) is
    begin
        This.X := New_X;
    end Set_X;

    procedure Set_Y(This  : in out Coord;
                    New_Y : in     Integer) is
    begin
        This.Y := New_Y;
    end Set_Y;

    function Get_Distance(This : Coord; That : Coord) return Integer is
        A : Integer;
        B : Integer;
    begin
        A := (That.X) - (This.X);
        B := (That.Y) - (This.Y);

        return (A ** 2 + B ** 2);

    end Get_Distance;

    procedure Change_Direction(This: in out Coord;
                               Dir: in Cardinal_Direction) is
    begin
        case Dir is
            when N => Set_Y(This, This.Y - 1);
            when S => Set_Y(This, This.Y + 1);
            when E => Set_X(This, This.X + 1);
            when W => Set_X(This, This.X - 1);
            when NE => Set_X(This, This.X + 1);
                       Set_Y(This, This.Y - 1);
            when SE => Set_X(This, This.X + 1);
                       Set_Y(This, This.Y + 1);
            when SW => Set_X(This, This.X - 1);
                       Set_Y(This, This.Y + 1);
            when NW => Set_X(This, This.X - 1);
                       Set_Y(This, This.Y - 1);
        end case;
    end Change_Direction;

    function Coord_With_Array(This : Coord; From : Map) return Item is
    begin
        return From(This.X,This.Y);
    end Coord_With_Array;

end Coords;
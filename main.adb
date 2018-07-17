with Ada.Text_IO, Card_Dir, Aircraft, Coords;
use Ada.Text_IO;


procedure Main is 


    procedure SetData(N : in out Integer; Position : in out Coords.Coord; Is_In_The_Air: in out Boolean) is
    begin
        N := 0;
        Coords.Set_X(Position, 0);
        Coords.Set_Y(Position,0);
        Is_In_The_Air := False;
    end SetData;

    package Aircraft_Demo is new Aircraft(Integer, "<");
    procedure Action_Demo is new Aircraft_Demo.Action(Process => SetData);

    -- Aircrafts
    Aircraft_One : Aircraft_Demo.Aircraft_Type(1);
    Aircraft_Two : Aircraft_Demo.Aircraft_Type(2);

    position : Coords.Coord;

begin


    Put_Line("#001 started");
    Aircraft_Demo.Start(Aircraft_One);
    position := Aircraft_Demo.Get_Coord(Aircraft_One);
    Put_Line( "X: " & Integer'Image(Coords.Get_X(position)) & " Y:" & Integer'Image(Coords.Get_Y(position))  );

    Put_Line("#002 started");
    Aircraft_Demo.Start(Aircraft_Two);
    position := Aircraft_Demo.Get_Coord(Aircraft_Two);
    Put_Line( "X: " & Integer'Image(Coords.Get_X(position)) & " Y:" & Integer'Image(Coords.Get_Y(position))  );

    Put_Line("#001 is in the air? " & Boolean'Image(Aircraft_Demo.Get_Is_In_The_Air(Aircraft_One)));
    Put_Line("Let's land with #001!");
    Aircraft_Demo.Land(Aircraft_One);
    Put_Line("#001 is in the air? " & Boolean'Image(Aircraft_Demo.Get_Is_In_The_Air(Aircraft_One)));
    Put_Line("Let's ascend with #001!");
    Aircraft_Demo.Ascend(Aircraft_One);
    Put_Line("#001 is in the air? " & Boolean'Image(Aircraft_Demo.Get_Is_In_The_Air(Aircraft_One)));

    Put_Line("Take action on #001");
    Action_Demo(Aircraft_One);
    position := Aircraft_Demo.Get_Coord(Aircraft_One);
    Put_Line( "X: " & Integer'Image(Coords.Get_X(position)) & " Y:" & Integer'Image(Coords.Get_Y(position))  );
    Put_Line("#001 is in the air? " & Boolean'Image(Aircraft_Demo.Get_Is_In_The_Air(Aircraft_One)));

    Put_Line("#001 bigger than #002?");
    Put_Line( Boolean'Image( Aircraft_Demo.Compare(Aircraft_Two, Aircraft_One)) );



end Main;
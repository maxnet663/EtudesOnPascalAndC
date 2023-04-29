program onecounter;

function OneCounter(x: longint): integer;
var
    counter: integer;
begin
    counter := 0;
    while x > 0 do
    begin
        if x mod 2 = 1 then
            counter := counter + 1;
        x := x div 2;
    end;
    OneCounter := counter;
end;

var
    a, res: longint;
begin
    readln(a);
    res := OneCounter(a);
    writeln(res);
end.

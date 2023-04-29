program square;
var 
    i, x: integer;
begin
    i := 0;
    while i < 3 do
    begin
        read(x);
        x := x * x;
        writeln(x);
        i := i + 1;
    end
end.


program abs;
var 
    x :integer;
begin
    readln(x);

    if x < 0 then 
        x := -x;
    writeln(x);
end.

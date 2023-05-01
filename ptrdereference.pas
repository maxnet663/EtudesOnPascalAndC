program PtrDerefernce;

type
    iptr3 = array [1..3] of ^integer;
var
    a: iptr3;
    p: ^iptr3;
    x, y, z: integer;
begin
    x := 4;
    y := x + 2;
    z := x + y;
    a[1] := @x;
    a[2] := @y;
    a[3] := @z;
    p := @a;
    writeln(p^[1]^, p^[2]^, p^[3]^);
end.

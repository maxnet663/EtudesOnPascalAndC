program printZ;

procedure PrintChars(ch: char; c: integer);
var
    i: integer;
begin
    for i := 0 to c - 1 do
        write(ch);
end;

procedure PrintDiagonal(h, start_pos, end_pos: integer);
var
    i: integer;
begin
    for i := start_pos to end_pos do
    begin
        if i mod 2 = 0 then
            begin
                PrintChars(' ', h  - i div 2 - 1);
                PrintChars('*', 1);
            end
            else
                PrintChars(' ', h);
        writeln;
    end;
end;

procedure printZ(h: integer);
begin
    PrintChars('*', h);
    writeln;
    PrintDiagonal(h, 1, h - 2);
    PrintChars('*', h);
    writeln;
    PrintDiagonal(h, h, h*2 - 3);
    printChars('*', h);
    writeln;
end;

var
    h: integer;
begin
    repeat
        write('Enter the height of Z (positive, odd): ');
        readln(h);
    until (h > 0) and (h mod 2 = 1);

    printZ(h);
end.

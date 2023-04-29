program someDiamonds;

procedure PrintChars(ch: char; count: integer);
var
    i: integer;
begin
    for i := 1 to count do
        write(ch)
end;

procedure PrintLineOfDiamond(k, n, c: integer);
var
    i: integer;
begin
    for i := 0 to c - 1 do
    begin
        PrintChars(' ', n + 1 - k);
        write('*');
        if k > 1 then
        begin
            PrintChars(' ', 2*k - 3);
            write('*');
        end;
        PrintChars(' ', n + 1 - k);
        write(' ');
    end;
    writeln
end;

var
    n, k, h, c: integer;
begin
    repeat
        write('Enter the diamond''s height (positive odd): ');
        readln(h);
    until (h > 0) and (h mod 2 = 1);

    repeat
        write('Enter the amount of diamonds (positive): ');
        readln(c);
    until (c > 0);

    n := h div 2;
    for k := 1 to n + 1 do
        PrintLineOfDiamond(k, n, c);
    for k := n downto 1 do
        PrintLineOfDiamond(k , n, c);
end.


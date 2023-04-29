program Diamond;

procedure PrintChars(ch: char; count: integer);
var
    i: integer;
begin
    for i := 1 to count do
        write(ch)
end;

procedure PrintLineOfDiamond(k, n: integer);
begin
    PrintChars('_', n + 1 - k);
    write('*');
    if k > 1 then
    begin
        PrintChars('_', 2*k - 3);
        write('*');
    end;
    writeln
end;

var
    n, k, h: integer;
begin
    repeat
        write('Enter the diamond''s height (positive odd): ');
        readln(h)
    until (h > 0) and (h mod 2 = 1);
    n := h div 2;
    for k := 1 to n + 1 do
        PrintLineOfDiamond(k, n);
    for k := n downto 1 do
        PrintLineOfDiamond(k, n);
end.

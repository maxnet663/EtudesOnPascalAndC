program newDiamond;

procedure PrintChars(ch: char; count: integer);
var
    i: integer;
begin
    for i := 1 to count do
        write(ch)
end;

procedure PrintLineOfDiamond(k, n: integer);
begin
    PrintChars('*', n + 2 - k);
    if k > 1 then
    begin
        PrintChars(' ', 2*k - 2);
    end;
    PrintChars('*', n + 2 - k);
    writeln
end;

var
    n, k, h: integer;
begin
    repeat
        write('Enter the diamond''s height (positive odd): ');
        readln(h);
    until (h > 0) and (h mod 2 = 1);
    n := h div 2;
    for k := 1 to n + 1 do
        PrintLineOfDiamond(k, n);
    for k := n downto 1 do
        PrintLineOfDiamond(k , n);
end.

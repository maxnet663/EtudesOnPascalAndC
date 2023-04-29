program PrintZ;

procedure PrintChars(ch: char; count: integer);
var
    i: integer;
begin
    for i := 1 to count do
    write(ch)
end;

procedure PrintLine(H, n, k: integer);
var 
    s_k, _h, i: integer;
begin
    _h := (H - 1) shr 1;
    s_k := (k - 1) * _h; 
    for i := 1 to s_k do
        PrintChars(' ', H + 1);
    if (n = 1) or (n mod _h = 1) then
    begin
        PrintChars('*', H);
    end
    else
    begin
        PrintChars(' ', H - n);
        PrintCHars('*', 1);
        PrintChars(' ', n - 1); 
    end;
end;

var 
    H, N, totalH, _h, i, j: integer;
begin
    repeat
        write('Enter the height of Z (positive, odd): ');
        readln(H);
    until (H > 0) and (H mod 2 = 1);
    repeat
        write('Enter the amount of Z (positive): ');
        readln(N);
    until N > 0;
    
    _h := (H - 1) shr 1;
    totalH := H + (N - 1) * _h;
    
    for i := 1 to totalH do
    begin
        for j := 1 to N do
           PrintLine(H, i, j); 
        writeln;
    end;

end.

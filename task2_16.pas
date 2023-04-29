program PrintSymbols;

function Len(s: string): integer;
var
    i: integer;
begin
    i := 1;
    while (s[i] <> #10) and (s[i] <> #0) do
        i := i + 1;
    Len := i;
end;

function found(s: string; ch: char; n, m: integer): boolean;
var
    i: integer;
begin
    if (n > Len(s) - 1) or (n < 1) or (m < n) or (m < 1) then
    begin
        found := false;
        exit
    end;
    for i := n to m do
    begin
        if s[i] = ch then
        begin
            found := true;
            exit 
        end;
    end;
    found := false;
end;

var
    s: string;
    i, _end: integer;
begin
    readln(s);
    _end := Len(s);
    for i := 1 to _end do
    begin
        if found(s, s[i], i + 1, _end - 1) and (not found(s, s[i], 1, i - 1)) 
            and (s[i] <> ' ') then
            write(s[i]);
    end;
    writeln
end.

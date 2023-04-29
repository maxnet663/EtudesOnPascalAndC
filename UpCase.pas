program MyUpCase;

function MyUpCase(s: string): string;
var
    i, len: integer;
begin
    len := length(s);
    for i := 1 to len do
    begin
        if (s[i] >= 'a') and (s[i] <= 'z') then
            s[i] := char(ord(s[i]) - 32);
    end;
    MyUpCase := s;
end;

function MyLowerCase(s: string): string;
var
    i, len: integer;
begin
    len := length(s);
    for i := 1 to len do
    begin
        if (s[i] >= 'A') and (s[i] <= 'Z') then
            s[i] := char(ord(s[i]) + 32);
    end;
    MyLowerCase := s;
end;

var 
    s, sUp, sLow: string;
begin
    readln(s);
    sUp := MyUpCase(s);
    sLow := MyLowerCase(s);
    writeln(sUp, ' ', sLow);
end.

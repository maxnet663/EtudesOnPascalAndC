program MyInsert;

procedure MyInsert(inS: string; var s: string; index: integer);
var
   inSLen, len, i: integer; 
begin
    inSLen := length(inS);
    len := length(s);
    SetLength(s, len + inSLen);
    for i := len downto index do
        s[i + inSLen] := s[i]; 
    for i := 1 to inSLen do
        s[index - 1 + i] := inS[i];
end;

var 
    s, ins: string;
    i: integer;
begin
    readln(s);
    readln(ins);
    readln(i);
    MyInsert(ins, s, i);
    writeln(s);
end.

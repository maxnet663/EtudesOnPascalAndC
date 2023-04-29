program MyDelete;

procedure MyDelete(var s:string; startPos, count: integer);
var
    len, endPos, i: integer;
begin
    len := length(s);
    endPos := startPos + count - 1;
    if startPos > len then
        exit;
    if endPos >= len then
    begin
        SetLength(s, startPos - 1);
        exit;
    end;
    for i := 0 to len - startPos - count do 
        s[startPos + i] := s[endPos + 1 + i];
    SetLength(s, len - count);
end;

var
    s: string;
    n, k: integer;
begin
    readln(s);
    readln(n, k);
    MyDelete(s, n, k);
    writeln(s);
end.

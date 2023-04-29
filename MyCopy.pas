program MyCopy;

function MyCopy(s: string; startPos, count: integer): string;
var
    len, i: integer;
    subStr: string;
begin
    subStr := '';
    len := length(s);
    if (len - startPos + 1) < count then
        count := len - startPos  + 1;
    if (startPos > len) or (startPos < 1) then
    begin
        MyCopy := '';
        exit;
    end;
    for i := startPos to startPos + (count - 1) do
        subStr := subStr + s[i];
    MyCopy := subStr;
end;

var
    s: string;
begin
    readln(s);
    writeln(MyCopy(s, 2, 2), #10, MyCopy(s, 4, 20), #10, MyCopy(s, 0, 11), #10,
            MyCopy(s, 1, 9));
end.

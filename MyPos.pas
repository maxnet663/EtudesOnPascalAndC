program MyPos;

function MyPos(s, subStr: string): integer;
var 
    i, j, sLen, subStrLen, ans: integer;
    found: boolean;
begin
    sLen := length(s);
    subStrLen := length(subStr);
    found := false;
    ans := 0;
    for i := 1 to  sLen - subStrLen + 1 do
    begin
        if subStr[1] = s[i] then
        begin
            found := true;
            ans := i;
            for j := 2 to subStrLen do
            begin
                if subStr[j] <> s[i + j -1] then
                begin
                    found := false;
                    ans := 0;
                    break;
                end;
            end;
            if found then
            begin
                MyPos := ans;
                exit;
            end;
        end;
    end;
    MyPos := ans;
end;

var
    s, ss: string;
begin
    while not eof do
    begin
        readln(s);
        readln(ss);
        writeln(MyPos(s, ss));
    end;
end.


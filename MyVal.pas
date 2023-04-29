program MyVal;

procedure MyVal(s: string; var num: longint; var incorrect: word);
var
    i, start, len: integer;
begin
    start := 1;
    len := length(s);
    while (s[start] = ' ') or (s[start] = #9) do
    begin
        start := start + 1;
        if start = len then
        begin
            incorrect := len;
            exit
        end;
    end;
    for i := start to len do
    begin
        if (s[i] < '0') or (s[i] > '9') then
        begin
            incorrect := i;
            exit
        end; 
    end;
    num := 0;
    incorrect := 0;
    for i := start to len do
        num := num * 10 + (ord(s[i]) - ord('0')); 
end;

var
    s: string;
    n: longint;
    incPos: word;
begin
    while not eof do
    begin
        readln(s);
        MyVal(s, n, incPos);
        if incPos > 0 then
        begin
            writeln('Incorrect symbol ''', s[incPos], ''' on pos: ', incPos);
        end
        else
            writeln(n * 1);
    end;
end.

program PrintInBrackets;

var
    result: string;
    isWord: boolean;
    c: char;
begin
    isWord := false;
    result := '';
    while not eof do
    begin
        read(c);
        if (c <> ' ') and (c <> #9) and (c <> #10) then
        begin
            if isWord then
            begin
                result := result + c;
            end
            else
            begin
                result := result  + '(' + c;
                isWord := true;
            end;
        end;
        if (c = ' ') or (c = #9) then
        begin
            if isWord then
            begin
                result := result + ')';
                isWord := false;
            end;
        end;
        if (c = #10) then
        begin
            if isWord then
                result := result + ')';
            writeln(result);
            isWord := false;
            result := '';
        end;
    end;
end.

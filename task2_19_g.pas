program task2_19_g;

var 
    OpenCLoseCounter: integer;
    c: char;
    previousBracket: boolean;
begin
    previousBracket := false;
    OpenCLoseCounter := 0;
    while not eof do
    begin
        read(c);
        if (c = '(') then
            previousBracket := true;
        if (c = ')') and previousBracket then
        begin
            OpenCLoseCounter := OpenCLoseCounter + 1; 
            previousBracket := false;
        end;
        if (c <> '(') and (c <> ')') and previousBracket then
            previousBracket := false;
        if (c = #10) then
        begin
            writeln(OpenCLoseCounter);
            previousBracket := false;
            OpenCLoseCounter := 0;
        end;
    end;
end.

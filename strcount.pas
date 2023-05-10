program StringCounter;

var
    counter: integer;
    ch: char;
begin
    counter := 0;
    while not eof do
    begin
        read(ch);
        if ch = #10 then
            counter := counter + 1;
    end;
    writeln(counter);
end.

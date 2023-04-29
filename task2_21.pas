program PrintEnvenWords;

var
    letters_counter: integer;
    s, result: string;
    c: char;
begin
    letters_counter := 0;
    s := '';
    result := '';
    while not eof do
    begin
        read(c);
        if (c <> ' ') and (c <> #9) and (c <> #10) then
        begin
            letters_counter := letters_counter + 1;
            s := s + c;
        end;
        if (c = ' ') or (c = #9) then
        begin
            if letters_counter = 2 then
            begin
                result := result + ' ' + s; 
                s := '';
                letters_counter := 0;
            end
            else
            begin
                letters_counter := 0;
                s := '';
            end;
        end;
        if (c = #10) then
        begin
            if letters_counter = 2 then
                result := result + s; 
            writeln(result);
            letters_counter := 0;
            s := '';
            result := '';
        end;
    end;
end.

program task2_19(efgh);

function max(x, y: integer) : integer;
begin
    if (x > y) then
    begin
        max := x;
        exit
    end
    else
        max := y;
end;

function min(x, y: integer) : integer;
begin
    if (x < y) then
    begin
        min := x;
        exit
    end
    else
        min := y;
end;

procedure PutToZero(var letters_counter, word_counter, spaces_counter, max_len, min_len, max_spaces: integer);
begin
    letters_counter := 0;
    word_counter := 0;
    spaces_counter := 0;
    max_len := 0;
    min_len := 32767;
    max_spaces := 0;
end;

var
    word_counter, letters_counter, spaces_counter, max_len, min_len, max_spaces: integer;
    c: char;
begin
    PutToZero(letters_counter, word_counter, spaces_counter, max_len, min_len, max_spaces);
    while not eof do
    begin
        read(c);
        if (c <> ' ') and (c <> #10) and (c <> #9) then
        begin
            max_spaces := max(max_spaces, spaces_counter);
            spaces_counter := 0;
            letters_counter := letters_counter + 1;
        end;
        if ((c = ' ') or (c = #9)) and (letters_counter <> 0) then
        begin
            max_len := max(letters_counter, max_len);
            min_len := min(letters_counter, min_len);
            word_counter := word_counter + 1;
            letters_counter := 0;
        end;
        if (c = ' ') then
            spaces_counter := spaces_counter + 1;
        if (c = #9) then
            spaces_counter := spaces_counter + 4;
        if (c = #10) then
        begin
            if letters_counter <> 0 then
            begin
                max_len := max(letters_counter, max_len);
                min_len := min(letters_counter, min_len);
                word_counter := word_counter + 1;
            end;
            max_spaces := max(spaces_counter, max_spaces);
            writeln('e) words: ', word_counter, ', max length: ', max_len,
                ', min length: ', min_len);
            writeln('f) max length: ', max_len, ', max spaces: ', max_spaces);
            PutToZero(letters_counter, word_counter, spaces_counter, max_len, min_len, max_spaces);
        end;
    end;
end.

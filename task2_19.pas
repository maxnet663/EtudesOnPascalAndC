program Task2_19;

procedure EvenOrOdd(var letters_counter, odd_counter, even_counter: integer);
begin
    if (letters_counter mod 2 = 0) and (letters_counter <> 0) then
    begin
        even_counter := even_counter + 1;
        exit
    end;
    if (letters_counter mod 2 = 1) then
    begin
        odd_counter := odd_counter + 1;
        exit
    end;
end;

procedure PutToZero(var letters_counter, odd_counter, even_counter, more_seven,
                        less_two, AZword: integer);
begin
    letters_counter := 0;
    odd_counter := 0;
    even_counter := 0;
    more_seven := 0;
    less_two := 0;
    AZword := 0;
end;

procedure LessOrMore(var letters_counter, less_two, more_seven: integer);
begin
    if (letters_counter > 7) then
        more_seven := more_seven + 1;
    if (letters_counter > 0) and (letters_counter < 3) then
        less_two := less_two + 1;
end;

procedure isAZWord(var AZword: integer; var startsWIthA, endsWithZ: boolean);
begin
    if startsWIthA and endsWithZ then
        AZword := AZword + 1; 
end;

procedure NewWord(var letters_counter: integer; var startsWIthA, endsWithZ: boolean);
begin
    letters_counter := 0;
    startsWIthA := false;
    endsWithZ := false;
end;

procedure PutToFalse(var startsWIthA, endsWithZ: boolean);
begin
    startsWIthA := false;
    endsWithZ := false; 
end;

var
    c: char;
    letters_counter, odd_counter, even_counter, more_seven, less_two, AZword: integer;
    startsWIthA, endsWithZ: boolean;
begin
    PutToZero(letters_counter, odd_counter, even_counter, more_seven, less_two, AZword);
    PutToFalse(startsWIthA, endsWithZ);
    while not eof do
    begin
        read(c);
        if (c <> ' ') and (c <> #10) and ( c <> #9) then
        begin
            letters_counter := letters_counter + 1;
            if (letters_counter = 1) then
                startsWIthA := (c = 'a') or (c = 'A');
            if (letters_counter > 1) then
                endsWithZ := (c = 'z') or (c = 'Z'); 
        end;
        if ((c = ' ') or (c = #9)) then
        begin
            EvenOrOdd(letters_counter, odd_counter, even_counter);
            LessOrMore(letters_counter, less_two, more_seven);
            isAZWord(AZword, startsWIthA, endsWithZ);
            NewWord(letters_counter, startsWIthA, endsWithZ);
        end;
        if (c = #10) then
        begin
            EvenOrOdd(letters_counter, odd_counter, even_counter);
            LessOrMore(letters_counter, less_two, more_seven);
            isAZWord(AZword, startsWIthA, endsWithZ);
            writeln('a) words: ', odd_counter + even_counter);
            writeln('b) odd words: ', odd_counter, ' even words: ', even_counter);
            writeln('c) more then seven symbols: ', more_seven, ' less then three symbols: ',
                        less_two);
            writeln('d) A..Z words: ', AZword);
            PutToZero(letters_counter, odd_counter, even_counter, more_seven, less_two, AZword);
            PutToFalse(startsWIthA, endsWithZ);
        end;
    end;
end.

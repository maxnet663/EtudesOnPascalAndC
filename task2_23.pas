program PrintCountWords;

function len(s: string): byte;
var
    counter: byte;
begin
    counter := 0;
    while s[counter + 1] <> #0 do
        counter := counter + 1;
    len := counter;
end;

function CountWords(s: string): byte;
var
    LenS, counter, i: byte;
    IsWord: boolean;
begin
    IsWord := false;
    LenS := len(s);
    counter := 0;
    for i := 1 to LenS do
    begin
        if (s[i] <> ' ') and (s[i] <> #9) and (not IsWord) then
            counter := counter + 1;
        IsWord := (s[i] <> ' ') and (s[i] <> #9);
    end;
    CountWords := counter;
end;

begin
    if ParamCount <> 1 then
    begin
        writeln('Wrong parameter''s number: ', ParamCount, '. One required.');
        halt(1);
    end;
    writeln(CountWords(ParamStr(1)));
end.

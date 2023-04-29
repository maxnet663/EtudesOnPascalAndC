program OlympiadCounter;

const 
    MaxSchool = 67;
    MaxGroup = 100;
type
    CounterArray = array[1..MaxSchool] of integer;
var
    Counters: CounterArray;
    i, c, n: integer;
begin
    for i := 1 to MaxSchool do
        Counters[i] := 0;
    {$I-}
    while not eof do
    begin
        readln(c);
        if IOResult <> 0 then
        begin
            writeln('Incorrect data');
            halt(1);
        end;
        n := c div MaxGroup;
        if (n < 1) or (n > MaxGroup) then 
        begin
            writeln('Illegal school id: ', c, ' [', c, ']');
            halt(1);
        end;
        Counters[n] := Counters[n] + 1;
    end;
    n := 1;
    for i := 2 to MaxSchool do
    begin
        if (Counters[i] > Counters[n]) then
            n := i;
    end;
    for i := 1 to MaxSchool do
    begin
        if Counters[i] = Counters[n] then
            writeln(i);
    end;
end.

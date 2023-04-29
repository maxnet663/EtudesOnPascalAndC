program task2_22.pas;

function len(s: string): byte;
var
    counter: byte;
begin
    counter := 0;
    while s[counter] <> #0 do
        counter := counter + 1;
    if counter = 0 then
    begin
        len := counter;
        exit
    end
    else
        len := counter - 1;
end;

function DontContainRepLet(s: string): boolean;
var
    i, j, LenS: integer;
begin
    LenS := len(s);
    for i := 1 to LenS do
    begin
        for j := i + 1 to LenS do
        begin
            if s[i] = s[j] then
            begin
                DontContainRepLet := false;
                exit;
            end;
        end;
    end;
    DontContainRepLet := true;
end;

function ContainChar(s: string; ch: char): byte;
var
    counter, i, LenS: byte;
begin
    counter := 0;
    LenS := len(s);
    for i := 1 to LenS do
    begin
        if s[i] = ch then
            counter := counter + 1;
    end;
    ContainChar := counter;
end;

function ContainOnlyDigit(s: string): boolean;
var
    i, LenS: byte;
begin
    LenS := len(s);
    for i := 1 to LenS do
    begin
        if (s[i] < '0') or (s[i] > '9') then
        begin
            ContainOnlyDigit := false;
            exit;
        end;
    end;
    ContainOnlyDigit := true;
end;

function HasCommon(s1, s2: string): boolean;
var
    LenS1, i: byte;
begin
    LenS1 := len(s1);
    for i := 1 to LenS1 do
    begin
        if ContainChar(s2, s1[i]) > 0 then
        begin
            HasCommon := true;
            exit
        end;
    end;
    HasCommon := false;
end;  

var 
    i: integer;
begin
    for i := 2 to ParamCount do
    begin     
        if HasCommon(ParamStr(i), ParamStr(1)) then
            writeln(ParamStr(i));
    end;
end.

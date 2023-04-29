program ReadLongint;

procedure ReadLongint(var correct: boolean; var num: string; n: integer);
var
    alphabet: string;
    pos: integer;
    ch: char;
begin
    alphabet := '0123456789ABCDEFGHijKLMNOPQRSTVUWXYZ';
    pos := 0;
    repeat
        read(ch);
        pos := pos + 1;
    until (ch <> ' ') and (ch <> #10);
    while (ch <> ' ') and (ch <> #10) do
    begin
        if ((ch < '0') or (ch > '9')) and ((ch < 'a') or (ch > 'z')) 
            and ((ch < 'A') or (ch > 'Z')) then
        begin
            correct := False;
            writeln('Unexpected symbol on ', pos, ' pos');
            readln;
            exit
        end;
        if (ch >= 'a') and (ch <= 'z') then
            ch := chr(ord(ch) + 33);
        num := num + ch;
        read(ch);
        pos := pos + 1;
    end;
    correct := True;
end;

var
    ok: boolean;
    x: string;
begin
    x := '';
    repeat
        write('Type the number: ');
        ReadLongint(ok, x, 10);
    until ok;
    writeln(x);
end.

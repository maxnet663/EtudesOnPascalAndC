program LongestSequance; {the program writes longest sequence of digits}
uses mydequeofchars; {dequeofchars.pp}

procedure ReadStr(var deque: dequeofchars);
var
    ch: char;
begin
    while true do
    begin
        read(ch);
        if ch = #10 then
            exit
        else
            DOCPushBack(deque, ch);
    end;
end;

function IsDigit(ch: char): boolean;
begin
    IsDigit := (ch >= '0') and (ch <= '9');
end;

function LenOfSeq(p: itemptr): integer;
var
    counter: integer;
begin
    if not IsDigit(p^.data) then
    begin
        LenOfSeq := 0;
        exit;
    end;
    counter := 1;
    while (p^.next <> nil) and (IsDigit(p^.next^.data)) do {IsDigit will be called}
    begin                                                  {only if p^.next <> nil}
        counter := counter + 1;                            {so its safe}
        p := p^.next;
    end;
    LenOfSeq := counter;
end;

function MaxLenOfSeq(var deque: dequeofchars): integer;
var
    p: itemptr;
    max, len: integer;
begin
    max := 0;
    p := deque.first; 
    while p <> nil do
    begin
        if IsDigit(p^.data) then
        begin
            len := LenOfSeq(p);
            if len > max then
                max := len
            else
            begin
                repeat
                    p := p^.next; 
                until (p = nil) or (not IsDigit(p^.data));
            end;
        end 
        else 
            p := p^.next;
    end;
    MaxLenOfSeq := max;
end;

procedure WriteSeq(p: itemptr);
begin
    write(p^.data);
    if (p^.next <> nil) and (IsDigit(p^.next^.data)) then
        WriteSeq(p^.next);
end;

procedure WriteLongestSequance(var deque: dequeofchars);
var
    maxlen: integer;
    p: itemptr;
begin
    maxlen := MaxLenOfSeq(deque);
    p := deque.first;
    while p <> nil do
    begin
        if IsDigit(p^.data) then
        begin
            if LenOfSeq(p) = maxlen then
            begin
                WriteSeq(p); 
                write(' ');
            end;
            repeat
                p := p^.next;
            until (p = nil) or (not IsDigit(p^.data));
        end
        else
            p := p^.next;
    end;
end;

var
    deque: DequeOfChars;
begin
    while not eof do
    begin
        DOCInit(deque);
        ReadStr(deque);
        WriteLongestSequance(deque);
        DOCDispose(deque.first);
        writeln;
    end;
end.

program StringList;

type
    itemptr = ^item;
    item = record
        data: string;
        next: itemptr;
    end;

type 
    StackOfStrings = itemptr;

procedure SOSInit(stack: StackOfStrings);
begin
    stack := nil;
end;

procedure SOSPush(var stack: StackOfStrings; s: string);
var 
    tmp: itemptr;
begin
    new(tmp);
    tmp^.data := s;
    tmp^.next := stack;
    stack := tmp;
end;

procedure SOSPop(var stack: StackOfStrings; var s: string);
var
    tmp: itemptr;
begin
    s := stack^.data;
    tmp := stack;
    stack := stack^.next;
    dispose(tmp);
end;

function SOSIsEmpty(var stack: StackOfStrings): boolean;
begin
    SOSIsEmpty := stack = nil;
end;

procedure SOSReadStr(var stack: StackOfStrings);
var
    s: string;
    ch: char;
    IsWord: boolean;
begin
    IsWord := false;
    s := '';
    repeat
        read(ch);
        if (ch <> #9) and (ch <> #32) and (ch <> #10) then
        begin
            IsWord := true;
            s := s + ch;
        end
        else
        begin
            if IsWord then
            begin
                SOSPush(stack, s);
                s := '';
                IsWord := false;
            end;
        end;
    until (ch = #10);
end;

var 
    stack: StackOfStrings;
    s: string;
begin
    while not eof do
    begin
        SOSInit(stack);
        SOSReadStr(stack);
        while not SOSIsEmpty(stack) do
        begin
            SOSPop(stack, s);
            write(s, ' ');
        end;
        writeln;
    end;
end.

program LongList_(task2_40);

type
    itemptr = ^item;
    item = record
        data: longint;
        next: itemptr;
    end;

type
    LongList = record
        first, last: itemptr;
    end;

procedure ListInit(var list: LongList);
begin
    list.first := nil;
    list.last := nil;
end;

procedure ListPut(var list: LongList; n: longint);
var
    tmp: itemptr;
begin
    new(tmp);
    tmp^.data := n;
    tmp^.next := nil;
    if list.last = nil then
        list.first := tmp
    else
        list.last^.next := tmp;
    list.last := tmp;
end;

procedure ListGet(var list: LongList; var n: longint);
var
    tmp: itemptr;
begin
    new(tmp);
    n := list.first^.data;
    tmp := list.first;
    list.first := list.first^.next; 
    if list.first = nil then
        list.last := nil;
    dispose(tmp);
end;

function ListIsEmpty(var list: LongList): boolean;
begin
    ListIsEmpty := list.first = nil;
end;

function RepeatedTimes(var list: LongList; n: longint): integer;
var
    pp: ^itemptr;
    tmp: itemptr;
    counter: integer;
begin
    pp := @list.first;
    counter := 0;
    while pp^ <> nil do
    begin
        if pp^^.data = n then
        begin
            counter := counter + 1;
            tmp := pp^;
            pp^ := pp^^.next;
            dispose(tmp);
        end
        else
            pp := @(pp^^.next);
    end;
    RepeatedTimes := counter;
end;

var
    list: LongList;
    n: longint;
begin
    ListInit(list);
    while not eof do
    begin
        readln(n);
        ListPut(list, n);
    end;
    writeln;
    while not ListIsEmpty(list) do
    begin
        ListGet(list, n);
        if RepeatedTimes(list, n) = 2 then
            writeln(n);
    end;
end.

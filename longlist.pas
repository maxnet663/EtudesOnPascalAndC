program LongList_(task2_40_41);

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

procedure DeleteNode(var list: LongList; n: longint); {Delete all nodes with field data = n}
var
    pp: ^itemptr;
    tmp: itemptr;
begin
    pp := @list.first;
    while pp^ <> nil do
    begin
        if pp^^.data = n then
        begin
            tmp := pp^;
            pp^ := pp^^.next;
            dispose(tmp);
        end
        else
            pp := @(pp^^.next);
    end;
end;

function RepeatedTimes(var list: LongList; n: longint): integer;
var
    CurNode: itemptr;
    counter: integer;
begin
    CurNode := list.first;
    counter := 0;
    while CurNode <> nil do
    begin
        if CurNode^.data = n then
            counter := counter + 1;
        CurNode := CurNode^.next;
    end;
    RepeatedTimes := counter;
end;

function MaxRepeatedTimes(var list: LongList): integer;
var
    CurOccurs, max: integer;
    CurNode: itemptr;
begin
    max := 0;
    CurNode := list.first;
    while CurNode <> nil do
    begin
        CurOccurs := RepeatedTimes(list, CurNode^.data);
        if CurOccurs > max then
            max := CurOccurs;
        CurNode := CurNode^.next;
    end;
    MaxRepeatedTimes := max;
end;

var
    list: LongList;
    n: longint;
    MaxOccurs: integer;
begin
    ListInit(list);
    while not eof do
    begin
        readln(n);
        ListPut(list, n);
    end;
    writeln;
    MaxOccurs := MaxRepeatedTimes(list);
    while not ListIsEmpty(list) do
    begin
        ListGet(list, n);
        if RepeatedTimes(list, n) = MaxOccurs - 1 then
            writeln(n);
    end;
end.

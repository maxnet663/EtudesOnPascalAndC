program Deque;

type
    LongItem2Ptr = ^LongItem2;
    LongItem2 = record
        data: longint;
        next, prev: LongItem2Ptr;
    end;

type 
    LongDeque = record
        first, last: LongItem2Ptr;
    end;

procedure LongDequeInit(var deque: LongDeque);
begin
     deque.first := nil;
     deque.last := nil;
end;

procedure LongDequePushFront(var deque: LongDeque; n: longint);
var
    tmp: LongItem2Ptr;
begin
    new(tmp);
    tmp^.data := n;
    tmp^.prev := nil;
    tmp^.next := deque.first;
    if deque.first = nil then
        deque.last := tmp
    else
        deque.first^.prev := tmp;
    deque.first := tmp; 
end;

procedure LongDequePushBack(var deque: LongDeque; n: longint);
var
    tmp: LongItem2Ptr;
begin
    new(tmp);
    tmp^.data := n;
    tmp^.prev := deque.last;
    tmp^.next := nil;
    if deque.last = nil then
        deque.first := tmp
    else
        deque.last^.next := tmp;
    deque.last := tmp;
end;

procedure LongDequePopFront(var deque: LongDeque; var n: longint);
var 
    tmp: LongItem2Ptr;
begin
    n := deque.first^.data;
    tmp := deque.first;
    deque.first := deque.first^.next;
    if deque.first = nil then
        deque.last := nil
    else
        deque.first^.prev := nil;
    dispose(tmp);
end;

procedure LongDequePopBack(var deque: LongDeque; var n: longint);
var
    tmp: LongItem2Ptr;
begin
    new(tmp);
    n := deque.last^.data;
    tmp := deque.last;
    deque.last := deque.last^.prev;
    if deque.last = nil then
        deque.first := nil
    else
        deque.last^.next := nil;
    dispose(tmp);
end;

function LongDequeIsEmpty(var deque: LongDeque): boolean;
begin
    LongDequeIsEmpty := deque.first = nil; 
end;

var 
    d: LongDeque;
    n: longint;
    i: integer;
    tmp: LongItem2Ptr;
begin
    LongDequeInit(d);
    while not eof do
    begin
        readln(n);
        if n mod 2 = 0 then
            LongDequePushFront(d, n)
        else 
            LongDequePushBack(d, n); 
    end;
    writeln;
    tmp := d.first;
    while tmp <> nil do
    begin
        writeln(tmp^.data);
        tmp := tmp^.next;
    end;
    writeln;
    while not LongDequeIsEmpty(d) do
    begin
        readln(i);
        if i = 1 then
            LongDequePopFront(d, n)
        else
            LongDequePopBack(d,n);
        writeln(n);
    end;
end.

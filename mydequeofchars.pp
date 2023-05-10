unit MyDequeOfChars;
interface
type
    itemptr = ^item;
    item = record
        data: char;
        next, prev: itemptr;
    end;

type 
    DequeOfChars = record
        first, last: itemptr;
    end;

procedure DOCInit(var deque: DequeOfChars);
procedure DOCPushFront(var deque: DequeOfChars; ch: char);
procedure DOCPushBack(var deque: DequeOfChars; ch: char);
procedure DOCPopFront(var deque: DequeOfChars; var ch: char);
procedure DOCPopBack(var deque: DequeOfChars; var ch: char);
function DOCIsEmpty(var deque: DequeOfChars): boolean;
procedure DOCDispose(var p: itemptr);

implementation
    
procedure DOCInit(var deque: DequeOfChars);
begin
    deque.first := nil;
    deque.last := nil;
end;

procedure DOCPushFront(var deque: DequeOfChars; ch: char);
var
    tmp: itemptr;
begin
    new(tmp);
    tmp^.data := ch;
    tmp^.next := deque.first;
    tmp^.prev := nil;
    if deque.first = nil then
        deque.last := tmp
    else
        deque.first^.prev := tmp;
    deque.first := tmp;
end;

procedure DOCPushBack(var deque: DequeOfChars; ch: char);
var
    tmp: itemptr;
begin
    new(tmp);
    tmp^.data := ch;
    tmp^.next := nil;
    tmp^.prev := deque.last;
    if deque.last = nil then
        deque.first := tmp
    else
        deque.last^.next := tmp;
    deque.last := tmp;
end;

procedure DOCPopFront(var deque: DequeOfChars; var ch: char);
var
    tmp: itemptr;
begin
    tmp := deque.first;
    deque.first := deque.first^.next;
    if deque.first = nil then
        deque.last := nil
    else
        deque.first^.prev := nil;
    dispose(tmp);
end;

procedure DOCPopBack(var deque: DequeOfChars; var ch: char);
var
    tmp: itemptr;
begin
    tmp := deque.last;
    deque.last := deque.last^.prev;
    if deque.last = nil then
        deque.first := nil
    else
        deque.last^.next := nil;
    dispose(tmp);
end;

function DOCIsEmpty(var deque: DequeOfChars): boolean;
begin
    DOCIsEmpty:= deque.first = nil;
end;

procedure DOCDispose(var p: itemptr);
begin
    if  p <> nil then
        DOCDispose(p^.next);
    dispose(p);
end;

end.

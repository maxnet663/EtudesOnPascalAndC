program QueueOfLongints;

type 
    LongItemPtr = ^LongItem;
    LongItem = record
        data: longint;
        next: LongItemPtr;
    end;

type
    QueueOfLongint = record
        first, last: LongItemPtr;
    end;

procedure QOLInit(var queue: QueueOfLongint);
begin
    queue.first := nil;
    queue.last := nil;
end;

procedure QOLPut(var queue: QueueOfLongint; n: longint);
begin
    if queue.first = nil then
    begin
        new(queue.first);
        queue.last := queue.first;
    end
    else
    begin
        new(queue.last^.next);
        queue.last := queue.last^.next;
    end;
    queue.last^.data := n;
    queue.last^.next := nil;
end;

procedure QOLGet(var queue: QueueOfLongint; var n: longint);
var
    tmp: LongItemPtr;
begin
    n := queue.first^.data;
    tmp := queue.first;
    queue.first := queue.first^.next;
    if queue.first = nil then
        queue.last := nil;
    dispose(tmp);
end;

function QOLIsEmpty(var queue: QueueOfLongint): boolean;
begin
    QOLIsEmpty := queue.first = nil;
end;

var
    q: QueueOfLongint;
    n: longint;
begin
    QOLInit(q);
    while not eof do
    begin
        readln(n);
        QOLPut(q, n);
    end;
    writeln;
    while not QOLIsEmpty(q) do 
    begin
        QOLGet(q, n);
        writeln(n);
    end;
end.

program AddToEndList;

type
    itemptr = ^item;
    item = record
        data: integer;
        next: itemptr;
    end;

procedure WriteItems(p, last: itemptr);
begin
    writeln(p^.data);
    if p <> last then
        WriteItems(p^.next, last);
end;

procedure DeleteList(p, last: itemptr);
begin
    while p <> last do
        DeleteList(p^.next, last);
    dispose(p);
    Writeln('Disposed');
end;

var
    first, temp, Last: itemptr;
    n: integer;
begin
    readln(n);
    new(first);
    first^.data := n;
    first^.next := nil;
    last := first;
    while not eof do
    begin
        readln(n);
        new(temp);
        temp^.data := n;
        temp^.next := nil;
        last^.next := temp;
        last := temp;
        temp := nil;
    end;
    Writeln;
    WriteItems(first, last);
    WriteItems(first, last);
    DeleteList(first, last);
end.

program AddToTopList;

type
    itemptr = ^item;
    item = record 
        data: integer;
        next: itemptr;
    end;

procedure WriteItems(p: itemptr);
var
    foundend: boolean;
begin
    writeln(p^.data);  
    foundend := p^.next = nil;
    if not foundend then
        WriteItems(p^.next);
    dispose(p);
    writeln(' Pointer disposed'); 
end;

var
    first, temp: itemptr;
    n: integer;
begin
    readln(n);
    new(first);
    first^.data := n;
    first^.next := nil;
    while not eof do
    begin
        readln(n);
        new(temp);
        temp^.data := n;
        temp^.next := first;
        first := temp;
        temp := nil;
    end;
    writeln;
    WriteItems(first);
end.

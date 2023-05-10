program MyListOfLists;

type
    itemptr = ^item; {node for the list of the char}
    item = record
        data: char;
        next: itemptr;
    end;
type
    ListOfChars = record 
        first, last: itemptr; {pointers to the beginning and the end of the list}
    end;

type
    nodeptr = ^node;  
    node = record
        plist: ListOfChars;
        next: nodeptr;
    end;
type 
    ListOfLists = record       {pointers to the beginning and the end of the list}
        first, last: nodeptr;   {every node of which is another list}
    end;

procedure LOHInit(var list: ListOfChars); {list of chars organized as ordinary queue}
begin
    list.first := nil;
    list.last := nil;
end;

procedure LOHPush(var list: ListOfChars; ch: char);
var
    tmp: itemptr;
begin
    new(tmp);
    tmp^.data := ch;
    tmp^.next := nil;
    if list.last = nil then
        list.first := tmp
    else
        list.last^.next := tmp;
    list.last := tmp;
end;

procedure LOHGet(var list: ListOfChars; var ch: char);
var
    tmp: itemptr;
begin
    ch := list.first^.data;
    tmp := list.first;
    list.first := list.first^.next;
    if list.first = nil then
        list.last := nil;
    dispose(tmp); 
end;

function LOHIsEmpty(var list: ListOfChars): boolean;
begin
    LOHIsEmpty := list.first = nil;
end;

procedure LOLInit(var list: ListOfLists);
begin
    list.first := nil;
    list.last := nil;
end;

procedure LOLPush(var list: ListOfLists; p: ListOfChars); {list of lists also is queue}
var
    tmp: nodeptr;
begin
    new(tmp);
    tmp^.plist := p;
    tmp^.next := nil;
    if list.last = nil then
        list.first := tmp
    else
        list.last^.next := tmp;
    list.last := tmp;
end;

procedure LOLGet(var list: ListOfLists; var p: ListOfChars);
var
    tmp: nodeptr;
begin
    p := list.first^.plist;
    tmp := list.first;
    list.first := list.first^.next;
    if list.first = nil then
        list.last := nil;
    dispose(tmp);
end;

function LOLIsEmpty(var list: ListOfLists): boolean;
begin
    LOLIsEmpty := list.first = nil;
end;

procedure ReadStr(var lol: ListOfLists); {procedure for character by chracter reading}
var
    ch: char;
    IsWord: boolean;
    lohtmp: ListOfChars;
begin
    IsWord := false;
    repeat
        read(ch);
        if (ch <> #9) and (ch <> #32) and (ch <> #10) and IsWord then {if met another character of the same word}
            LOHPush(lohtmp, ch);
        if (ch <> #9) and (ch <> #32) and (ch <> #10) and (not IsWord) then {met new word}
        begin
            IsWord := true;
            LOHInit(lohtmp); {every word is list of chars}
            LOHPush(lohtmp, ch); {create new list for this word}
            LOLPush(lol, lohtmp); {add them to the list of lists}
        end;
        if (ch = #9) or (ch = #32) or (ch = #10) then
            IsWord := false;
    until (ch = #10);
end;

function LOLHasItems(var list: ListOfLists): boolean; {check if has this list initialized lists}
var
    tmp: nodeptr;
begin
    tmp := list.first;
    while tmp <> nil do
    begin
        if not LOHIsEmpty(tmp^.plist) then
        begin
            LOLHasItems := true;
            exit
        end;
    tmp := tmp^.next;
    end;
    LOLHasItems := false;
end;

procedure DeleteList(var list: ListOfLists);
var
    p: ListOfChars;
begin
    while not LOLIsEmpty(list) do
        LOLGet(list, p); 
end;

var
    loh: ListOfChars;
    lol: ListOfLists;
    tmp: nodeptr;
    ch: char;
begin
    while not eof do
    begin
        LOHInit(loh);
        LOLInit(lol);
        ReadStr(lol);
        writeln;
        while LOLHasItems(lol) do
        begin
            tmp := lol.first;
            while tmp <> nil do
            begin
                if LOHIsEmpty(tmp^.plist) then
                    ch := ' '
                else
                    LOHGet(tmp^.plist, ch);
                write(ch);
                tmp := tmp^.next;
            end;
            writeln;
        end;
    end;
    if not LOLHasItems(lol) then
        DeleteList(lol);
end.


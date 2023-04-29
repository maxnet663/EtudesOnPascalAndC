program PrintRectangle;
uses crt;

type 
    rect = record 
        x, y, a, b: integer;
end;

procedure GetKey(var code: integer);
var
    ch: char;
begin
    ch := ReadKey;
    if ch = #0 then
    begin
        ch := ReadKey;
        code := -ord(ch);
    end
    else
        code := ord(ch);
end;

procedure PrintRect(var r: rect);
var
    i, j:  integer;
begin
    GotoXY(r.x, r.y);
    for i := 1 to r.a do
    begin
        for j := 1 to r.b do
            write('*');
        GotoXY(r.x, r.y + i);
    end;
    GotoXY(1, 1);
end;

procedure HideRect(var r: rect);
var
    i, j:  integer;
begin
    GotoXY(r.x, r.y);
    for i := 1 to r.a do
    begin
        for j := 1 to r.b do
            write(' ');
        GotoXY(r.x, r.y + i);
    end;
    GotoXY(1, 1);
end;

procedure SetSize(var r: rect; a, b: integer);
begin
    HideRect(r);         {because we will change the coordinates of rectangle}
    r.a := a;            {we must hide it before}
    r.b := b;
    if r.a < 1 then
        r.a := 1;
    if r.a > ScreenHeight then
        r.a := ScreenHeight;
    if r.b < 1 then
        r.b := 1;
    if r.b > ScreenWidth then
        r.b := ScreenWidth;
    r.x := round(ScreenWidth div 2 -  r.b div 2);
    r.y := round(ScreenHeight div 2 - r.a div 2);
end;

var
    r: rect;
    c: integer;
begin
    clrscr;
    r.a := 3;
    r.b := 3;
    r.x := round(ScreenWidth div 2 -  r.b div 2);
    r.y := round(ScreenHeight div 2 - r.a div 2);
    PrintRect(r);
    while true do
    begin
        if not KeyPressed then
        begin
            PrintRect(r);
        end;
        GetKey(c);
        case c of
            -75: SetSize(r, r.a, r.b - 1);
            -77: SetSize(r, r.a, r.b + 1);
            -72: SetSize(r, r.a + 1, r.b);
            -80: SetSize(r, r.a - 1, r.b);
            27: break;
        end;
    end;
    clrscr;
end.

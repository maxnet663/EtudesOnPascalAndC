program ColoredBackground;
uses crt;
type
    Colors = 0..15;
type 
    rect = record
        x, y, a, b: integer;
        ColText, ColBack: Colors;
end;

procedure ChangeTextColor(var r: rect; k: integer);
begin
    r.ColText := (r.ColText + k) mod 16;
end;

procedure ChangeBackColor(var r: rect; k: integer);
begin
    r.ColBack := (r.ColBack + k) mod 8;
end;

procedure PrintRectangle(var r: rect);
var 
    i, j: integer;
begin
    TextColor(r.ColText);
    TextBackGround(r.ColBack);
    GotoXY(r.x, r.y);
    for i := 1 to r.a do
    begin
        for j := 1 to r.b do
            write('*');
        GotoXY(r.x, r.y + i);
    end;
    GotoXY(1, 1);
end;

procedure HideRectangle(var r: rect);
var
    i, j: integer;
begin
    GotoXY(r.x, r.y);
    for i := 1 to r.a do
    begin
        for j := 1 to r.b do
            write(' ');
        GotoXY(r.x, r.y + 1);
    end;
    GotoXY(1, 1);
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

var
    r: rect;
    c: integer;
begin
    r.a := 5;
    r.b := 5;
    r.x := round(ScreenWidth div 2 - r.b div 2);
    r.y := round(ScreenHeight div 2 - r.a div 2);
    r.ColText := 7;
    r.ColBack := 0;
    clrscr;
    PrintRectangle(r);
    while true do
    begin
        if not KeyPressed then
        begin
            Delay(100);
            HideRectangle(r);
            PrintRectangle(r);
            continue;
        end;
        GetKey(c);
        case c of
            -75: ChangeBackColor(r, -1);
            -77: ChangeBackColor(r, 1);
            -72: ChangeTextColor(r, 1);
            -80: ChangeTextColor(r, -1);
            32: break;
            27: break;
        end;
    end;
    write(#27'[Om');
    clrscr;
end.

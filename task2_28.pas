program PrintSquare;
uses crt;
type
    {color = (Black, Blue, Green, Cyan, Red, Magenta, Brown, LightGray, 
            DarkGray, LightBlue, LightGreen, LightCyan, LightRed, LightMagenta,
            Yellow, White); }
    color = 0..15;

type
    rect = record
        x, y, a, b: integer;
end;

type 
    sharp = record
        x, y, dx, dy: integer;
        col: color;
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

procedure PrintRectangle(var r: rect);
var
    i, j: integer;
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

procedure PrintSharp(var s: sharp);
begin
    GotoXY(s.x, s.y);
    write('#');
    GotoXY(1,1);
end;

procedure HideSharp(var s: sharp);
begin
    GotoXY(s.x, s.y);
    write(' ');
    GotoXY(1, 1);
end;

procedure SetDirection(var s: sharp; dx, dy: integer);
begin
    s.dx := dx;
    s.dy := dy;
end;

procedure MoveSharp(var s: sharp);
begin
    HideSharp(s);
    s.x := s.x + s.dx;
    s.y := s.y + s.dy;
    s.col := succ(s.col);
    TextColor(s.col);
    PrintSharp(s);
end;

procedure SetDelay(var del: integer; ddel: integer);
begin
    del := del + ddel;
    if del < 0 then
        del := 1;
end;

var
    r: rect;
    s: sharp;
    c, DelayDuration: integer;
begin
    DelayDuration := 100;
    r.a := 10;
    r.b := 10;
    r.x := round((ScreenWidth / 2) - (r.b / 2));
    r.y := round((ScreenHeight / 2) - (r.a / 2));
    s.x := r.x - 1;
    s.y := r.y - 1;
    s.dx := 1;
    s.dy := 0;
    s.col := Black;
    clrscr;
    PrintRectangle(r);
    PrintSharp(s);
    while true do
    begin
        if not KeyPressed then
        begin
            MoveSharp(s);
            Delay(DelayDuration);
            if (s.x = r.x - 1) and (s.y = r.y - 1) then {1}
                SetDirection(s, -s.dy, -s.dx);
            if (s.x = r.x + r.b) and (s.y = r.y - 1) then
                SetDirection(s, s.dy, s.dx);
            if (s.x = r.x + r.b) and (s.y = r.y + r.a) then {3}
                SetDirection(s, -s.dy, -s.dx);
            if (s.x = r.x - 1) and (s.y = r.y + r.a) then
                SetDirection(s, s.dy, s.dx);
            continue;
        end;
        GetKey(c);
        case c of
            27: break;
            32: SetDirection(s, s.dx * (-1), s.dy * (-1));
            -75: SetDelay(DelayDuration, 10);
            -77: SetDelay(DelayDuration, - 10);
        end;
    end;
    clrscr;
end.

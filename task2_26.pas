program RunningStar;
uses crt;
const
    DelayDuration = 100;
    Passes = 6;
type
    star = record
        CurX, CurY, dx, dy: integer;
        end;

procedure ShowStar(var s: star);
begin
    GotoXY(s.CurX, s.CurY);
    write('*');
    GotoXY(1, 1);
end;

procedure HideStar(var s: star);
begin
    GotoXY(s.CurX, s.CurY);
    write(' ');
    GotoXY(1, 1);
end;

procedure SetDirection(var s: star; dx, dy: integer);
begin
    s.dx := dx;
    s.dy := dy;
end;

procedure MoveStar(var s: star);
begin
    HideStar(s);
    s.CurX := s.CurX + s.dx;
    s.CurY := s.CurY + s.dy;
    ShowStar(s);
end;

var
    s: star;
    PassesCounter: byte;
begin
    clrscr;
    s.CurX := 1;
    s.CurY := ScreenHeight div 2;
    s.dx := 1;
    s.dy := 0;
    ShowStar(s);
    PassesCounter := 0;
    while (PassesCounter < Passes) and (not KeyPressed) do
    begin
        MoveStar(s);
        Delay(DelayDuration);
        if s.CurX = ScreenWidth then
        begin
            SetDirection(s, -1, 0);
            PassesCounter := PassesCounter + 1;
        end;
        if s.CurX = 1 then
        begin
            SetDirection(s, 1, 0);
            PassesCounter := PassesCounter + 1;
        end;
    end;
    clrscr;
end.

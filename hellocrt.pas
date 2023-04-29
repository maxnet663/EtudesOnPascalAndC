program HelloCRT;
uses crt;
const
    message = 'Hello, World';
    DelayDuration = 5000;
var 
    x, y: integer;
begin
    clrscr;
    x := (ScreenWidth - length(message)) div 2;
    y := ScreenHeight div 2;
    GotoXY(x,y);
    write(message);
    GotoXY(1, 1);
    Delay(DelayDuration);
    clrscr;
end.

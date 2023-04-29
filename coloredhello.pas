program ColoredHello; {actually, it is a terrible code. I am sorry}
uses crt;
const
    TextColors = 16;
    BackgroundColors = 8;
type
ColorBackground = 
        (BackgroundBlack, BackgroundBlue, BackgroundGreen, BackgroundCyan,
         BackgroundRed, BackgroundMagenta, BackgroundBrown, BackgroundLightGray);
ColorText = 
        (TextBlack, TextBlue, TextGreen, TextCyan, TextRed, TextMagenta, TextBrown, TextLightGray,
         TextDarkGray, TextLightBlue, TextLightGreen, TextLightCyan, TextLightRed, TextLightMagenta,
         TextYellow, TextWhite);

function ColorToStr(color: ColorBackground): string;
begin
    case color of
       BackgroundBlack: ColorToStr := 'Black';
       BackgroundBlue: ColorToStr := 'Blue';
       BackgroundGreen: ColorToStr := 'Green';
       BackgroundCyan: ColorToStr := 'Cyan';
       BackgroundRed: ColorToStr := 'Red';
       BackgroundMagenta: ColorToStr := 'Magenta';
       BackgroundBrown: ColorToStr := 'Brown';
       BackgroundLightGray: ColorToStr := 'LightGray'
       else ColorToStr := 'Black';
    end;
end;

function ColorToStr(color: ColorText): string;
begin
    case color of
       TextBlack: ColorToStr := 'Black';
       TextBlue: ColorToStr := 'Blue';
       TextGreen: ColorToStr := 'Green';
       TextCyan: ColorToStr := 'Cyan';
       TextRed: ColorToStr := 'Red';
       TextMagenta: ColorToStr := 'Magenta';
       TextBrown: ColorToStr := 'Brown';
       TextLightGray: ColorToStr := 'LightGray';
       TextDarkGray: ColorToStr := 'DarkGray';
       TextLightBlue: ColorToStr := 'LightBlue';
       TextLightGreen: ColorToStr := 'LightGreen';
       TextLightCyan: ColorToStr := 'LightCyan';
       TextLightRed: ColorToStr := 'LightRed';
       TextLightMagenta: ColorToStr := 'LightMagenta';
       TextYellow: ColorToStr := 'Yellow';
       TextWhite: ColorToStr := 'White';
       else ColorToStr := 'LightGray';
    end;
end;

function StrToColor(s: string; marker: byte): byte;
var
    x: ColorBackground; 
    y: ColorText;
    i: byte;
begin
    if marker = 0 then
    begin
        x := BackgroundBlack;
        i := 0;
        while (s <> ColorToStr(x)) and (i < BackgroundColors) do
        begin
            x := succ(x);
            i := i + 1;
        end;
        if i > BackgroundColors then
            StrToColor := ord(BackgroundBlack)
        else
            StrToColor := ord(x);
        exit;
    end;
    if marker > 0 then
    begin
        y := TextBlack;
        i := 0;
        while (s <> ColorToStr(y)) and (i < TextColors) do
        begin
            y := succ(y);
            i := i + 1;
        end;
        if i > TextColors then
            StrToColor := ord(LightGray)
        else
            StrToColor := ord(y);
        exit;
    end;
end;

var
    i: byte; 
    cb: ColorBackground;
    ct: ColorText; 
    scb, sct: string;
begin
    i := 0;
    cb := BackgroundBlack;
    writeln('Table of Background''s colors:'); 
    while i < BackgroundColors do
    begin
        TextColor(i);
        write(ColorToStr(cb), ' ');
        if i mod 2 = 1 then
            writeln;
        i := i + 1;
        cb := succ(cb);
    end;
    writeln('Type the color of the Bacground: ');
    readln(scb);
    i := 0;
    ct := TextBlack;
    writeln('Table of Text''s colors:');
    while i < TextColors do
    begin
        TextColor(i);
        write(ColorToStr(ct), ' ');
        if i mod 2 = 1 then
            writeln;
        i := i + 1;
        ct := succ(ct);
    end;
    writeln('Type the color of the Text: ');
    readln(sct);
    TextColor(StrToColor(sct, 1));
    TextBackground(StrToColor(scb, 0));
    writeln(ParamStr(1));
end.

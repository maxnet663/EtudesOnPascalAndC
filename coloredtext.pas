program ColoredText;
uses crt;

begin
    TextColor(Yellow);
    TextBackground(Blue or Blink);
    writeln('Hello');
end.

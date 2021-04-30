PROGRAM SarahRevere(INPUT, OUTPUT);
USES
  DOS;
VAR
  Str: STRING;
BEGIN{Response}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  Str := GetEnv('QUERY_STRING');
  IF Str = 'lanterns=1'
  THEN
    WRITELN('The British are coming by land.')
  ELSE
    IF Str = 'lanterns=2'
    THEN
      WRITELN('The British are coming by sea.')
    ELSE
      WRITELN('Sarah didn''t say.')
END.{Response}

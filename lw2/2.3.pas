PROGRAM HelloDear(INPUT, OUTPUT);
USES
  DOS;
  
VAR
  Data: STRING; 
BEGIN{HelloDear}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  Data := GetEnv('QUERY_STRING');
  WRITE('Hello, ');
  IF (Pos('name', Data) = 1) AND (Pos('=', Data) = 5)
  THEN
    BEGIN
      Delete(Data, 1, 5);
      IF Data <> ''
      THEN
        WRITE(Data)
      ELSE
        WRITE('Anonymous')
    END
  ELSE
    WRITE('Anonymous');
  WRITELN('!')
END.{HelloDear}

PROGRAM HelloDear(INPUT, OUTPUT);
USES
  DOS;
VAR
  Data: STRING;
  BegPrt, MidPrt, EndPrt: INTEGER;
  
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  Data: STRING;
  BegPrt, MidPrt, EndPrt: INTEGER;
BEGIN{GetQueryStringParameter}
  BegPrt := 0; {Key}
  MidPrt := 0; {= ��� ���������� ������ �������� ���������}
  EndPrt := 0; {& OR EOLN ��� ���������� ����� �������� ���������}
  Data := GetEnv('QUERY_STRING'); 
  BegPrt := Pos(Key, Data);{������� ������� ���������}
  
  {IF BegPrt = 0
  THEN
    Data := ''
  ELSE  }
    BEGIN
      Delete(Data, 1, BegPrt);
      BegPrt := Pos(Key, Data);{������������� ������� ���������}  
      MidPrt := Pos('=', Data);
      IF Key = Copy(Data, BegPrt, MidPrt)
      THEN
        BEGIN  
          EndPrt := Pos('&', Data);
    
          IF EndPrt = 0
          THEN
            Delete(Data, 1, MidPrt) 
          ELSE
            BEGIN
              MidPrt := MidPrt + 1;
              EndPrt := EndPrt - MidPrt;{����������� ����� �������� ���������}                   
              Data := Copy(Data, MidPrt, EndPrt)  
            END; 
         END
       ELSE
         Data := ''     
    END;     
     
  GetQueryStringParameter := Data
END;{GetQueryStringParameter} 
BEGIN{HelloDear}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  WRITE('Hello, ');
  Data := GetQueryStringParameter('name');
  IF Data <> ''
  THEN
    WRITE(Data)
  ELSE
    WRITE('Anonymous');
  WRITELN('!')
END.{HelloDear}


PROGRAM WorkWithQueryString(INPUT, OUTPUT); 
USES
  DOS; 
  
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  Data: STRING;
  BegPrt, MidPrt, EndPrt: INTEGER;
BEGIN{GetQueryStringParameter}
  BegPrt := 0; {Key}
  MidPrt := 0; {= для вычисления начала значения параметра}
  EndPrt := 0; {& OR EOLN для вычисления конца значения параметра}
  Data := GetEnv('QUERY_STRING'); 
  BegPrt := Pos(Key, Data);{находим позицию параметра}
  
  {IF BegPrt = 0
  THEN
    Data := ''
  ELSE  }
    BEGIN
      Delete(Data, 1, BegPrt);
      BegPrt := Pos(Key, Data);{пересчитываем позицию параметра}  
      MidPrt := Pos('=', Data);  
      EndPrt := Pos('&', Data);
    
      IF EndPrt = 0
      THEN
        Delete(Data, 1, MidPrt) 
      ELSE
        BEGIN
          MidPrt := MidPrt + 1;
          EndPrt := EndPrt - MidPrt;{высчитываем длину значения параметра}                   
          Data := Copy(Data, MidPrt, EndPrt)  
        END;      
    END;  
     
  GetQueryStringParameter := Data
END;{GetQueryStringParameter} 
  
BEGIN {WorkWithQueryString}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'))
END. {WorkWithQueryString}

{?last_name=Kazantsev&?age=19&?first_name=Roman} 
{?age=19&?first_name=Roman&?last_name=Kazantsev} 
{?last_name=Kazantsev&?first_name=Roman&?age=19} 
{?last_name=Kazantsev&?age=19} 

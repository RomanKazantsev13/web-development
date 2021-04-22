PROGRAM WorkWithQueryString(INPUT, OUTPUT); 
USES
  DOS; 
  
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  Data: STRING;
  PosKey: INTEGER;
BEGIN{GetQueryStringParameter}
  Data := GetEnv('QUERY_STRING');
  PosKey := Pos(Key, Data);
  
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

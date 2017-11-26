type year=1500..2000; month=1..12; day=1..31;
data=Record
  y: year; m: month; d: day; 
  End;

function Leap(yy: year): boolean; 
  begin 
     if (
      ((yy mod 4 = 0) and (yy mod 100<>0)) or ((yy mod 4=0) and (yy mod 100=0) and (yy mod 400=0))
     )
     then
  Leap:=true
  else Leap:= false;
  end;
  
function Dmonth(mm: month; yy: year): day;
  begin
     case mm of
        4,6,9,11:
            Dmonth:=30;
        1,3,5,7,8,10,12:
            Dmonth:=31;
        2:
            if Leap(yy)=true then
                Dmonth:=29; 
            else
                     Dmonth:=28;  
    end;
  end; 
  
  
procedure Tomorrow(yy: year; mm: month; dd: day); 
begin 
  if dd<>Dmonth(mm, yy)
    then
    begin
        dd:=dd+1;
        mm:=mm;
        yy:=yy;
    end
  else if mm=12 then
    begin 
        dd:=1;
        mm:=1;
        yy:=yy+1;
    end 
  else 
        begin       
        dd:=1;
        mm:=mm+1;
        yy:=yy;
  end;
  writeln(dd,' ',mm,' ',yy);
end; 

procedure Prev(yy: year; mm: month; dd: day); 
begin 
  if (dd<>1) and (mm<>1)
    then
    begin
        dd:=dd-1;
        mm:=mm;
        yy:=yy;
    end
  else if (dd=1) and (mm<>1) then
    begin 
        dd:=Dmonth(mm-1, yy);
        mm:=mm-1;
        yy:=yy;
    end 
  else 
        begin      
        dd:=Dmonth(mm, yy);
        mm:=12;
        yy:=yy-1; 
  end;
  writeln(dd,' ',mm,' ',yy);
end; 

var a,b,c: year;  
index: integer;
begin
    write('Год: ');
    readln(a);
    write('Месяц: ');
    readln(b);
    write('День: ');
    readln(c);
    repeat
      writeln('введите номер задания ');
      readln(index);
      case index of
      1:     writeln('високосный ',Leap(a));
      2: writeln(Dmonth(b,a));
      3: Tomorrow(a,b,c);
      4: Prev(a,b,c);
      end
    until index = 0;
readln;
end.
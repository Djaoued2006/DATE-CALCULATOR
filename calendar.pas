program makingCalendar;

procedure makeCalendar(days , start : integer);

    var i , j , ptr : integer;

    begin
        for j := 1 to 6 do write('  ');
        writeln('D  L  M  M  J  V  S');
        for i := 1 to start do 
            begin
                write('   ') 
            end;

        ptr := start;
        i := 1;

        for j := 1 to 6 do write('  ');

        while True do 
            begin
                
                if (i = days + 1) then break;

                if (ptr = 7) then
                    begin
                        ptr := 0; 
                        writeln();
                        for j := 1 to 6 do write('  ');
                    end;
                
                if (i < 10) then write(i , '  ')
                else write(i , ' ');

                i := i + 1;
                ptr := ptr + 1;

            end;
        writeln();
    end;    


var days , start : integer;

begin
    repeat
        write('type number of days : ');readln(days);
    until(days >= 0);
    repeat
        write('type number of start : ');readln(start);
    until ((start >= 0) and (start <= 6));
    writeln();
    writeln('here''s the calendar you wanted : ');

    makeCalendar(days , start)
end.

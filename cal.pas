program makeCalendar;


function isBissextile(year : integer) : boolean;

    begin
        if (year mod 100 = 0) then 
            isBissextile := ((year div 100) mod 4 = 0)
        else 
            isBissextile := (year mod 4 = 0)
    end;

procedure makeCalendar(days , start : integer ; var lastDay : integer);

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
        lastDay := ptr;
        writeln();
    end;    

procedure makeCals(year , month : integer; var start: integer);

    var numberOFCals : integer;
        days , next : integer;

    begin
        numberOFCals := 0;

        while (numberOFCals <> 3) do 
            begin
                case month of 
                    1 : begin
                            writeln('Janvier , ' , year);
                            days := 31;
                        end;
                    2 : begin
                            writeln('Fevrier , ' , year);
                            if (isBissextile(year)) then 
                                days := 29
                            else 
                                days := 28
                        end;
                    3 : begin
                            writeln('Mars , ' , year);
                            days := 31;
                        end;
                    4 : begin
                            writeln('Avril , ' , year);
                            days := 31;
                        end;
                    5 : begin
                            writeln('Mai , ' , year);
                            days := 31;
                        end;
                    6 : begin
                            writeln('Juin , ' , year);
                            days := 31;
                        end;
                    7 : begin
                            writeln('Juillet , ' , year);
                            days := 31;
                        end;
                    8 : begin
                            writeln('Aout , ' , year);
                            days := 31;
                        end;
                    9 : begin
                            writeln('Septembre , ' , year);
                            days := 31;
                        end;
                    10 : begin
                            writeln('Octobre , ' , year);
                            days := 31;
                        end;
                    11 : begin
                            writeln('Novembre , ' , year);
                            days := 31;
                        end;
                    12 : begin
                            writeln('Decembre , ' , year);
                            days := 31;
                            year := year + 1;
                            month := 0;
                        end;
                end;
                makeCalendar(days , start , next);
                start := next;
                month := month + 1;
                numberOFCals := numberOFCals + 1;
                writeln();
            end;
    end;
    
var year , month , start: integer;

begin
    write('type year : ');readln(year);
    write('type month :');readln(month);
    write('which start : ');readln(start);

    makeCals(year , month , start);
end.

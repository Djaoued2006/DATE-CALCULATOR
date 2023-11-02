program makeCalendars;

function isBissextile(year : integer) : boolean;

    var tmp : integer;
        result : boolean;
    
    begin 

        tmp := year div 100;
        result := True;
        
        if (year mod 100 = 0) then  

            begin 

                if (tmp mod 4 <> 0) then result := false;

            end 
        
        else 

            if (year mod 4 <> 0 ) then result := false;

        isBissextile := result;

    end;

procedure calendar(nbrOfDays , startDay : integer ; var input : integer);

    var ptr , i : integer;

    begin 

        ptr := 0;
        i := 1;

        writeln('D  L  M  M  J  V  S');

        while ptr < startDay do 

            begin 
                write('   ');
                ptr := ptr + 1;
            end;

        
        while True do 

            begin 

                if (i = nbrOfDays + 1) then break;

                if (ptr = 7) then 

                    begin   
                        writeln();
                        ptr := 0
                    end; 

                case i of 
                    1..9 : write(i , '  '); 
                    else  write(i , ' ') //because for exemple 10 has two digits which will affect the output
                end;
                
                i := i + 1;
                
                ptr := ptr + 1;
                   
            end;
        
        input := ptr - 1;
        
        writeln();
        
    end;

procedure generateCalendars(year , month , startDay: integer);
    
    var nbrOfCalendars , nbrOfDays , input : integer;


    begin 

        nbrOfCalendars := 0;
        
        while (nbrOfCalendars <> 3) do 

            begin 
                
                if (month = 13) then 
                    begin
                        month := 1;
                        year := year + 1
                    end;

                case month of 
                    1 , 3 , 5 , 7 , 8 , 10 , 12: nbrOfDays := 31;
                    2 : begin 
                            if isBissextile(year) then nbrOfDays := 29
                            else nbrOfDays := 28
                        end;
                    4 , 6 , 9 , 11: nbrOfDays := 30;
                end;

                writeln('year : ' , year , ', month : ', month);
                writeln();
                calendar(nbrOfDays , startDay , input);
                writeln();
                
                startDay := input + 1;

                month := month + 1;
                nbrOfCalendars := nbrOfCalendars + 1;

            end;
        


    end;


var year , month , startDay : integer;

begin 

    writeln('Hello user!');

    writeln();

    write('Insert a year : ');readln(year);
    write('Insert a month : ');readln(month);
    write('Insert the start day (0-Sunday ... 6-Saturday) : ');readln(startDay);

    writeln();

    generateCalendars(year , month , startDay);

end.

{Approach : to solve the problem i used a procedure i did before (calendar) that generates a single calendar
then for every month i did its number and i passed it to my procedure as an argument , for the start days , i used the input variable that stores the last day (sunday etc) 
then i passed it to startday incrementing it by 1 (sunday last month -> monday new month) and i loooped , until i get the number of calendars wanted!!!}

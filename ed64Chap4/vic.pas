(*****************************************************************
* VIC emulation unit                                             *
* This file is part of ED64                                      *
* Copyright 2006 by ir. Marc Dendooven                           *
* Version: Chapter 4                                             *
*****************************************************************)
Unit vic;

(****************************************************************)
interface

procedure vicText(pos: word; val: byte);
(****************************************************************)

implementation
uses Crt;
const
        charset : array[0..$7F] of char =

                (   '@','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
                    'P','Q','R','S','T','U','V','W','X','Y','Z','[','�',']','^','',
                    ' ','!','"','#','$','%','&','''','(',')','*','+',',','-','.','/',
                    '0','1','2','3','4','5','6','7','8','9',':',';','<','=','>','?',
                    '�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�',
                    '�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�',
                    ' ','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�',
                    '�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�'
                );



procedure vicText(pos: word; val: byte);
begin
    gotoXY((pos mod 40)+1,(pos div 40)+1);
    if val < $80 then begin
                            textAttr:=$9B;
                            write(charset[val])
                       end
                 else begin
                            textAttr:=$B9;
                            write(charset[val-$80])
                       end
end;

end.

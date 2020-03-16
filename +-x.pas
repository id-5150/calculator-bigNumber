//default maximum number length: 255
//run the file: "bigNum-cal.exe" to try this code
//created by: L.C Thanh
//MyGit: github.com/id-5150

uses crt;
type
    bigNum=string;
    type_of_var=integer;
var
   k,key:char;

procedure Init;
      begin
         clrscr;
         writeln('Continue? Press Enter');
         writeln('1. Back');
         key:=readkey;
         //add this code: "if key='1' then exit;" after "Init" code
         // to use this procedure
      end;

procedure pro_end;
   begin
      writeln;
      writeln('0.Exit              1.Back');
      key:=readkey;
   end;

procedure add;
   var
      a,b,c:bigNum;
      hold,x,y,s,i:byte;
   procedure NhapDL;
      begin
         clrscr;
         writeln('---Calculator---');
         writeln;
         writeln('A + B');
         write('A= '); readln(a);
         write('B= '); readln(b);
         writeln;
      end;
   procedure PrtRlt;
      begin
         if hold<>0 then c:='1'+c;
         write(' = ',c);
      end;
   begin
      Init;
      if key='1' then exit;
      NhapDl;
      while length(a)<length(b) do a:='0'+a;
      while length(a)>length(b) do b:='0'+b;
      hold:=0; c:='';
      for i:=length(a) downto 1 do
      begin
         x:=ord(a[i])-48;
         y:=ord(b[i])-48;
         s:=x+y+hold;
         hold:=s div 10;
         c:=chr((s mod 10)+48)+c;
      end;
      PrtRlt; pro_end;
   end;

procedure sub;
   var
      a,b,c:bigNum;
   procedure NhapDL;
      begin
         clrscr;
         writeln('---Calculator---');
         writeln;
         writeln('A - B');
         write('A= '); readln(a);
         write('B= '); readln(b);
         writeln;
      end;
   function sub1(a,b:bigNum):bigNum;
      var
         x,y,s,hold,i:integer; c:bigNum;
      begin
         while length(a)>length(b) do b:='0'+b;
         hold:=0; c:='';
         for i:=length(a) downto 1 do
         begin
            x:=ord(a[i])-48;
            y:=ord(b[i])-48;
            s:=x-y-hold;
            if s<0 then begin s:=s+10; hold:=1; end;
            c:=chr(s+48)+c;
         end;
         while (length(c)<>0) and (c[1]='0') do delete(c,1,1);
         sub1:=c;
      end;
   procedure PrtRlt;
      begin
         write(' = ',c);
      end;
   begin
      Init;
      if key='1' then exit;
      NhapDl;
      if length(a)<length(b) then c:='-'+sub1(b,a)
      else
        begin
        if length(a)=length(b) then begin
          if a<b then c:='-'+sub1(b,a)
          else c:=sub1(a,b); end;
        if length(a)>length(b) then c:=sub1(a,b);
        end;
      PrtRlt; pro_end;
   end;

procedure bigDiv;
   var
      a,c:bigNum; hold,b,s:qword;
   procedure NhapDl;
      begin
         clrscr;
         writeln('---Calculator---');
         writeln;
         writeln('A div B');
         write('A= '); readln(a);
         write('B= '); readln(b);
         writeln;
      end;
   procedure process;
      var
         i:type_of_var;
      begin
         hold:=0; c:='';
         for i:=1 to length(a) do
         begin
            hold:=hold*10+(ord(a[i])-48);
            s:=hold div b;
            hold:=hold mod b;
            c:=c+chr(s+48);
         end;
         if (length(c)>0) and (c[1]='0') then delete(c,1,1);
      end;
   procedure PrtRlt;
      begin
         write(' = ',c);
      end;
   begin
      Init;
      if key='1' then exit;
      NhapDL;
      process;
      PrtRlt; pro_end;
   end;

procedure pro_main;
   begin
      repeat
         clrscr;
         writeln('---Calculator---');
         writeln;
         writeln('1. A + B');
         writeln('2. A - B');
         writeln('3. A / B');
         writeln;
         writeln('0.Exit');
         k:=readkey;
         case k of
            '0':halt;
            '1':add;
            '2':sub;
            '3':bigDiv;
         end;
      until key='0';
   end;

begin
   key:='1';
   pro_main;
end.

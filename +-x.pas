uses crt;
type
    bigNum=string;
var
   k:char;

procedure add;
   var
      a,b,c:bigNum;
      hold,x,y,s,i:byte;
   procedure NhapDL;
      begin
         clrscr;
         writeln('a+b');
         write('a= '); readln(a);
         write('b= '); readln(b);
         writeln;
      end;
   procedure PrtRlt;
      begin
         if hold<>0 then c:='1'+c;
         write('= ',c);
         readln
      end;
   begin
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
      PrtRlt;
   end;

procedure sub;
   var
      a,b,c:bigNum;
   procedure NhapDL;
      begin
         clrscr;
         writeln('a-b');
         write('a= '); readln(a);
         write('b= '); readln(b);
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
         write(c);
         readln
      end;
   begin
      NhapDl;
      if length(a)<length(b) then c:='-'+sub1(b,a)
      else
        begin
        if length(a)=length(b) then begin
          if a<b then c:='-'+sub1(b,a)
          else c:=sub1(a,b); end;
        if length(a)>length(b) then c:=sub1(a,b);
        end;
      PrtRlt;
   end;

procedure bigDiv;
   var
      a,b,c:bigNum;
   procedure NhapDl;
      begin
         clrscr;
         writeln('a div b');
         write('a= '); readln(a);
         write('b= '); readln(b);
         writeln;
      end;
   procedure process;
      begin

      end;
   procedure PrtRlt;
      begin
      end;
   begin
      NhapDL;
      process;
      PrtRlt;
   end;

begin
   clrscr;
   writeln('---Calculator---');
   writeln;
   writeln('1. +');
   writeln('2. -');
   writeln('3. Updating...');
   k:=readkey;
   case k of
      '1':add;
      '2':sub;
   end;
end.

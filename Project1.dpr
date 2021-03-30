program Project1;

uses
  Forms,
  Windows,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit7 in 'Unit7.pas' {Form7},
  Unit8 in 'Unit8.pas' {Form8},
  Unit9 in 'Unit9.pas' {Form9},
  Unit10 in 'Unit10.pas' {Form10},
  Unit11 in 'Unit11.pas' {Form11},
  Unit12 in 'Unit12.pas' {Form12},
  Unit13 in 'Unit13.pas' {Form13},
  Unit15 in 'Unit15.pas' {Form15};

{$R *.res}
var eventhandle:thandle;
const eventname='one_isnt_demo_event';
begin
eventhandle:=openevent(EVENT_ALL_ACCESS,false,eventname);
if eventhandle<>0 then begin
closehandle(eventhandle);
halt;
end;
eventhandle:=createevent(nil,false,false,eventname);







  form3:=tform3.create(nil);
  form3.Show;
  Form3.Repaint;
  sleep(2000);
  form3.close;
  form15:=TForm15.Create(nil);
  form15.ShowModal;
  Application.Initialize;
  Application.HelpFile := 'Help.chm';
  Application.Title := 'Оргтехника';
  Application.CreateForm(TForm1, Form1);
  form3.Free;
  Application.Run;
end.

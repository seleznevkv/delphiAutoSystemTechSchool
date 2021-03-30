unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, ADODB, ComCtrls;

type
  TForm11 = class(TForm)
    ADOQuery1: TADOQuery;
    ADOQuery1id_pokup: TAutoIncField;
    ADOQuery1fam: TWideStringField;
    ADOQuery1imya: TWideStringField;
    ADOQuery1otch: TWideStringField;
    ADOQuery1datar: TDateTimeField;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    dbgrd3: TDBGrid;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    btn1: TBitBtn;
    Label5: TLabel;
    Edit5: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses Unit2, Unit8, Unit12, Unit1;

{$R *.dfm}

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
form8.qry1.requery();
end;

procedure TForm11.BitBtn2Click(Sender: TObject);
begin
adoquery1.append;
form12:=tform12.create(nil);
form12.caption:='Добавление "Покупатель"';
form12.showmodal;
end;

procedure TForm11.BitBtn1Click(Sender: TObject);
begin
adoquery1.Edit;
form12:=tform12.create(nil);
form12.showmodal;
end;

procedure TForm11.BitBtn3Click(Sender: TObject);
begin
  try begin
if adoquery1.RecordCount<>0 then
if Application.MessageBox('Вы точно хотите удалить данного покупателя?','Удаление',MB_ICONQUESTION+mb_yesno)=idyes then
  adoquery1.Delete;
  end
except
  Application.MessageBox('Невозможно удалить данного покупателя, так как у него есть покупки!','Ошибка',MB_ICONerror);
  end;
  end;

procedure TForm11.FormCreate(Sender: TObject);
begin
adoquery1.active:=true;
height:=324;

end;

procedure TForm11.btn1Click(Sender: TObject);
begin
if height<>499 then
height:=499
else  height:=324;
end;

procedure TForm11.Button1Click(Sender: TObject);
var s:string;
begin
s:='';
if edit4.Text<>'' then
s:=s+'fam like '''+edit4.text+'%''';

if edit3.Text<>'' then
if s<>'' then
s:=s+' and imya like '''+edit3.text+'%'''
else  s:=s+'imya like '''+edit3.text+'%''';

if edit2.Text<>'' then
if s<>'' then
s:=s+' and otch like '''+edit2.text+'%'''
else  s:=s+'otch like '''+edit2.text+'%''';

if edit1.Text<>'' then
if s<>'' then
s:=s+' and datar>='''+formatdatetime('dd/mm/yyyy',strtodate(edit1.Text))+''''
else s:=s+'datar>='''+formatdatetime('dd/mm/yyyy',strtodate(edit1.Text))+'''';

if edit5.Text<>'' then
if s<>'' then
s:=s+' and datar<='''+formatdatetime('dd/mm/yyyy',strtodate(edit5.Text))+''''
else s:=s+'datar<='''+formatdatetime('dd/mm/yyyy',strtodate(edit5.Text))+'''';
adoquery1.active:=false;
if s<>'' then
adoquery1.SQL.text:='select * from pokupatel where '+s
else  adoquery1.SQL.text:='select * from pokupatel';
adoquery1.active:=true;
end;

procedure TForm11.DateTimePicker1Exit(Sender: TObject);
begin
edit1.Text:=datetostr(datetimepicker1.Date);
datetimepicker1.visible:=false;
end;

procedure TForm11.Edit1Enter(Sender: TObject);
begin
datetimepicker1.visible:=true;
datetimepicker1.SetFocus;
end;

procedure TForm11.Edit5Enter(Sender: TObject);
begin
datetimepicker2.visible:=true;
datetimepicker2.SetFocus;
end;

procedure TForm11.DateTimePicker2Exit(Sender: TObject);
begin
edit5.Text:=datetostr(datetimepicker2.Date);
datetimepicker2.visible:=false;
end;

procedure TForm11.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f1 then
    application.helpcontext(screen.activecontrol.helpcontext);
end;

procedure TForm11.Button2Click(Sender: TObject);
begin
adoquery1.active:=false;
adoquery1.sql.text:='select * from pokupatel';
adoquery1.Active:=true;
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.clear;
end;

end.

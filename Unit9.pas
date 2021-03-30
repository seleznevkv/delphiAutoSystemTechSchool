unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ADODB;

type
  TForm9 = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    dbgrd3: TDBGrid;
    ADOQuery1id_izgot: TAutoIncField;
    ADOQuery1izgot: TWideStringField;
    ADOQuery1strana: TWideStringField;
    ADOQuery1tel: TLargeintField;
    btn1: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses Unit2, Unit10, Unit5, Unit1;

{$R *.dfm}

procedure TForm9.FormCreate(Sender: TObject);
begin
adoquery1.active:=true;
height:=323;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
form5.ADOQuery1.Requery();
end;

procedure TForm9.BitBtn1Click(Sender: TObject);
begin
adoquery1.Edit;
form10:=tform10.create(nil);
form10.showmodal;
end;

procedure TForm9.BitBtn2Click(Sender: TObject);
begin
adoquery1.append;
form10:=tform10.create(nil);
form10.caption:='Добавление "Покупатель"';
form10.showmodal;
end;

procedure TForm9.BitBtn3Click(Sender: TObject);
begin
  try begin
if adoquery1.RecordCount<>0 then
if Application.MessageBox('Вы точно хотите удалить данного изготовителя?','Удаление',MB_ICONQUESTION+mb_yesno)=idyes then
  adoquery1.Delete;
  end
  except
    Application.MessageBox('Невозможно удалить данного изготовителя, так как у него есть товары!','Ошибка',MB_ICONerror);
  end;


end;



procedure TForm9.btn1Click(Sender: TObject);
begin
if height<>441 then
height:=441
else height:=323;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
adoquery1.active:=false;
adoquery1.SQL.Text:='select * from izgotovitel';
adoquery1.active:=true;
edit1.Clear;
edit2.Clear;
edit3.Clear;
end;

procedure TForm9.Button1Click(Sender: TObject);
var s:string;
begin
s:='';
if edit1.Text<>'' then
s:=s+'izgot like '''+edit1.Text+'%''';

if edit2.Text<>'' then
if s<>'' then
s:=s+' and strana like '''+edit2.Text+'%'''
else s:=s+'strana like '''+edit2.Text+'%''';

if edit3.Text<>'' then
if s<>'' then
s:=s+' and tel='+edit3.Text
else s:=s+'tel='+edit3.Text;
adoquery1.Active:=false;
if s<>'' then
adoquery1.SQL.text:='select * from izgotovitel where '+s
else  adoquery1.SQL.text:='select * from izgotovitel';
adoquery1.Active:=true;
end;

procedure TForm9.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if (key=',') or (key='.') then
key:=decimalseparator;
if not (key in ['0'..'9',#8])  then
key:=#0;
end;

procedure TForm9.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f1 then
    application.helpcontext(screen.activecontrol.helpcontext);
end;

end.

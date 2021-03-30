unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls;

type
  TForm12 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBEdit4Enter(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses Unit11, Unit2;

{$R *.dfm}

procedure TForm12.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TForm12.Button1Click(Sender: TObject);
begin
if  dbedit1.Text<>'' then
begin
form11.ADOQuery1.post;
close;
end
else begin
application.MessageBox('Поле "Фамилия" не заполнено!','Ошибка',mb_iconerror+mb_ok);
dbedit1.SetFocus;
end;
end;

procedure TForm12.Button2Click(Sender: TObject);
begin
form11.ADOQuery1.cancel;
close;
end;

procedure TForm12.DBEdit4Enter(Sender: TObject);
begin
if DBEdit4.Text<>'' then begin
datetimepicker1.Date:=StrToDateTime(DBEdit4.Text);
end
else datetimepicker1.Date:=Now;
datetimepicker1.Visible:=true;
datetimepicker1.SetFocus;
end;

procedure TForm12.DateTimePicker1Exit(Sender: TObject);
begin
DBEdit4.Text:=DateToStr(datetimepicker1.Date);
datetimepicker1.Visible:=false;
end;

procedure TForm12.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f1 then
    application.helpcontext(screen.activecontrol.helpcontext);
end;

end.

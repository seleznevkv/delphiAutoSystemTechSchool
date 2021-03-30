unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TForm10 = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses Unit9;

{$R *.dfm}

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TForm10.Button1Click(Sender: TObject);
begin
if  dbedit1.Text<>'' then
begin
form9.ADOQuery1.post;
close;
end
else begin
application.MessageBox('Поле "Изготовитель" не заполнено!','Ошибка',mb_iconerror+mb_ok);
dbedit1.SetFocus;
end;
end;

procedure TForm10.Button2Click(Sender: TObject);
begin
form9.ADOQuery1.cancel;
close;
end;

procedure TForm10.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
if (key=',') or (key='.') then
key:=decimalseparator;
if not (key in ['0'..'9',#8])  then
key:=#0;
end;

procedure TForm10.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f1 then
    application.helpcontext(screen.activecontrol.helpcontext);
end;

end.

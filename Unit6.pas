unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TForm6 = class(TForm)
    lbl1: TLabel;
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit2, Unit1;

{$R *.dfm}

procedure TForm6.btn1Click(Sender: TObject);
begin
if form2.qry1.RecordCount >0 then
if Application.MessageBox('Вы точно хотите удалить данный вид оргтехники?','Удаление',MB_ICONQUESTION+mb_yesno)=idyes then
form2.qry1.Delete;
close;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=caFree;
end;

end.

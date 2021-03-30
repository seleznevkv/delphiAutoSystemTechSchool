unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, ADODB, ComCtrls;

type
  TForm8 = class(TForm)
    lbl1: TLabel;
    dbedtdata_pokup: TDBEdit;
    lbl2: TLabel;
    dbedtvnes_sum: TDBEdit;
    lbl3: TLabel;
    dblkcbbid_pokup: TDBLookupComboBox;
    btn1: TButton;
    lbl4: TLabel;
    dbedtsdacha: TDBEdit;
    btn2: TButton;
    btn3: TButton;
    qry1: TADOQuery;
    ds1: TDataSource;
    dtp1: TDateTimePicker;
    lbl5: TLabel;
    dblkcbbid_tovar: TDBLookupComboBox;
    qry2: TADOQuery;
    ds2: TDataSource;
    btn4: TButton;
    btn5: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtp1Exit(Sender: TObject);
    procedure dbedtdata_pokupEnter(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure dbedtvnes_sumKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit2, Unit11, Unit13, Unit1;

{$R *.dfm}

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin

action:=caFree;
end;

procedure TForm8.btn2Click(Sender: TObject);
begin
if  (dblkcbbid_pokup.Text='') or (dblkcbbid_tovar.Text='') then
Application.MessageBox('Сохранение невозможно! Проверьте заполнены ли след. поля: Покупатель, Товар.','Ошибка',MB_ICONERROR)
else begin
form2.qry3.Post;
Form2.qry3.Requery();
close;
end;
end;

procedure TForm8.btn3Click(Sender: TObject);
begin
Form2.qry3.Cancel;
close;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
qry1.Active:=true;
qry2.active:=true;

end;

procedure TForm8.dtp1Exit(Sender: TObject);
begin
dbedtdata_pokup.Text:=DateToStr(dtp1.Date);
dtp1.Visible:=false;
end;

procedure TForm8.dbedtdata_pokupEnter(Sender: TObject);
begin
if dbedtdata_pokup.Text<>'' then begin
dtp1.Date:=StrToDateTime(dbedtdata_pokup.Text);
end
else dtp1.Date:=Now;
dtp1.Visible:=true;
dtp1.SetFocus;
end;

procedure TForm8.btn1Click(Sender: TObject);
begin
form11:=tform11.create(nil);
form11.showmodal;
end;

procedure TForm8.btn4Click(Sender: TObject);
begin
if  (dblkcbbid_pokup.Text='') or (dblkcbbid_tovar.Text='') then
Application.MessageBox('Сохранение невозможно! Проверьте заполнены ли след. поля: Покупатель, Товар.','Ошибка',MB_ICONERROR)
else begin
form13.qry7.Post;
Form13.qry7.Requery();
close;
end;
end;

procedure TForm8.btn5Click(Sender: TObject);
begin
Form13.qry7.Cancel;
close;
end;

procedure TForm8.dbedtvnes_sumKeyPress(Sender: TObject; var Key: Char);
begin
if (key=',') or (key='.') then
key:=decimalseparator;
if not (key in ['0'..'9',',','-',#8])
or ((key=',') and (pos(',',dbedtvnes_sum.Text)>0))
or ((key='-') and (dbedtvnes_sum.SelStart>0)) then
key:=#0;
end;

procedure TForm8.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f1 then
    application.helpcontext(screen.activecontrol.helpcontext);
end;

end.

unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Mask, ExtDlgs, ComCtrls, DB, ADODB;

type
  TForm5 = class(TForm)
    lbl1: TLabel;
    dbedtmodel: TDBEdit;
    lbl2: TLabel;
    dbedtdata_izg: TDBEdit;
    lbl3: TLabel;
    dbedtcena: TDBEdit;
    lbl4: TLabel;
    dbimgphoto: TDBImage;
    btn1: TBitBtn;
    btn2: TBitBtn;
    lbl5: TLabel;
    btn3: TButton;
    btn4: TButton;
    dlgOpenPic1: TOpenPictureDialog;
    dtp1: TDateTimePicker;
    dblkcbbid_izgot: TDBLookupComboBox;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    btn5: TButton;
    lbl6: TLabel;
    dblkcbbid_vid: TDBLookupComboBox;
    qry1: TADOQuery;
    ds1: TDataSource;
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbedtdata_izgEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtp1Exit(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure dbedtcenaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit2, Unit9, Unit1;

{$R *.dfm}

procedure TForm5.btn3Click(Sender: TObject);
var i:integer;
begin
if  (dbedtmodel.Text ='') or (dblkcbbid_izgot.Text='') or (dblkcbbid_vid.Text='') then
Application.MessageBox('Сохранение невозможно! Проверьте заполнены ли след. поля: Изготовитель, Вид оргтехники, модель.','Ошибка',MB_ICONERROR)
else begin
Form2.qry2.Post;
i:=form2.qry2.fieldbyname('id_tovar').asinteger;
form2.qry1.Locate('id_vid',form2.qry2.fieldbyname('id_vid').AsInteger,[]);
Form2.qry2.Requery();
form2.qry2.Locate('id_tovar',i,[]);
form2.fcDBTreeView1.SetFocus;
form2.fcDBTreeView1.Expand(form2.fcDBTreeView1.ActiveNode);
close;
end;
end;

procedure TForm5.btn4Click(Sender: TObject);
begin
Form2.qry2.Cancel;
close;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TForm5.btn1Click(Sender: TObject);
begin
if dlgopenpic1.Execute then
dbimgphoto.Picture.LoadFromFile(dlgopenpic1.FileName);
end;

procedure TForm5.btn2Click(Sender: TObject);
begin
 dbimgphoto.Picture:=nil;
end;

procedure TForm5.dbedtdata_izgEnter(Sender: TObject);
begin
if dbedtdata_izg.Text<>'' then begin
dtp1.Date:=StrToDateTime(dbedtdata_izg.Text);
end
else dtp1.Date:=Now;
dtp1.Visible:=true;
dtp1.SetFocus;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
adoquery1.Active:=true;
qry1.active:=True;
end;

procedure TForm5.dtp1Exit(Sender: TObject);
begin
dbedtdata_izg.Text:=DateToStr(dtp1.Date);
dtp1.Visible:=false;
end;

procedure TForm5.btn5Click(Sender: TObject);
begin
form9:=tform9.create(nil);
form9.showmodal;
end;

procedure TForm5.dbedtcenaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=',') or (key='.') then
key:=decimalseparator;
if not (key in ['0'..'9',',','-',#8])
or ((key=',') and (pos(',',dbedtcena.Text)>0))
or ((key='-') and (dbedtcena.SelStart>0)) then
key:=#0;
end;

procedure TForm5.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f1 then
    application.helpcontext(screen.activecontrol.helpcontext);
end;

end.

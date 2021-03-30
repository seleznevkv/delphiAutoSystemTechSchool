unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, ImgList, StdCtrls, Buttons, DBCtrls,
  ExtCtrls, fcdbtreeview;

type
  TForm2 = class(TForm)
    grp1: TGroupBox;
    qry1: TADOQuery;
    qry1id_vid: TAutoIncField;
    qry1vid: TWideStringField;
    ds1: TDataSource;
    qry2: TADOQuery;
    qry2id_tovar: TAutoIncField;
    qry2id_vid: TIntegerField;
    qry2izgot: TWideStringField;
    qry2model: TWideStringField;
    qry2id_izgot: TIntegerField;
    qry2data_izg: TDateTimeField;
    qry2cena: TBCDField;
    qry2photo: TBlobField;
    qry2id_izgot_1: TAutoIncField;
    qry2strana: TWideStringField;
    qry2tel: TLargeintField;
    ds2: TDataSource;
    qry3: TADOQuery;
    ds3: TDataSource;
    qry3id: TAutoIncField;
    qry3id_tovar: TIntegerField;
    qry3id_pokup: TIntegerField;
    qry3data_pokup: TDateTimeField;
    qry3vnes_sum: TBCDField;
    qry3id_pokup_1: TAutoIncField;
    qry3fam: TWideStringField;
    qry3imya: TWideStringField;
    qry3otch: TWideStringField;
    qry3datar: TDateTimeField;
    fcDBTreeView1: TfcDBTreeView;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    dbgrd3: TDBGrid;
    qry3sdacha: TFloatField;
    ADOQuery1: TADOQuery;
    grp2: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    grp3: TGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    qry4: TADOQuery;
    qry5: TADOQuery;
    btn1: TBitBtn;
    qry1kol: TIntegerField;
    pnl1: TPanel;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    qry6: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure qry1AfterScroll(DataSet: TDataSet);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure qry3CalcFields(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure fcDBTreeView1CalcNodeAttributes(
      TreeView: TfcDBCustomTreeView; Node: TfcDBTreeNode);
    procedure FormShow(Sender: TObject);
    procedure fcDBTreeView1Change(TreeView: TfcDBCustomTreeView;
      Node: TfcDBTreeNode);
    procedure btn3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
      procedure schet;
    procedure qry1AfterDelete(DataSet: TDataSet);
    procedure qry1AfterInsert(DataSet: TDataSet);
    procedure qry2AfterInsert(DataSet: TDataSet);
    procedure qry2AfterPost(DataSet: TDataSet);
    procedure qry2AfterDelete(DataSet: TDataSet);
    procedure qry3AfterDelete(DataSet: TDataSet);
    procedure qry3AfterInsert(DataSet: TDataSet);
    procedure qry3AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2; s:string;   b:integer=0;

implementation

uses
  Unit1, Unit4, Unit5, Unit7, Unit6, Unit8, Unit13, Unit15;

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=caFree;
newwindow:=newwindow-1;
form1.con1.Connected:=false;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
    qry1.active:=True;
        fcDBTreeView1.Expand(fcDBTreeView1.ActiveNode);
     {  qry2.Active:=false;
       qry2.Parameters.ParamByName('id_vid').value:=qry1.fieldbyname('id_vid').value;
       qry2.Active:=True;   }
end;

procedure TForm2.qry1AfterScroll(DataSet: TDataSet);
begin
qry2.Active:=false;
qry2.Parameters.ParamByName('id_vid').value:=qry1.fieldbyname('id_vid').value;
qry2.Active:=True;


end;

procedure TForm2.btn2Click(Sender: TObject);
begin
if fcDBTreeView1.ActiveDataSet=qry1 then begin
qry1.edit;
Form4:=TForm4.Create(nil);
form4.ShowModal; end
else  begin
qry2.edit;
Form5:=TForm5.Create(nil);
form5.ShowModal; end
end;

procedure TForm2.btn4Click(Sender: TObject);
begin
  if fcDBTreeView1.ActiveDataSet=qry1 then
  if form2.qry1.RecordCount >0 then
  if Application.MessageBox('Вы точно хотите удалить данный вид оргтехники?','Удаление',MB_ICONQUESTION+mb_yesno)=idyes then
 begin form2.qry1.Delete;
  //qry1.Requery();
  end;
  if fcDBTreeView1.ActiveDataSet=qry2 then
   if Application.MessageBox('Вы точно хотите удалить данный товар?','Удаление',MB_ICONQUESTION+mb_yesno)=idyes then
begin
//qry2.edit;
qry6.Parameters.ParamByName('id_tovar').Value:=form2.qry2.fieldbyname('id_tovar').Value;
qry6.ExecSQL;
//qry2.Post;
qry2.Requery();

end;
fcDBTreeView1Change(fcDBTreeView1,fcDBTreeView1.ActiveNode);

end;

procedure TForm2.btn6Click(Sender: TObject);
begin
qry2.Edit;
form5:=tform5.create(nil);
form5.showmodal;
end;

procedure TForm2.btn7Click(Sender: TObject);
begin
qry2.Append;
form5:=tform5.create(nil);
form5.showmodal;
end;

procedure TForm2.btn8Click(Sender: TObject);
begin
if qry2.RecordCount >0 then
if Application.MessageBox('Вы точно хотите удалить данный товар?','Удаление',MB_ICONQUESTION+mb_yesno)=idyes then
qry2.Delete;
end;

procedure TForm2.qry3CalcFields(DataSet: TDataSet);
begin
if  (qry3.fieldbyname('vnes_sum').asstring<>'') and (qry2.fieldbyname('cena').asstring<>'') then
qry3.FieldByName('sdacha').value:=FloatToStr(StrToFloat(qry3.fieldbyname('vnes_sum').Value)-StrToFloat(qry2.fieldbyname('cena').value));
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
qry3.Edit;
b:=1;


form8:=TForm8.Create(nil);

Form8.ShowModal;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
qry3.Append;
form8:=TForm8.Create(nil);
form8.qry2.active:=false;
form8.qry2.SQL.Text:='select tovary.id_tovar, (izgotovitel.izgot+'' ''+ tovary.model) as proizvtov from izgotovitel inner join tovary on izgotovitel.id_izgot=tovary.id_izgot inner join vidy on tovary.id_vid=vidy.id_vid where vidy.id_vid='+qry1.fieldbyname('id_vid').asstring;
Form8.Caption:='Добавление "Покупки"';
form8.qry2.active:=true;
Form8.ShowModal;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
if Application.MessageBox('Вы точно хотите удалить данную покупку?','Удаление',MB_ICONQUESTION+mb_yesno)=idyes then
begin
qry3.edit;
adoquery1.Parameters.ParamByName('id').Value:=qry3.fieldbyname('id').Value;
adoquery1.ExecSQL;
qry3.Post;
end;
qry3.Requery();
end;


procedure TForm2.btn1Click(Sender: TObject);
begin
form13:=tform13.create(nil);
form13.showmodal;
end;

procedure TForm2.fcDBTreeView1CalcNodeAttributes(
  TreeView: TfcDBCustomTreeView; Node: TfcDBTreeNode);
begin
if node.DataSet =qry1 then
    begin
        //если в этой записи поле kol_stud>0 (есть студенты)
        if node.DataSet.FieldByName('kol').AsInteger>0 then
        begin
            //возле узла отображаем кнопку "+"
            node.HasChildren:=true;
            //отображаем первую иконку из коллекции
            node.StateIndex:=0;
        end
        //если поле kol_stud=0 (нет студентов)
        else
        begin
            //кнопка "+" не отображается
            node.HasChildren:=false;
            //отображаем вторую иконку из коллекции
            node.StateIndex:= 1;
        end;
    end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
    fcDBTreeView1.SetFocus;
    fcDBTreeView1.Expand(fcDBTreeView1.ActiveNode);
end;

procedure TForm2.fcDBTreeView1Change(TreeView: TfcDBCustomTreeView;
  Node: TfcDBTreeNode);
begin
qry3.Active:=false;
qry5.Active:=false;
if fcDBTreeView1.ActiveDataSet=qry1 then  begin
qry3.SQL.Text:='select pokupki.*, pokupatel.* from pokupatel inner join pokupki on pokupatel.id_pokup=pokupki.id_pokup inner join tovary on tovary.id_tovar=pokupki.id_tovar where id_vid='+qry1.fieldbyname('id_vid').AsString ;
qry5.sql.Text:='select count(id) as kol, round(sum(vnes_sum),2) as summa from pokupki inner join tovary on pokupki.id_tovar=tovary.id_tovar inner join vidy on tovary.id_vid=vidy.id_vid where vidy.id_vid='+qry1.fieldbyname('id_vid').AsString;
end
else begin
qry3.sql.text:='select pokupki.*, pokupatel.* from pokupatel inner join pokupki on pokupatel.id_pokup=pokupki.id_pokup where id_tovar='+qry2.fieldbyname('id_tovar').AsString;qry3.Active:=true;
qry5.sql.Text:='select count(id) as kol, round(sum(vnes_sum),2) as summa from pokupki where id_tovar='+qry2.fieldbyname('id_tovar').AsString;
end;
qry3.Active:=true;
qry5.Active:=true;
schet;
end;

procedure TForm2.btn3Click(Sender: TObject);
begin
form7:=tform7.create(nil);
Form7.Label1.Caption:= 'Выберите запись для добавления';
Form7.Caption:='Выбор добавления';
form7.showmodal;
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f1 then
    application.helpcontext(screen.activecontrol.helpcontext);
end;

procedure tform2.schet;
begin
qry4.Active:=false;
qry4.Active:=true;
qry5.Requery();
lbl5.Caption:='Число покупок:                 '+qry5.fieldbyname('kol').AsString;
lbl6.Caption:='Общая внесенная сумма: '+qry5.fieldbyname('summa').AsString;
lbl1.Caption:='Общее число товаров: '+qry4.fieldbyname('ko').AsString;
lbl2.Caption:='Максимальная цена:     '+qry4.fieldbyname('maxcena').AsString;
lbl3.Caption:='Минимальная цена:       '+qry4.fieldbyname('mincena').AsString;
lbl4.Caption:='Средняя цена:              '+qry4.fieldbyname('srcena').AsString;


end;

procedure TForm2.qry1AfterDelete(DataSet: TDataSet);
begin
schet;
end;

procedure TForm2.qry1AfterInsert(DataSet: TDataSet);
begin
schet;
end;

procedure TForm2.qry2AfterInsert(DataSet: TDataSet);
begin
schet;
end;

procedure TForm2.qry2AfterPost(DataSet: TDataSet);
begin
schet;
end;

procedure TForm2.qry2AfterDelete(DataSet: TDataSet);
begin
schet;
end;

procedure TForm2.qry3AfterDelete(DataSet: TDataSet);
begin
schet;
end;

procedure TForm2.qry3AfterInsert(DataSet: TDataSet);
begin

schet;
end;

procedure TForm2.qry3AfterPost(DataSet: TDataSet);
begin
schet;
end;

end.

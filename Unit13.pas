unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, Buttons, ExtCtrls, DBCtrls,
  ComCtrls,comobj;

type
  TForm13 = class(TForm)
    grp1: TGroupBox;
    edt1: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    edt2: TEdit;
    edt3: TEdit;
    btn1: TButton;
    btn2: TButton;
    grp3: TGroupBox;
    pnl1: TPanel;
    btn3: TBitBtn;
    btn5: TBitBtn;
    dbgrd3: TDBGrid;
    grp2: TGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl10: TLabel;
    edt5: TEdit;
    edt6: TEdit;
    edt7: TEdit;
    edt10: TEdit;
    qry7: TADOQuery;
    ds4: TDataSource;
    qry7id_pokup: TAutoIncField;
    qry7fam: TWideStringField;
    qry7imya: TWideStringField;
    qry7otch: TWideStringField;
    qry7datar: TDateTimeField;
    qry7id: TAutoIncField;
    qry7id_tovar: TIntegerField;
    qry7id_pokup_1: TIntegerField;
    qry7data_pokup: TDateTimeField;
    qry7vnes_sum: TBCDField;
    lbl3: TLabel;
    qry7izgtov: TWideStringField;
    qry7cena: TBCDField;
    lbl8: TLabel;
    edt4: TEdit;
    qry1: TADOQuery;
    ds1: TDataSource;
    lbl9: TLabel;
    edt8: TEdit;
    edt9: TEdit;
    dblkcbbid_tovar: TDBLookupComboBox;
    qry7sdacha: TFloatField;
    qry2: TADOQuery;
    lbl11: TLabel;
    edt11: TEdit;
    qry7vid: TWideStringField;
    qry3: TADOQuery;
    ds2: TDataSource;
    dblkcbb1: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    qry3id_vid: TAutoIncField;
    qry3vid: TWideStringField;
    qry3kol: TIntegerField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt9Enter(Sender: TObject);
    procedure dblkcbbid_tovarExit(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure qry7CalcFields(DataSet: TDataSet);
    procedure btn5Click(Sender: TObject);
    procedure dblkcbb1Exit(Sender: TObject);
    procedure edt11Enter(Sender: TObject);
    procedure edt6Enter(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure edt7Enter(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure dblkcbbid_tovarDropDown(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure edt4KeyPress(Sender: TObject; var Key: Char);
    procedure edt5KeyPress(Sender: TObject; var Key: Char);
    procedure edt8KeyPress(Sender: TObject; var Key: Char);
    procedure edt10KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;   w,e:variant;

implementation

uses
  Unit2, Unit1, Unit8;

{$R *.dfm}

procedure TForm13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
  Form2.qry3.Requery();
  except
  end;
  action:=caFree;
end;

procedure TForm13.btn2Click(Sender: TObject);

begin
edt1.Clear;
edt2.Clear;
edt3.Clear;
edt4.Clear;
edt5.Clear;
edt6.Clear;
edt7.Clear;
edt8.Clear;
edt9.Clear;
edt10.Clear;
edt11.Clear;
dblkcbb1.Update;
dblkcbbid_tovar.update;

  qry7.Active:=False;
qry7.SQL.Text:='select pokupatel.*,pokupki.*,tovary.cena,(izgotovitel.izgot+'' ''+tovary.model) as izgtov,vid '+
'from pokupatel inner join pokupki on pokupatel.id_pokup=pokupki.id_pokup '+
'inner join tovary on pokupki.id_tovar=tovary.id_tovar '+
'inner join izgotovitel on tovary.id_izgot=izgotovitel.id_izgot '+
'inner join vidy on tovary.id_vid=vidy.id_vid';
qry7.Active:=true;

end;

procedure TForm13.btn1Click(Sender: TObject);
var s:string;
begin
s:='';
if edt1.Text<>'' then
s:=s+'pokupatel.fam like '''+edt1.Text+'%''';

if edt2.Text<>'' then
if s<>'' then
s:=s+' and pokupatel.imya like '''+edt2.Text+'%'''
else  s:=s+'pokupatel.imya like '''+edt2.Text+'%''';

if edt3.Text<>'' then
if s<>'' then
s:=s+' and pokupatel.otch like '''+edt3.Text+'%'''
else  s:=s+'pokupatel.otch like '''+edt3.Text+'%''';

if edt5.Text<>'' then
if s<>'' then
s:=s+' and pokupki.vnes_sum>='+edt5.Text
else s:=s+'pokupki.vnes_sum>='+edt5.Text;

if edt10.Text<>'' then
if s<>'' then
s:=s+' and pokupki.vnes_sum<='+edt10.Text
else s:=s+'pokupki.vnes_sum<='+edt10.Text;

if edt4.Text<>'' then
if s<>'' then
s:=s+' and tovary.cena>='+edt4.Text
else s:=s+'tovary.cena>='+edt4.Text;

if edt8.Text<>'' then
if s<>'' then
s:=s+' and tovary.cena<='+edt8.Text
else s:=s+'tovary.cena<='+edt8.Text;

if edt9.Text<>'' then
if s<>'' then
s:=s+' and (izgotovitel.izgot+'' ''+tovary.model)='''+edt9.Text+''''
else s:=s+'(izgotovitel.izgot+'' ''+tovary.model)='''+edt9.Text+'''';

if edt6.Text<>'' then
if s<>'' then
s:=s+' and pokupki.data_pokup>='''+formatdatetime('dd/mm/yyyy',strtodate(edt6.Text))+''''
else s:='pokupki.data_pokup>='''+formatdatetime('dd/mm/yyyy',strtodate(edt6.Text))+'''';

if edt7.Text<>'' then
if s<>'' then
s:=s+' and pokupki.data_pokup<='''+formatdatetime('dd/mm/yyyy',strtodate(edt7.Text))+''''
else s:='pokupki.data_pokup<='''+formatdatetime('dd/mm/yyyy',strtodate(edt7.Text))+'''';

if edt11.Text<>'' then
if s<>'' then
s:=s+' and vid='''+edt11.Text+''''
else s:=s+'vid='''+edt11.Text+'''';

qry7.active:=False;
if s<>'' then
qry7.SQL.Text:='select pokupatel.*,pokupki.*,tovary.cena,(izgotovitel.izgot+'' ''+tovary.model) as izgtov,vid '+
'from pokupatel inner join pokupki on pokupatel.id_pokup=pokupki.id_pokup '+
'inner join tovary on pokupki.id_tovar=tovary.id_tovar '+
'inner join izgotovitel on tovary.id_izgot=izgotovitel.id_izgot '+
'inner join vidy on tovary.id_vid=vidy.id_vid'+' where '+s
else
qry7.SQL.Text:='select pokupatel.*,pokupki.*,tovary.cena,(izgotovitel.izgot+'' ''+tovary.model) as izgtov,vid '+
'from pokupatel inner join pokupki on pokupatel.id_pokup=pokupki.id_pokup '+
'inner join tovary on pokupki.id_tovar=tovary.id_tovar '+
'inner join izgotovitel on tovary.id_izgot=izgotovitel.id_izgot '+
'inner join vidy on tovary.id_vid=vidy.id_vid';
qry7.Active:=true;
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
qry7.Active:=true;


qry1.Active:=true;
qry3.Active:=true;
end;

procedure TForm13.edt9Enter(Sender: TObject);
begin
dblkcbbid_tovar.Visible:=True;
dblkcbbid_tovar.SetFocus;
end;

procedure TForm13.dblkcbbid_tovarExit(Sender: TObject);
begin
edt9.text:=dblkcbbid_tovar.Text;
dblkcbbid_tovar.Visible:=false;
end;

procedure TForm13.btn3Click(Sender: TObject);
begin
qry7.Edit;
b:=0;

form8:=tform8.create(nil);
//Form8.qry1.Active:=false;
//Form8.qry2.Active:=false;
form8.dbedtdata_pokup.DataSource:=Form13.ds4;
Form8.dbedtvnes_sum.DataSource:=Form13.ds4;
Form8.dblkcbbid_pokup.DataSource:=Form13.ds4;
Form8.dblkcbbid_pokup.DataField:='id_pokup_1';
Form8.dblkcbbid_tovar.DataSource:=Form13.ds4;

Form8.dblkcbbid_tovar.DataField:='id_tovar';

Form8.dbedtsdacha.DataSource:=Form13.ds4;
Form8.btn4.Visible:=true;
Form8.btn5.Visible:=true;

form8.showmodal;

end;

procedure TForm13.qry7CalcFields(DataSet: TDataSet);
begin
qry7.FieldByName('sdacha').value:=FloatToStr(StrToFloat(qry7.fieldbyname('vnes_sum').Value)-StrToFloat(qry7.fieldbyname('cena').value));
end;

procedure TForm13.btn5Click(Sender: TObject);
begin
if Application.MessageBox('Вы точно хотите удалить данную покупку?','Удаление',MB_ICONQUESTION+mb_yesno)=idyes then
begin
  qry7.edit;
qry2.Parameters.ParamByName('id').Value:=qry7.fieldbyname('id').Value;
qry2.ExecSQL;
qry7.Post;
end;
qry7.Requery();

end;

procedure TForm13.dblkcbb1Exit(Sender: TObject);
begin
edt11.Text:=dblkcbb1.Text;
dblkcbb1.Visible:=false;
end;

procedure TForm13.edt11Enter(Sender: TObject);
begin
dblkcbb1.Visible:=True;
dblkcbb1.SetFocus;
end;

procedure TForm13.edt6Enter(Sender: TObject);
begin
datetimepicker1.Visible:=true;
datetimepicker1.SetFocus;
end;

procedure TForm13.DateTimePicker2Exit(Sender: TObject);
begin
edt7.Text:=DateToStr(datetimepicker2.Date);
datetimepicker2.Visible:=false;
end;

procedure TForm13.edt7Enter(Sender: TObject);
begin
datetimepicker2.Visible:=true;
datetimepicker2.SetFocus;
end;

procedure TForm13.DateTimePicker1Exit(Sender: TObject);
begin
edt6.Text:=DateToStr(datetimepicker1.Date);
datetimepicker1.Visible:=false;
end;

procedure TForm13.dblkcbbid_tovarDropDown(Sender: TObject);
begin
if edt11.Text<>'' then begin
qry1.Active:=false;

qry1.SQL.Text:='select tovary.id_tovar,tovary.id_vid, (izgotovitel.izgot+'' ''+ tovary.model) as proizvtov from izgotovitel inner join tovary on izgotovitel.id_izgot=tovary.id_izgot where id_vid='+qry3.fieldbyname('id_vid').asstring;
qry1.Active:=true; end
else
begin
qry1.Active:=false;

qry1.SQL.Text:='select tovary.id_tovar,tovary.id_vid, (izgotovitel.izgot+'' ''+ tovary.model) as proizvtov from izgotovitel inner join tovary on izgotovitel.id_izgot=tovary.id_izgot';
qry1.Active:=true; end;
end;

procedure TForm13.BitBtn1Click(Sender: TObject);
begin
try
w:=getactiveoleobject('Word.Application');
except
w:=createoleobject('Word.Application');
end;
w.documents.add(extractfilepath(application.exename)+'\templates\check.dot');
w.selection.find.text:='#tovar#';
w.selection.find.replacement.text:=qry7.FieldByName('izgtov').AsString;
w.selection.find.execute(replace:=2);

w.selection.find.text:='#fam#';
w.selection.find.replacement.text:=qry7.FieldByName('fam').AsString;
w.selection.find.execute(replace:=2);

w.selection.find.text:='#imya#';
w.selection.find.replacement.text:=qry7.FieldByName('imya').AsString;
w.selection.find.execute(replace:=2);

w.selection.find.text:='#otch#';
w.selection.find.replacement.text:=qry7.FieldByName('otch').AsString;
w.selection.find.execute(replace:=2);

w.selection.find.text:='#cena#';
w.selection.find.replacement.text:=qry7.FieldByName('cena').AsString;
w.selection.find.execute(replace:=2);

w.selection.find.text:='#vnes_sum#';
w.selection.find.replacement.text:=qry7.FieldByName('vnes_sum').AsString;
w.selection.find.execute(replace:=2);

w.selection.find.text:='#sdacha#';
w.selection.find.replacement.text:=qry7.FieldByName('sdacha').AsString;
w.selection.find.execute(replace:=2);

w.selection.find.text:='#data#';
w.selection.find.replacement.text:=qry7.FieldByName('data_pokup').AsString;
w.selection.find.execute(replace:=2);
w.visible:=true;
end;

procedure TForm13.BitBtn2Click(Sender: TObject);
var i:integer;
begin
 try
w:=getactiveoleobject('Word.Application');
except
w:=createoleobject('Word.Application');
end;
w.documents.add(extractfilepath(application.exename)+'\templates\list.dot');
i:=2;
qry7.First;
while not qry7.Eof do  begin
w.activedocument.tables.item(1).rows.add;
w.activedocument.tables.item(1).cell(i,1).range.text:=inttostr(i-1);
w.activedocument.tables.item(1).cell(i,2).range.text:=qry7.fieldbyname('izgtov').AsString;
w.activedocument.tables.item(1).cell(i,3).range.text:=qry7.fieldbyname('data_pokup').AsString;
w.activedocument.tables.item(1).cell(i,4).range.text:=qry7.fieldbyname('cena').AsString;
w.activedocument.tables.item(1).cell(i,5).range.text:=qry7.fieldbyname('fam').AsString;
w.activedocument.tables.item(1).cell(i,6).range.text:=qry7.fieldbyname('imya').AsString;
w.activedocument.tables.item(1).cell(i,7).range.text:=qry7.fieldbyname('otch').AsString;
qry7.next;
i:=i+1;
end;
w.visible:=true;
end;

procedure TForm13.BitBtn3Click(Sender: TObject);
begin
try
e:=getactiveoleobject('Excel.Application');
except
e:=createoleobject('Excel.Application');
end;
e.workbooks.add(extractfilepath(application.exename)+'\templates\anketa.xlt');
e.activeworkbook.sheets.item[1].cells.replace(what:='#tovar#',replacement:=qry7.FieldByName('izgtov').AsString);
e.activeworkbook.sheets.item[1].cells.replace(what:='#cena#',replacement:=qry7.FieldByName('cena').AsString);
e.activeworkbook.sheets.item[1].cells.replace(what:='#vnes#',replacement:=qry7.FieldByName('vnes_sum').AsString);
e.activeworkbook.sheets.item[1].cells.replace(what:='#sdacha#',replacement:=qry7.FieldByName('sdacha').AsString);
e.activeworkbook.sheets.item[1].cells.replace(what:='#fam#',replacement:=qry7.FieldByName('fam').AsString);
e.activeworkbook.sheets.item[1].cells.replace(what:='#imya#',replacement:=qry7.FieldByName('imya').AsString);
e.activeworkbook.sheets.item[1].cells.replace(what:='#otch#',replacement:=qry7.FieldByName('otch').AsString);
e.activeworkbook.sheets.item[1].cells.replace(what:='#data#',replacement:=qry7.FieldByName('data_pokup').AsString);



e.visible:=true;


end;

procedure TForm13.BitBtn4Click(Sender: TObject);
var i:integer;
begin
try
e:=getactiveoleobject('Excel.Application');
except
e:=createoleobject('Excel.Application');
end;
e.workbooks.add(extractfilepath(application.exename)+'\templates\list.xlt');
i:=2;
qry7.First;
while not qry7.Eof do begin
e.activeworkbook.sheets.item[1].cells[i,1].value:=inttostr(i-1);
e.activeworkbook.sheets.item[1].cells[i,2].value:=qry7.fieldbyname('izgtov').asstring;
e.activeworkbook.sheets.item[1].cells[i,3].value:=qry7.fieldbyname('data_pokup').asstring;
e.activeworkbook.sheets.item[1].cells[i,4].value:=qry7.fieldbyname('cena').asstring;
e.activeworkbook.sheets.item[1].cells[i,5].value:=qry7.fieldbyname('vnes_sum').asstring;
e.activeworkbook.sheets.item[1].cells[i,6].value:=qry7.fieldbyname('fam').asstring;
e.activeworkbook.sheets.item[1].cells[i,7].value:=qry7.fieldbyname('imya').asstring;
e.activeworkbook.sheets.item[1].cells[i,8].value:=qry7.fieldbyname('otch').asstring;
qry7.Next;
i:=i+1;
end;
i:=i-1;
e.activeworkbook.sheets.item[1].range['A1:H'+inttostr(i)].borders.weight:=2;
e.activeworkbook.sheets.item[1].range['A1:H'+inttostr(i)].borders.linestyle:=1;

e.visible:=true;
end;

procedure TForm13.edt4KeyPress(Sender: TObject; var Key: Char);
begin
if (key=',') or (key='.') then
key:=decimalseparator;
if not (key in ['0'..'9',',','-',#8])
or ((key=',') and (pos(',',edt4.Text)>0))
or ((key='-') and (edt4.SelStart>0)) then
key:=#0;
end;

procedure TForm13.edt5KeyPress(Sender: TObject; var Key: Char);
begin
if (key=',') or (key='.') then
key:=decimalseparator;
if not (key in ['0'..'9',',','-',#8])
or ((key=',') and (pos(',',edt5.Text)>0))
or ((key='-') and (edt5.SelStart>0)) then
key:=#0;
end;

procedure TForm13.edt8KeyPress(Sender: TObject; var Key: Char);
begin
if (key=',') or (key='.') then
key:=decimalseparator;
if not (key in ['0'..'9',',','-',#8])
or ((key=',') and (pos(',',edt8.Text)>0))
or ((key='-') and (edt8.SelStart>0)) then
key:=#0;
end;

procedure TForm13.edt10KeyPress(Sender: TObject; var Key: Char);
begin
if (key=',') or (key='.') then
key:=decimalseparator;
if not (key in ['0'..'9',',','-',#8])
or ((key=',') and (pos(',',edt10.Text)>0))
or ((key='-') and (edt10.SelStart>0)) then
key:=#0;
end;

procedure TForm13.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f1 then
    application.helpcontext(screen.activecontrol.helpcontext);
end;

end.

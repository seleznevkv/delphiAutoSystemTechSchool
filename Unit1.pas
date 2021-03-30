unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ExtCtrls, MDIPanel, fcStatusBar,inifiles,stohtmlhelp;

type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    con1: TADOConnection;
    N3: TMenuItem;
    fcStatusBar1: TfcStatusBar;
    MDIPanel1: TMDIPanel;
    N11: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;   newwindow:Integer=0;  s:string;

implementation

uses Unit2, Unit15, Unit13;

{$R *.dfm}

procedure TForm1.N2Click(Sender: TObject);
begin
  if newwindow=0 then begin
form2:=tform2.create(nil);
form2.show;
newwindow:=newwindow+1;end
else Application.MessageBox('Окно уже открыто!','Ошибка',mb_iconerror+mb_ok);
end;


procedure TForm1.N10Click(Sender: TObject);
begin
close;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
cascade;

end;

procedure TForm1.N7Click(Sender: TObject);
begin
tilemode:=tbVertical;
tile;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
tilemode:=tbHorizontal;
tile;
end;

procedure TForm1.N3Click(Sender: TObject);
begin

form13:=tform13.create(nil);
form13.showmodal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
con1.Connected:=false;
    if port<>'' then
    con1.ConnectionString:='Provider=SQLOLEDB.1;Password='+password+';Persist Security Info=True;User ID='+login+';Initial Catalog=orgtovary;Data Source='+server+','+port
    else
    con1.ConnectionString:='Provider=SQLOLEDB.1;Password='+password+';Persist Security Info=True;User ID='+login+';Initial Catalog=orgtovary;Data Source='+server;
    try  
        con1.Connected:=true;

    except
        begin
            Application.MessageBox('Неверные регистрационные данные',
                                   'Ошибка подключения',MB_OK+MB_IconError);
            ExitProcess(0);
        end;
    end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var ini:tinifile;
begin
ini:=tinifile.create(extractfilepath(application.exename)+'settings.ini');
ini.writestring('User','Login',login);
ini.writestring('Server','Serv',server);
ini.writestring('Server','Port',port);
ini.Free;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
application.helpcommand(help_contents, 0);
end;

end.

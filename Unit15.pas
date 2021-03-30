unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,inifiles;

type
  TForm15 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;
  login, password, server, port:string;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm15.Button1Click(Sender: TObject);
begin
login:=edit1.text;
password:=edit2.text;
server:=edit3.text;
port:=edit4.text;

close;


end;

procedure TForm15.Button2Click(Sender: TObject);
begin
exitprocess(0);
end;

procedure TForm15.FormCreate(Sender: TObject);
var ini:tinifile;
begin
ini:=tinifile.create(extractfilepath(application.exename)+'settings.ini');
edit1.Text:=ini.readstring('User','Login','');
edit3.Text:=ini.readstring('Server','Serv','');
edit4.text:=ini.readstring('Server','Port','');
ini.Free;

end;

end.

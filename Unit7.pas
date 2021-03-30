unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm7 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit2, Unit4, Unit5;

{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
begin
form2.qry1.append;
close;
form4:=tform4.create(nil);
form4.showmodal;

end;

procedure TForm7.Button2Click(Sender: TObject);
begin
 form2.qry2.append;
 close;
form5:=tform5.create(nil);
form5.showmodal;


end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

end.

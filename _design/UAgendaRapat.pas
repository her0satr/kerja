unit UAgendaRapat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TFAgendaRapat = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Button5: TButton;
    Memo1: TMemo;
    Label8: TLabel;
    Label10: TLabel;
    Button6: TButton;
    Label9: TLabel;
    Edit8: TEdit;
    Label11: TLabel;
    Edit9: TEdit;
    Label12: TLabel;
    Edit10: TEdit;
    Label13: TLabel;
    Edit11: TEdit;
    Label14: TLabel;
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAgendaRapat: TFAgendaRapat;

implementation

uses UDaftarUnd;

{$R *.dfm}

procedure TFAgendaRapat.Button5Click(Sender: TObject);
begin
  FDaftarUnd.Show;
end;

end.

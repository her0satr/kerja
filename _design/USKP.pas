unit USKP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TFSKP = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSKP: TFSKP;

implementation

uses UDataSKP, UKegLain;

{$R *.dfm}

procedure TFSKP.Button2Click(Sender: TObject);
begin
  FDataSKP.show;
end;

procedure TFSKP.Button1Click(Sender: TObject);
begin
  FKegLain.Show;
end;

end.

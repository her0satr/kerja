unit UAbsensi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TFAbsensi = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    Button2: TButton;
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    RadioGroup2: TRadioGroup;
    Memo2: TMemo;
    Label3: TLabel;
    Button3: TButton;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAbsensi: TFAbsensi;

implementation

{$R *.dfm}

end.

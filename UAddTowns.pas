unit UAddTowns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TAddTowns = class(TForm)
    btnAddCity: TBitBtn;
    mmo4add: TMemo;
    btnOk: TButton;
    btnFromFile: TButton;
    dlgOpen: TOpenDialog;
    procedure btnAddCityClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnFromFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddTowns: TAddTowns;

implementation

uses UMain;

{$R *.dfm}

procedure TAddTowns.btnAddCityClick(Sender: TObject);

var n,i:Integer;
begin
  Main.SG4view.ColCount := mmo4add.Lines.Count + 1;
  Main.SG4view.RowCount := mmo4add.Lines.Count + 1;
  Main.SG4view.Width:=Main.SG4view.DefaultColWidth*(Main.SG4view.ColCount)+20;
  Main.SG4view.Height:=Main.SG4view.DefaultRowHeight*(Main.SG4view.RowCount)+20;
  for i:=1 to mmo4add.Lines.Count do
  begin
    Main.SG4view.Cells[0,i]:=mmo4add.Lines[i-1];
    Main.SG4view.Cells[i,0]:=mmo4add.Lines[i-1];
  end;
  btnOk.Click;
end;

procedure TAddTowns.btnOkClick(Sender: TObject);
begin
  AddTowns.Close;
end;

procedure TAddTowns.btnFromFileClick(Sender: TObject);
begin
  if dlgOpen.Execute
  then
    mmo4add.Lines.LoadFromFile(dlgOpen.FileName);
  end;
end.

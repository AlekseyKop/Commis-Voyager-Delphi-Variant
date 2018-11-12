unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, UAddTowns, UUslovie, UZadacha, Gauges,
  Menus, ExtCtrls, jpeg;

type
  TMain = class(TForm)
    SG4view: TStringGrid;
    mmo_log: TMemo;
    lbl: TLabel;
    mm: TMainMenu;
    MmTableKM: TMenuItem;
    MmAddTowns: TMenuItem;
    MmRandomize: TMenuItem;
    MmViewSolve: TMenuItem;
    MmTask: TMenuItem;
    MmFill: TMenuItem;
    MmMura: TMenuItem;
    MmLog: TMenuItem;
    MmClear: TMenuItem;
    mmSaveToFile: TMenuItem;
    MmExit: TMenuItem;
    dlgSaveLog: TSaveDialog;
    g1: TGauge;
    procedure MmAddTownsClick(Sender: TObject);
    procedure MmRandomizeClick(Sender: TObject);
    procedure MmViewSolveClick(Sender: TObject);
    procedure MmFillClick(Sender: TObject);
    procedure MmMuraClick(Sender: TObject);
    procedure MmClearClick(Sender: TObject);
    procedure mmSaveToFileClick(Sender: TObject);
    procedure MmExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.MmAddTownsClick(Sender: TObject);
begin
  AddTowns.Visible:=True;
end;

procedure TMain.MmRandomizeClick(Sender: TObject);

var n,i,j,k:integer;
begin
  Randomize;
  n:=SG4view.ColCount;
  for i:=1 to n-1 do
    for j:=1 to n-1 do
    begin
      if (i=j)
      then SG4view.Cells[j,i] := '0'
      else
       begin
         repeat
          k:=Random(250);
         until k>10;
        SG4view.Cells[i,j] := IntToStr(k);
       end;
    end;
end;


procedure TMain.MmViewSolveClick(Sender: TObject);
begin
  Uslovie.Visible:=True;
end;

procedure TMain.MmFillClick(Sender: TObject);
var X:TDynamicMasN;
    i,n:integer;
    s4out:string;
    min:integer;
    t1,t2:TDateTime;
begin
  g1.Progress:=0;
  t1:=Time;
  mmo_log.Lines.Add(SysUtils.TimeToStr(Time) + ' Полный перебор');
  Application.ProcessMessages;
  x:=GetMinPut(SG4view,min,mmo_log,g1);
  mmo_log.Lines.Add('Минимальное расстояние: '+IntToStr(min));
  n:=Length(x);
  s4out:='';
  for i:=0 to n-1 do s4out:=s4out+SG4view.Rows[0][x[i]] + ' ';
  mmo_log.Lines.Add('Следует ехать так: ' + s4out);
  t2:=Time;
  mmo_log.Lines.Add(SysUtils.TimeToStr(Time) + ' Выполнено');
  t1:=t2-t1;
  mmo_log.Lines.Add('Время работы алгоритма ' + SysUtils.TimeToStr(t1));
  mmo_log.Lines.Add('-------------------------------------');
end;


procedure TMain.MmMuraClick(Sender: TObject);
var X:TDynamicMasN;
    i,n:integer;
    s4out:string;
    min:integer;
    t1,t2:TDateTime;
begin
  g1.Progress:=0;
  t1:=Time;
  mmo_log.Lines.Add(SysUtils.TimeToStr(Time) + ' Муравьиный алгоритм');
  x:=GetMinPutMuravii(SG4view,mmo_log,min,g1);
  mmo_log.Lines.Add('Минимальное расстояние: '+IntToStr(min));
  n:=Length(x);
  s4out:='';
  for i:=0 to n-1 do s4out:=s4out+SG4view.Rows[0][x[i]] + ' ';
  mmo_log.Lines.Add('Следует ехать так: ' + s4out);
  t2:=Time;
  mmo_log.Lines.Add(SysUtils.TimeToStr(Time) + ' Выполнено');
  t1:=t2-t1;
  mmo_log.Lines.Add('Время работы алгоритма ' + SysUtils.TimeToStr(t1));
  mmo_log.Lines.Add('-------------------------------------');
end;

procedure TMain.MmClearClick(Sender: TObject);
begin
  mmo_log.Clear;
  g1.Progress:=0;
end;

procedure TMain.mmSaveToFileClick(Sender: TObject);
begin
  if dlgSaveLog.Execute then
  mmo_log.Lines.SaveToFile(dlgSaveLog.FileName+'.txt');
end;

procedure TMain.MmExitClick(Sender: TObject);
begin
  if mmo_log.text<>'' then
  case MessageDlg('Сохранить лог?',mtWarning,(mbYesNoCancel),0) of
  mrYes:
    begin
      mmSaveToFile.Click;
      close;
    end;
  mrNo: close;
  mrCancel: ;
  end
  else close;
end;

end.

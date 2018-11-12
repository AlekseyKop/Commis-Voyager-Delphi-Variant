program Project1;

uses
  Forms,
  UMain in 'UMain.pas' {Main},
  UAddTowns in 'UAddTowns.pas' {AddTowns},
  UUslovie in 'UUslovie.pas' {Uslovie},
  UZadacha in 'UZadacha.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TAddTowns, AddTowns);
  Application.CreateForm(TUslovie, Uslovie);
  Application.Run;
end.

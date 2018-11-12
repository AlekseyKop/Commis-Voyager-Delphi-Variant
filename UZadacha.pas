unit UZadacha;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, UAddTowns, UUslovie, Gauges;

type
  MySet = set of 0..255;
  TAnt = record
          P:Integer;
           gorod:integer;
         end;
  TDynamicMasNN = array of array of Integer;
  TDynamicMasN = array of Integer;
  TDynamicMasNNReal = array of array of Real;
  TDynamicMasNAnt = array of Tant;

function NextP(var p:TDynamicMasN):boolean; //��������� ��������� ��������� ������������
function FromSGtoDynamicMas(SG:TStringGrid):TDynamicMasNN; //��������� �� ����������� � ������������ ������
procedure Swap(var a,b:Integer);//������ �������
function GetKm(var X:TDynamicMasN; var TR:TDynamicMasNN):Integer; //���� ����������, ���� ������ �� ����
//�������������� � ������� X � ���������� ������ �� ������� ���������� (TR)
  function GetMinPut(var SG:TStringGrid; var min:integer; Mm:Tmemo; var g1:TGauge):TDynamicMasN;//�� �������� ����� ������, ���� �� ���� ������ ������� ����������. ���� ������� ������� � ����
//� ��� ���� �������� �����������
function faktorial(var n:Integer):Integer;
function GetMinPutMuravii(var SG:TStringGrid; Mm:Tmemo; var min:Integer; var g1:TGauge):TDynamicMasN;

implementation

procedure Swap(var a,b:Integer);
	  var c:integer;
	begin
    c:=a;
    a:=b;
    b:=c;
  end;

function faktorial(var n:Integer):Integer;
var i:integer;
begin
      result:=1;
      for i:=1 to n do result:=result*i;
end;

function NextP(var p:TDynamicMasN):boolean;
	var i,n,j:integer;
  begin
    n:=Length(p);
    i:=n-1;
    while (i>0) and (p[i]<p[i-1]) do dec(i);
    if i=1 then result:=false
    else
      begin
        j:=n-1;
        while p[j]<p[i-1] do dec(j);
        swap(p[i-1],p[j]);
        j:=0;
        while (j<=(n-i)/2-1) do
        begin
          Swap(p[i+j],p[n-j-1]);
          Inc(j);
        end;
        result:=true
      end ;
  end  ;

  function FromSGtoDynamicMas(SG:TStringGrid):TDynamicMasNN;
  var i,j,n:Integer;
      ok:Boolean;
  begin
    n:=SG.ColCount-1;
    SetLength(Result,n,n);
    ok:=False;
    for i:=0 to n-1 do
      for j:=0 to n-1 do
        if (SG.Cells[j+1,i+1]<>'')
        then Result[i,j]:=StrToInt(SG.Cells[j+1,i+1])
        else
          begin
            Result[i,j]:=0;
            ok:=True;
          end;
    if ok then ShowMessage('� ������� ���� ������ ������. ���������� �� 0');
  end;


  function GetKm(var X:TDynamicMasN; var TR:TDynamicMasNN):Integer;
  var i,n:Integer;
  begin
    n:=Length(x);
    result:=0;
    for i:=0 to n-2 do
      result:=result+TR[X[i]-1,X[i+1]-1] ;
    result:=result+TR[x[n-1]-1,x[0]-1];
  end;

  function GetMinPut(var SG:TStringGrid; var min:integer; Mm:Tmemo; var g1:TGauge):TDynamicMasN;
  var TR:TDynamicMasNN;
      i,n:Integer;
      X:TDynamicMasN;
      tmp:Integer;
  begin
    g1.Progress:=0;
    TR := FromSGtoDynamicMas(SG);
    n:= Length(TR);
    SetLength(x,n);
    for i:=0 to n-1 do X[i]:=i+1;
    SetLength(Result,n);
    g1.MinValue:=0;
    g1.MaxValue:=faktorial(n);
    min:=GetKm(X,TR);
    {s4:=IntToStr(min) + ' ��.';
    for i:=0 to n-1 do
      begin
        Result[i]:=X[i];
        s4:=s4+' '+SG.Rows[0][x[i]];
      end;
    Mm.Lines.Add(s4); }
      repeat
        tmp:=GetKm(X,TR);
        {s4:=IntToStr(tmp) + ' ��.';
        for i:=0 to n-1 do s4:=s4+' '+SG.Rows[0][x[i]];
        Mm.Lines.Add(s4);}
        if tmp<min
        then
          begin
            min:=tmp;
            for i:=0 to n-1 do Result[i]:=X[i];
          end;
        g1.AddProgress(9);
      until not NextP(X);
      g1.Progress:=100;
  end;

  function stepen(a:Real; b:Integer):Real;
  var i:Integer;
  begin
    if b = 0 then Result:=1
    else
      begin
        Result:=1;
        for i:=1 to b do
        result:=result*a;
      end;
  end;

  procedure dropAnts(var M:TDynamicMasN; var n:integer);
  var
    temp:TDynamicMasN;
    k,i,j,t:Integer;
  begin
    k:=n;
    SetLength(temp,n);
    for i:=0 to k-1 do temp[i]:=i+1;
    SetLength(M,n+1);
    for j:=1 to n do M[j]:=-1;
    (*!!!!!*)
    for i:=0 to n-1 do
    begin
      repeat
        t:=Random(n)+1;
      until m[t]=-1;
      m[t]:=temp[i];
    end;
  end;

  procedure GetPut4OneAnt(var x:TDynamicMasN; const r:TDynamicMasNNReal;
  const NU:TDynamicMasNNReal; alfa,beta:Integer);
  var p,j,i,n,rand:integer;
  qq,znam:real;
  temp_real:array of real;
  ok:boolean;
  temp_set:MySet;
  begin
  n:=Length(x);
  i:=x[0];
  temp_set:=[i];
  for p:=1 to n-1 do  //������� ����� ��� ����� �������
             begin
              SetLength(temp_real,n+1); //������� ������������ ��������� ������ J
                znam:=0;
                for j:=1 to n do //����� �� �������. ��� � ����� ��������� ����������� �� �������
                if not (j in temp_set)
                then
                  znam:=znam+(stepen(r[i-1,j-1],alfa) * stepen(NU[i-1,j-1],beta));
                //������ ������ ����������� ����� �� ������ ����� 0, �� ����� ����������������
                if znam=0 then znam:=1;
                //������������ ����������� ��������� j ������
                //� �������� �� �������
                for j:=1 to n do
                  begin
                    if not (j in temp_set)
                    then
                      temp_real[j]:=(stepen(r[i-1,j-1],alfa) * stepen(NU[i-1,j-1],beta))/znam
                    else
                      temp_real[j]:=0;
                    temp_real[j]:=temp_real[j]*1000000;

                  end;
              {Mm.Lines.Add('����������� ��������� ������� ������');
              Mm.Lines.Add(temp_s);  }
              //����� �������
              rand:=random(1000000);
              //������ �� ������� ������������ ������ ���-�� ��������� �����
              qq:=0;
              temp_real[0]:=qq;
              for j:=1 to n do
              begin
                qq:=qq+temp_real[j];
                temp_real[j]:=qq;
              end;
              {Mm.Lines.Add('���� �����');
              for j:=0 to n do
                    temp_s:=temp_s+IntToStr(Round(temp_real[j]))+' ';
              Mm.Lines.Add(temp_s);
              Mm.Lines.Add(IntToStr(rand) + ' ��� ������'); }
              j:=0;
              ok:=True;
              //�������, ���� �� ��������� ������.
              while ok and (j<n) do
              begin
                if (rand>temp_real[j]) and (rand<temp_real[j+1])
                then ok:=False
                else inc(j);
              end;
              if j<n then inc(j);
              //j - ����� ������ ������, �� ��������� ������� ������������
              //� �����, ���������� �� ���
              //Mm.Lines.Add('��� � ����� '+IntTostr(j));
              //�������� ����� � ���� �������
              x[p]:=j;
              //� ��������� ����� � ������ ��������
              temp_set:=temp_set+[j];
             end;
  end;
  function GetMinPutMuravii(var SG:TStringGrid; Mm:Tmemo; var min:Integer; var g1:TGauge):TDynamicMasN;
  var
    D:TDynamicMasNN; //������� ����������
    alfa,beta:Integer; //�����������
    X:TDynamicMasN; //��������� �����������
    NU:TDynamicMasNNReal; //������� � ���������� ��������� �����������
    n:Integer; //����������� ������, ���-�� �������
    M:TDynamicMasN;
    k,i,j,t,p:Integer;
    tmax:integer; //������� ������� ����� �������
    r:TDynamicMasNNReal; //������� �������� �� ������
    temp_set:Myset; //��-�� - ������������ ��� �������� ������ ��������
    qq,p_isp:real;
    L:TDynamicMasN; //����� ���� ��� ������� �������
  begin
    D:=FromSGtoDynamicMas(SG); //������� ������� ����������
    n:= Length(D); //��������� �����������
    setlength(x,n);
    SetLength(Result,n);
    for i:=0 to n-1 do X[i]:=i+1;
    min:=GetKm(X,D); //�������� ������� ��� ����
    for p:=0 to n-1 do Result[p]:=X[p]; //� ��������� ���� ����
    SetLength(NU,n,n);
    SetLength(L,n+1);
    for i:=0 to n-1 do
      for j:=0 to n-1 do
        if D[i,j]<>0 then NU[i,j]:=1/D[i,j] else NU[i,j]:=0;
    tmax:=n*100; //����� ������� ��� ������� ������ ���������.
    g1.MinValue:=0;
    g1.MaxValue:=tmax;
    alfa:=2; // ����������� ���� ����� ������� �������� ��� 8-9 �������.
    beta:=3; // ��� 10 ������� ���� ��������� ����� ����� ��������
    p_isp:=0.3; // � ����� ���� ��������� �� 10 ������� ���� ������� � 5%
    SetLength(r,n,n);
    for i:=0 to n-1 do
      for j:=0 to n-1 do
        r[i,j]:=10.0; //��������� ������� ��������

    for t:=1 to tmax do
      begin
        Randomize;
        dropAnts(M,n); //������ �������� � ������ ��� ����������
        for k:=1 to n do //����� �������
          begin
            x[0]:=M[k]; //� �� ������� �� ����� ������ � �������������� �������
            GetPut4OneAnt(x,r,nu,alfa,beta); //� ������� x ����� ���� �������
            //���������� ����������, ������� ������ �������
            L[k]:=GetKm(X,D);
            //� ���� ��� ���������� ������ ������������ ����
            //�� ���������� ��� ���������� � ���� ����
            if (L[k]<min)
            then
              begin
                min:= L[k];
                for p:=0 to n-1 do Result[p]:=X[p];
              end;
          end;
            //� �������� ������� ����� �������� �������
            //�������� ��������, �� ��������
          qq:=0;
          //��� ����� ����� � ����������� �� ������������ ���� � ���� ����� ��������
          for k:=1 to n do qq:=qq+min/L[k];
          for i:=0 to n-1 do
            for j:=0 to n-1 do
            if i<>j then r[i,j]:=(1-p_isp)*r[i,j]+qq;
          g1.AddProgress(1);
          Application.ProcessMessages;
      end;

  end;


end.

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Menus;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    Shape1: TShape;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Shape2: TShape;
    RadioButton6: TRadioButton;
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MainMenu1: TMainMenu;
    Opcje1: TMenuItem;
    Losuj1: TMenuItem;
    N1: TMenuItem;
    Autor1: TMenuItem;
    Oprogramie1: TMenuItem;
    N2: TMenuItem;
    h1: TMenuItem;
    n3: TMenuItem;
    d1: TMenuItem;
    lpoziom: TLabel;
    procedure d1Click(Sender: TObject);
    procedure n3Click(Sender: TObject);
    procedure h1Click(Sender: TObject);
    procedure Oprogramie1Click(Sender: TObject);
    procedure Losuj1Click(Sender: TObject);
    procedure Autor1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure pzakres(Sender: TObject);            //podstaw zakres
    procedure pilosc(Sender: TObject);            //podstaw iloœæ
    procedure plos(Sender: TObject);            // losój
    procedure phlos(Sender: TObject);            // losój  WYSOKO
    procedure pdlos(Sender: TObject);            // losój  nisko
    procedure pd(Sender: TObject);            // podstaw dane
    procedure oczyszd(Sender: TObject);            // oczysc dane
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  zakres : integer;
  ilosc : integer;
  w1,w2,w3,w4:integer;
  wyniki : array[1..4] of integer;

implementation

{$R *.dfm}

procedure TForm1.pzakres(Sender: TObject);
begin
if RadioButton1.Checked = true then
zakres:=6;

if RadioButton2.Checked = true then
zakres:=4;

if RadioButton3.Checked = true then
zakres:=8;

if RadioButton4.Checked = true then
zakres:=12;

if RadioButton5.Checked = true then
zakres:=20;

if RadioButton6.Checked = true then
zakres:=StrtoInt(Edit1.Text);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
pzakres(Sender);
pilosc(Sender);

if n3.Checked = true then
plos(Sender);

if h1.Checked = true then
phlos(Sender);

if d1.Checked = true then
pdlos(Sender);


oczyszd(Sender);


end;

procedure TForm1.pilosc(Sender: TObject);            // podstaw iloœæ
begin
if RadioButton7.Checked = true then
ilosc:=1;

if RadioButton8.Checked = true then
ilosc:=2;

if RadioButton9.Checked = true then
ilosc:=3;

if RadioButton10.Checked = true then
ilosc:=4;


end;

procedure TForm1.plos(Sender: TObject);            // losój
var a:integer;
begin
Randomize();


For a := 1 to ilosc do
wyniki[a]:=Random(zakres) + 1;

pd(Sender);


end;

procedure TForm1.phlos(Sender: TObject);            // losój
var a:integer;
begin
Randomize();


For a := 1 to ilosc do
wyniki[a]:=round((100 - Random(9))/100* zakres);

pd(Sender);

n3.Click;           // ustawia normalnie

end;

procedure TForm1.pdlos(Sender: TObject);            // losój
var a:integer;
begin
Randomize();


For a := 1 to ilosc do
wyniki[a]:=round(Random(8)/100* zakres) + 1;

pd(Sender);

n3.Click;           // ustawia normalnie
end;

procedure TForm1.pd(Sender: TObject);            // podstaw dane
begin
//if not wyniki[1] or wyniki[2] or wyniki[3] or wyniki[4] = 0 then
//begin
Label4.Caption:='1 =  ' + IntToStr(wyniki[1]);
Label5.Caption:='2 =  ' + IntToStr(wyniki[2]);
Label6.Caption:='3 =  ' + IntToStr(wyniki[3]);
Label7.Caption:='4 =  ' + IntToStr(wyniki[4]);
//end
//else
//plos(Sender);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
zakres:=6;
ilosc:=1;
end;

procedure TForm1.Autor1Click(Sender: TObject);
begin
Application.MessageBox('Autorem programu jest Tomasz Potañski','Autor',MB_OK+MB_ICONINFORMATION)
end;

procedure TForm1.Losuj1Click(Sender: TObject);
begin
Button1.Click;
end;

procedure TForm1.oczyszd(Sender: TObject);            // oczysc dane
begin

wyniki[1] := 0;
wyniki[2] := 0;
wyniki[3] := 0;
wyniki[4] := 0;

end;

procedure TForm1.Oprogramie1Click(Sender: TObject);
begin
Application.MessageBox('Program zosta³ stworzony do losowania ró¿nych liczb. Pierwotnym celem programu by³o zast¹pienie kostek do gier.','O programie',MB_OK+MB_ICONINFORMATIOn);
end;

procedure TForm1.h1Click(Sender: TObject);
begin
lpoziom.Caption:='H';
end;

procedure TForm1.n3Click(Sender: TObject);
begin
lpoziom.Caption:='N';
end;

procedure TForm1.d1Click(Sender: TObject);
begin
lpoziom.Caption:='D';
end;

end.
